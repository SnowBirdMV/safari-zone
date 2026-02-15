#!/usr/bin/env bash
set -euo pipefail

# Regenerates the debug function that spawns all NPC presets in a grid.
# Usage:
#   scripts/generate_spawn_all_npcs_line.sh
#   scripts/generate_spawn_all_npcs_line.sh "run/saves/New World/datapacks/pixelmon_research_example"
#   scripts/generate_spawn_all_npcs_line.sh "<datapack_dir>" [grid_columns] [front_offset] [column_spacing] [row_spacing] [section_gap]

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

INPUT_DATAPACK_DIR="${1:-}"
GRID_COLUMNS="${2:-10}"
FRONT_OFFSET="${3:-4}"
COLUMN_SPACING="${4:-2}"
ROW_SPACING="${5:-4}"
SECTION_GAP="${6:-4}"

resolve_datapack_dir() {
  local candidate
  if [[ -n "$INPUT_DATAPACK_DIR" ]]; then
    if [[ -d "$INPUT_DATAPACK_DIR" ]]; then
      printf '%s\n' "$INPUT_DATAPACK_DIR"
      return 0
    fi
    candidate="$REPO_ROOT/$INPUT_DATAPACK_DIR"
    if [[ -d "$candidate" ]]; then
      printf '%s\n' "$candidate"
      return 0
    fi
    return 1
  fi

  local default_candidates=(
    "$REPO_ROOT/run/saves/New World/datapacks/pixelmon_research_example"
    "$REPO_ROOT/datapacks/pixelmon_research_example"
  )
  for candidate in "${default_candidates[@]}"; do
    if [[ -d "$candidate/data/safari-zone/pixelmon/npc/preset/areas" ]]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done
  return 1
}

if ! DATAPACK_DIR="$(resolve_datapack_dir)"; then
  echo "Could not resolve datapack directory." >&2
  echo "Tried input: ${INPUT_DATAPACK_DIR:-<none>}" >&2
  echo "Expected one of:" >&2
  echo "  $REPO_ROOT/run/saves/New World/datapacks/pixelmon_research_example" >&2
  echo "  $REPO_ROOT/datapacks/pixelmon_research_example" >&2
  exit 1
fi

if ! [[ "$GRID_COLUMNS" =~ ^[0-9]+$ ]] || (( GRID_COLUMNS < 1 )); then
  echo "Invalid grid_columns value: $GRID_COLUMNS (must be an integer >= 1)" >&2
  exit 1
fi

for value_name in FRONT_OFFSET COLUMN_SPACING ROW_SPACING SECTION_GAP; do
  value="${!value_name}"
  if ! [[ "$value" =~ ^[0-9]+$ ]]; then
    echo "Invalid $value_name value: $value (must be an integer >= 0)" >&2
    exit 1
  fi
done

PRESET_DIR="$DATAPACK_DIR/data/safari-zone/pixelmon/npc/preset/areas"
OUTPUT_DIR="$DATAPACK_DIR/data/safari-zone/function/debug"
DISPATCH_FILE="$OUTPUT_DIR/spawn_all_npcs_line.mcfunction"
SOUTH_FILE="$OUTPUT_DIR/spawn_all_npcs_line_south.mcfunction"
NORTH_FILE="$OUTPUT_DIR/spawn_all_npcs_line_north.mcfunction"
EAST_FILE="$OUTPUT_DIR/spawn_all_npcs_line_east.mcfunction"
WEST_FILE="$OUTPUT_DIR/spawn_all_npcs_line_west.mcfunction"

if [[ ! -d "$PRESET_DIR" ]]; then
  echo "Preset directory not found: $PRESET_DIR" >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

mapfile -t preset_files < <(find "$PRESET_DIR" -type f -name "*.json" | sort)

if [[ ${#preset_files[@]} -eq 0 ]]; then
  echo "No preset JSON files found under: $PRESET_DIR" >&2
  exit 1
fi

to_rel_coord() {
  local n="$1"
  if (( n == 0 )); then
    printf '~'
  else
    printf '~%d' "$n"
  fi
}

area_display_name() {
  case "$1" in
    visitor_center) echo "Visitor Center" ;;
    timberland_village) echo "Timberland Village" ;;
    ancient_crater) echo "Ancient Crater" ;;
    mystic_highlands) echo "Mystic Highlands" ;;
    scorched_mesa) echo "Scorched Mesa" ;;
    twilight_keep) echo "Twilight Keep" ;;
    neon_grove) echo "Neon Grove" ;;
    *) echo "${1//_/ }" ;;
  esac
}

