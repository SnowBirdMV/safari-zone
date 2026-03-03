# Marks currently loaded Pixelmon NPC entities as persistent.
# This does not load chunks; run it while near your placed NPCs.
execute as @e[type=pixelmon:npc] run data merge entity @s {PersistenceRequired:1b}