emit_spawn_for_all_directions() {
  local preset_id="$1"
  local left_offset="$2"
  local forward_offset="$3"

  local south_dx south_dz north_dx north_dz east_dx east_dz west_dx west_dz
  south_dx="$left_offset"
  south_dz="$forward_offset"
  north_dx=$(( -left_offset ))
  north_dz=$(( -forward_offset ))
  east_dx="$forward_offset"
  east_dz="$left_offset"
  west_dx=$(( -forward_offset ))
  west_dz=$(( -left_offset ))

  printf 'execute as @p at @s run npc spawnlinked safari-zone:areas/%s %s ~ %s\n' \
    "$preset_id" "$(to_rel_coord "$south_dx")" "$(to_rel_coord "$south_dz")" >> "$SOUTH_FILE"
  printf 'execute as @p at @s run npc spawnlinked safari-zone:areas/%s %s ~ %s\n' \
    "$preset_id" "$(to_rel_coord "$north_dx")" "$(to_rel_coord "$north_dz")" >> "$NORTH_FILE"
  printf 'execute as @p at @s run npc spawnlinked safari-zone:areas/%s %s ~ %s\n' \
    "$preset_id" "$(to_rel_coord "$east_dx")" "$(to_rel_coord "$east_dz")" >> "$EAST_FILE"
  printf 'execute as @p at @s run npc spawnlinked safari-zone:areas/%s %s ~ %s\n' \
    "$preset_id" "$(to_rel_coord "$west_dx")" "$(to_rel_coord "$west_dz")" >> "$WEST_FILE"
}

emit_label_for_all_directions() {
  local label_text="$1"
  local forward_offset="$2"
  local safe_label
  safe_label="${label_text//\"/\\\"}"

  # Center label for each section.
  local south_dx=0 south_dz="$forward_offset"
  local north_dx=0 north_dz=$(( -forward_offset ))
  local east_dx="$forward_offset" east_dz=0
  local west_dx=$(( -forward_offset )) west_dz=0

  printf "execute as @p at @s run summon minecraft:armor_stand %s ~2 %s {Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{\\\"text\\\":\\\"%s\\\",\\\"color\\\":\\\"aqua\\\",\\\"bold\\\":true}',CustomNameVisible:1b,Tags:[\\\"safari_zone_npc_grid_label\\\"]}\n" \
    "$(to_rel_coord "$south_dx")" "$(to_rel_coord "$south_dz")" "$safe_label" >> "$SOUTH_FILE"
  printf "execute as @p at @s run summon minecraft:armor_stand %s ~2 %s {Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{\\\"text\\\":\\\"%s\\\",\\\"color\\\":\\\"aqua\\\",\\\"bold\\\":true}',CustomNameVisible:1b,Tags:[\\\"safari_zone_npc_grid_label\\\"]}\n" \
    "$(to_rel_coord "$north_dx")" "$(to_rel_coord "$north_dz")" "$safe_label" >> "$NORTH_FILE"
  printf "execute as @p at @s run summon minecraft:armor_stand %s ~2 %s {Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{\\\"text\\\":\\\"%s\\\",\\\"color\\\":\\\"aqua\\\",\\\"bold\\\":true}',CustomNameVisible:1b,Tags:[\\\"safari_zone_npc_grid_label\\\"]}\n" \
    "$(to_rel_coord "$east_dx")" "$(to_rel_coord "$east_dz")" "$safe_label" >> "$EAST_FILE"
  printf "execute as @p at @s run summon minecraft:armor_stand %s ~2 %s {Invisible:1b,NoGravity:1b,Marker:1b,CustomName:'{\\\"text\\\":\\\"%s\\\",\\\"color\\\":\\\"aqua\\\",\\\"bold\\\":true}',CustomNameVisible:1b,Tags:[\\\"safari_zone_npc_grid_label\\\"]}\n" \
    "$(to_rel_coord "$west_dx")" "$(to_rel_coord "$west_dz")" "$safe_label" >> "$WEST_FILE"
}

{
  echo "# Auto-generated by scripts/generate_spawn_all_npcs_line.sh"
  echo "# Source directory: $PRESET_DIR"
  echo "# Direction: SOUTH (+Z forward)"
  echo "# Run as player: /function safari-zone:debug/spawn_all_npcs_line"
  echo
} > "$SOUTH_FILE"

{
  echo "# Auto-generated by scripts/generate_spawn_all_npcs_line.sh"
  echo "# Source directory: $PRESET_DIR"
  echo "# Direction: NORTH (-Z forward)"
  echo "# Run as player: /function safari-zone:debug/spawn_all_npcs_line"
  echo
} > "$NORTH_FILE"

{
  echo "# Auto-generated by scripts/generate_spawn_all_npcs_line.sh"
  echo "# Source directory: $PRESET_DIR"
  echo "# Direction: EAST (+X forward)"
  echo "# Run as player: /function safari-zone:debug/spawn_all_npcs_line"
  echo
} > "$EAST_FILE"

{
  echo "# Auto-generated by scripts/generate_spawn_all_npcs_line.sh"
  echo "# Source directory: $PRESET_DIR"
  echo "# Direction: WEST (-X forward)"
  echo "# Run as player: /function safari-zone:debug/spawn_all_npcs_line"
  echo
} > "$WEST_FILE"

declare -A area_to_ids
declare -A area_seen
declare -A area_counts
areas_found=()

for preset_path in "${preset_files[@]}"; do
  relative_path="${preset_path#"$PRESET_DIR"/}"
  preset_id="${relative_path%.json}"
  area_key="${relative_path%%/*}"

  area_to_ids["$area_key"]+="$preset_id|"
  area_counts["$area_key"]=$(( ${area_counts["$area_key"]:-0} + 1 ))
  if [[ -z "${area_seen[$area_key]+x}" ]]; then
    area_seen["$area_key"]=1
    areas_found+=("$area_key")
  fi
done

ordered_areas=()
preferred_areas=(
  "visitor_center"
  "timberland_village"
  "ancient_crater"
  "mystic_highlands"
  "scorched_mesa"
  "twilight_keep"
  "neon_grove"
)

for area_key in "${preferred_areas[@]}"; do
  if [[ -n "${area_seen[$area_key]+x}" ]]; then
    ordered_areas+=("$area_key")
    unset 'area_seen[$area_key]'
  fi
done

for area_key in "${areas_found[@]}"; do
  if [[ -n "${area_seen[$area_key]+x}" ]]; then
    ordered_areas+=("$area_key")
  fi
done

current_forward="$FRONT_OFFSET"
for area_key in "${ordered_areas[@]}"; do
  count="${area_counts[$area_key]}"
  if (( count == 0 )); then
    continue
  fi

  area_label="$(area_display_name "$area_key")"
  label_forward=$(( current_forward - 2 ))
  if (( label_forward < 1 )); then
    label_forward=1
  fi

  echo >> "$SOUTH_FILE"
  echo "# --- $area_label ---" >> "$SOUTH_FILE"
  echo >> "$NORTH_FILE"
  echo "# --- $area_label ---" >> "$NORTH_FILE"
  echo >> "$EAST_FILE"
  echo "# --- $area_label ---" >> "$EAST_FILE"
  echo >> "$WEST_FILE"
  echo "# --- $area_label ---" >> "$WEST_FILE"

  emit_label_for_all_directions "$area_label" "$label_forward"

  IFS='|' read -r -a area_ids <<< "${area_to_ids[$area_key]}"
  for idx in "${!area_ids[@]}"; do
    preset_id="${area_ids[$idx]}"
    if [[ -z "$preset_id" ]]; then
      continue
    fi

    row=$(( idx / GRID_COLUMNS ))
    slot=$(( idx % GRID_COLUMNS ))
    if (( slot == 0 )); then
      left_offset=0
    else
      step=$(( (slot + 1) / 2 ))
      if (( slot % 2 == 1 )); then
        left_offset=$(( step * COLUMN_SPACING ))
      else
        left_offset=$(( -step * COLUMN_SPACING ))
      fi
    fi
    forward_offset=$(( current_forward + (row * ROW_SPACING) ))

    emit_spawn_for_all_directions "$preset_id" "$left_offset" "$forward_offset"
  done

  rows_for_area=$(( (count + GRID_COLUMNS - 1) / GRID_COLUMNS ))
  current_forward=$(( current_forward + (rows_for_area * ROW_SPACING) + SECTION_GAP ))
done

{
  echo "# Auto-generated by scripts/generate_spawn_all_npcs_line.sh"
  echo "# Source directory: $PRESET_DIR"
  echo "# Run as player: /function safari-zone:debug/spawn_all_npcs_line"
  echo "# Grid settings: columns=$GRID_COLUMNS, front_offset=$FRONT_OFFSET, column_spacing=$COLUMN_SPACING, row_spacing=$ROW_SPACING, section_gap=$SECTION_GAP"
  echo "# Cardinal aligned grid: no diagonal placement."
  echo "# Grouped by location with floating labels."
  echo "# Uses player yaw only (pitch ignored) and player height."
  echo
  echo "# Remove old section labels from previous test runs (near the player)."
  echo "execute as @p at @s run kill @e[type=minecraft:armor_stand,tag=safari_zone_npc_grid_label,distance=..256]"
  echo
  echo "# South"
  echo "execute as @p at @s if entity @s[y_rotation=-44.999..44.999] run function safari-zone:debug/spawn_all_npcs_line_south"
  echo "# West"
  echo "execute as @p at @s if entity @s[y_rotation=45..134.999] run function safari-zone:debug/spawn_all_npcs_line_west"
  echo "# East"
  echo "execute as @p at @s if entity @s[y_rotation=-134.999..-45] run function safari-zone:debug/spawn_all_npcs_line_east"
  echo "# North (split for wraparound)"
  echo "execute as @p at @s if entity @s[y_rotation=135..180] run function safari-zone:debug/spawn_all_npcs_line_north"
  echo "execute as @p at @s if entity @s[y_rotation=-180..-135] run function safari-zone:debug/spawn_all_npcs_line_north"
} > "$DISPATCH_FILE"

echo "Generated: $DISPATCH_FILE"
echo "Generated: $SOUTH_FILE"
echo "Generated: $NORTH_FILE"
echo "Generated: $EAST_FILE"
echo "Generated: $WEST_FILE"
echo "NPC presets included: ${#preset_files[@]}"
