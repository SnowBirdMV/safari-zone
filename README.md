```mermaid
%%{init: {"class": {"hideEmptyMembersBox": true}} }%%
classDiagram

class MapProgressionStart["Map Progression Start"]

class WelcomeToTheSafari["Welcome to the Safari!"] {
  NPC: Receptionist
  Area: Visitor Center
  Starting Location: Visitor Center lobby
  Objective: Purchase a Safari Pass
  Quest Icon Sprite: pixelmon:textures/gui/research/money_pouch.png
  Reward: Nothing
  Turn In NPC: Gate Receptionist
  NPC Model Texture: pixelmon:textures/steve/shoplady.png
  Description 1: Welcome to the safari! Please purchase your pass.
  Description 2: Then head downstairs toward the safari gate and give it to the clerk.
  Description 3: That lets you enter Timberland Village.
  Talk Again Active: Take your pass underground and hand it to the ticket clerk at the booth.
  After Completion: Perfect. Your pass is ready to be handed in at the underground ticket gate.
}

class HandingInThePass["Handing in the pass"] {
  NPC: Gate Receptionist
  Area: Visitor Center
  Starting Location: Visitor Center ticket gate underground
  Objective: Give the Safari Pass to the ticket clerk
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Ticket Clerk
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Head underground in the visitor center.
  Description 2: Follow the long hallway until you reach the ticket booth.
  Talk Early: First, buy your Safari Pass upstairs at reception, then bring it down here.
  Talk Again Active: Go down this hallway and give your pass to the ticket clerk.
  After Completion: Pass received. You can continue on to the main lab in Timberland Village.
}

class TimberlandVillageLab["Timberland Village Lab"] {
  NPC: Ticket Clerk
  Area: Visitor Center
  Starting Location: Visitor Center ticket gate underground
  Objective: Head to the Timberland Village Lab
  Quest Icon Sprite: pixelmon:textures/gui/research/exclamation.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/shopman.png
  Description 1: The ticket clerk tells you to go to the Timberland Village lab.
  Description 2: This is where you get started in the Safari Zone.
  Talk Early: I need your pass processed first. Hand it to the underground clerk at the booth.
  Talk Again Active: Your next stop is the main lab in Timberland Village. Head there and check in.
  After Completion: Good work reaching the lab. The scientists can brief you on regional work.
}

class PanicInTheJurassic["Panic in the Jurassic"] {
  NPC: Dr. Petra Stone
  Area: Ancient Crater
  Starting Location: Timberland Village Lab, Building 1, basement
  Objective: Find the Mobile Research Lab in the Ancient Crater
  Quest Icon Sprite: pixelmon:textures/gui/research/encounter_grass.png
  Reward: Nothing
  Turn In NPC: MRU Lead Orin
  NPC Model Texture: pixelmon:textures/steve/scientist_m.png
  Description 1: Ancient Crater scientists lost contact with colleagues in the bottom on-site lab.
  Description 2: A rescue team was dispatched in a high-tech MRU vehicle.
  Description 3: Go into the crater, meet the MRU, and provide assistance.
  Talk Early: Check in at the main lab in Timberland Village first. They assign Ancient Crater support.
  Talk Again Active: Go to the bottom of Ancient Crater and find the MRU team.
  After Completion: Thank you. The crater team has the help they needed.
}

class AMysticalResearch["A Mystical Research"] {
  NPC: Dr. Lyra Quill
  Area: Mystic Highlands
  Starting Location: Timberland Village Lab, Building 1, second floor
  Objective: Find the Mystic Highlands Laboratory
  Quest Icon Sprite: pixelmon:textures/gui/research/wisteria.png
  Reward: Nothing
  Turn In NPC: Researcher Ione
  NPC Model Texture: pixelmon:textures/steve/scientist_f.png
  Description 1: The Highlands team needs help with unique purple crystal research.
  Description 2: Meet their colleagues at the Mystic Highlands Laboratory.
  Talk Early: Visit the main lab in Timberland Village first. They handle all Highlands assignments.
  Talk Again Active: Travel to Mystic Highlands Laboratory and assist the crystal researchers.
  After Completion: Excellent. Your help keeps the Highlands crystal study moving.
}

class ToCatchATrain["To Catch a Train"] {
  NPC: Rafe Calder
  Area: Scorched Mesa
  Starting Location: Timberland Village Lab, Building 1, third floor
  Objective: Head to the train station
  Quest Icon Sprite: pixelmon:textures/gui/research/question.png
  Reward: Nothing
  Turn In NPC: Arthur
  NPC Model Texture: pixelmon:textures/steve/engineer.png
  Description 1: The Scorched Mesa scientists need help.
  Description 2: Meet their colleague at the train station to head farther west.
  Talk Early: Report to the main lab in Timberland Village first, then return for western assignments.
  Talk Again Active: Head to the train station and meet our colleague going farther west.
  After Completion: Great. You are cleared for the Scorched Mesa route.
}

class IntoTheTwilight["Into the Twilight"] {
  NPC: Selene Vire
  Area: Twilight Keep
  Starting Location: Timberland Village Lab, Building 2, second floor
  Objective: Head to the great manor in Twilight Keep
  Quest Icon Sprite: pixelmon:textures/gui/research/question.png
  Reward: Nothing
  Turn In NPC: Nikolai
  NPC Model Texture: pixelmon:textures/steve/ornithologist.png
  Description 1: Scientists are studying astronomy at the observatory in Twilight Keep.
  Description 2: Before meeting them, visit the lord in the great manor.
  Description 3: Declare your presence in the land.
  Talk Early: Stop by the main lab in Timberland Village first; they authorize Twilight Keep operations.
  Talk Again Active: Visit the great manor first, then proceed to the observatory scientists.
  After Completion: Well done. Your presence in Twilight Keep has been recognized.
}

class ABlessingFromTheLord["A Blessing from the Lord"] {
  NPC: Nikolai
  Area: Twilight Keep Manor
  Starting Location: Twilight Keep Manor
  Objective: Head to the Twilight Keep Observatory
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Observatory Head Scientist Viktor
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Ah… so you are the traveler I was told of. Welcome to the halls of Twilight Keep. It honors me that you declared your presence before wandering my lands.
  Description 2: You carry yourself with purpose. That is rare — and appreciated.
  Description 3: You have my blessing to travel freely throughout my domain. May the roads treat you kindly and the wild Pokémon show you respect.
  Description 4: As for the observatory you seek — you will find it across the river, west of here.
  Description 5: Follow the stone path down the hill, cross the old bridge, and continue until the small town comes into view against the sky.
  Talk Early: How dare you enter my domain without warning!
  Talk Again Active: The observatory you seek is across the river, west of here.
  After Completion: Go with my blessing, traveler.
}

class ToArms["To Arms!"] {
  NPC: Dimitar
  Area: Twilight Keep Armory
  Starting Location: Twilight Keep Armory
  Objective: Gather aluminum ingots for the Twilight Keep Armory
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Dimitar
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Ah, trainer! Just the one I was hoping to see.
  Description 2: I’m working on a special blade commission, but I’m short on refined material.
  Description 3: Honedge carry fragments of aluminum within their spectral steel — fascinating, isn’t it?
  Description 4: Do me a favor and take down a few Honedge, then bring me the Aluminum Ingots you gather from them.
  Talk Early: You must speak with our Lord before we can do business sir.
  Talk Again Active: There are plenty of Honedge around the keep.
  After Completion: Thank you so much for your help, a fine blade I shall make with this metal!
}

class TotallyNotSpells["Totally not spells..."] {
  NPC: Elena
  Area: Twilight Keep
  Starting Location: Twilight Keep sorcery building
  Objective: Gather candles for Elena
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Elena
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Hehe… oh! A visitor. Don’t mind the smoke — it’s just incense. Very normal incense.
  Description 2: I’m Elena. Herbalist. Hobbyist. Absolutely not a witch.
  Description 3: I happen to be in need of a few candles. Purely decorative, of course. The best kind come from Litwick — such lovely little flames they carry.
  Description 4: If you could gather some candles from Litwick for me, I would be ever so grateful. They burn longer… and brighter… and scream far less than store-bought ones.
  Description 5: Bring them to me, and I’ll reward you. Strictly for legal, non-magical purposes.
  Talk Early: I am not sure our Lord would appreciate us talking before he made your acquaintance sir.
  Talk Again Active: Oh! Did I say scream? I meant steam. Yes. Steam..
  After Completion: Thank you so much for your help! These are by far the best candles for strictly legal, non-magical purposes.
}

class SuppliesWhileLasted["Supplies while lasted"] {
  NPC: Ivan
  Area: Twilight Keep
  Starting Location: Twilight Keep storage building
  Objective: Gather charcoal for Ivan
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Ivan
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Hold it right there. You’re not here to borrow supplies without signing the ledger, are you?
  Description 2: I’m Ivan, quartermaster of Twilight Keep. If it burns, feeds, or fortifies these walls, it passes through my hands.
  Description 3: We’ve run dangerously low on charcoal. Forges are cooling, kitchens are complaining, and I refuse to hear another lecture from the blacksmith.
  Description 4: Charcadet have been dropping quality charcoal lately — burns hot and steady. Exactly what we need.
  Description 5: Go out, handle a few Charcadet, and bring me back the charcoal they drop. Keep the fires of this keep alive, and I’ll see that you’re properly compensated
  Talk Early: I will talk to non that has not been introduced to our Lord.
  Talk Again Active: Now move. Supplies don’t gather themselves.
  After Completion: You’ve done the keep a great service. I won’t forget it!
}

class SoldiersLikeNoneOther["Soldiers like none other"] {
  NPC: Luka
  Area: Twilight Keep
  Starting Location: Twilight Keep guard tower
  Objective: Catch Falinks for Luka
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Luka
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Hold it right there. State your business at the tower.
  Description 2: I’m Luka, captain of the western watch here at Twilight Keep. Every guard that stands these walls answers to me.
  Description 3: Our ranks are steady, but I seek something finer — discipline, unity, soldiers who move as one.
  Description 4: Falinks. Now there is a fine soldier. Six minds, one formation. You rarely see such order in the wild.
  Description 5: Go out and catch a few Falinks worthy of service. Bring proof of your capture, and you’ll have my respect — and your reward.
  Talk Early: I answer only to those who have stood before our Lord. Earn that right first.
  Talk Again Active: Well? The tower does not defend itself. Find me those Falinks.
  After Completion: Excellent work. Fine specimens — disciplined and battle-ready. You’ve done the keep a great service. I won’t forget it!
}

class TheDomainOfDarkness["The Domain of Darkness"] {
  NPC: Priest Mikhail
  Area: Twilight Keep
  Starting Location: Twilight Keep Church of 'Tres
  Objective: Catch various pokemon in the Twilight Keep
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Priest Mikhail
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Peace be upon you, traveler. You stand within sacred ground.
  Description 2: I am Priest Mikhail, humble servant of the true Lord of these lands — Moltres, the Eternal Flame of Darkness.
  Description 3: The wild Pokémon of this region are not mere creatures. They are His disciples, each carrying a spark of His divine fire.
  Description 4: To understand His will, one must walk among His followers. Catch the various Pokémon of this land and learn their strength, their nature, their devotion.
  Description 5: Go forth and gather these disciples under your guidance. Return to me with proof of your efforts, and you shall be rewarded — and blessed by the Dark Flame.
  Talk Early: One does not serve the Flame without first receiving the Lord’s acknowledgment. Present yourself properly before seeking holy work.
  Talk Again Active: The Flame watches. Continue your pilgrimage and gather His disciples.
  After Completion: Excellent work. Faithfully gathered and guided — true disciples of the Eternal Flame. You have honored Moltres and strengthened His presence in these lands. I will not forget your devotion.
}

class HospitalityInDarkness["Hospitality in Darkness"] {
  NPC: Charles
  Area: Twilight Keep
  Starting Location: Twilight Keep Hotel
  Objective: Bring feathers back to Charles
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Charles
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Oh. A guest? …Or just someone lost in the dark like the rest of us?
  Description 2: I’m Charles. Proprietor of this fine establishment. Bought it after… my wife left me saying I was crazy buying a hotel \"in the land of eternal **** darkness\".
  Description 3: …Business hasn’t exactly proven her wrong.
  Description 4: I barely get any guests, and when some do show up, the beds are lumpy, ‘cold stone ambiance’ isn’t a selling point, AH! A ghost!....yeah not good.
  Description 5: Mind helping out a friend in need? I could use some proper feathers for the pillows.
  Description 6: Murkrow drop good ones around here — plentiful, too.
  Description 7: If you could gather me some Murkrow feathers, maybe I can at least offer a decent night’s sleep. Help me save this place from becoming a very expensive mausoleum.
  Talk Early: Rooms are for paying guests only. And I can’t afford charity at the moment...
  Talk Again Active: Gosh why did she have to be so right…
  After Completion: These are… actually perfect. Soft. Full. Guests might finally stop leaving in the middle of the night. Thank you. Truly. Maybe this wasn’t a complete mistake after all.
}

class RiskeCuisine["Riské Cuisine"] {
  NPC: Milan
  Area: Twilight Keep
  Starting Location: Twilight Keep Hotel
  Objective: Gather pufferfish for Milan
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Milan
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: Ah! Careful where you step. Genius at work in this kitchen.
  Description 2: I am Milan — head chef of the Hotel. Some say my cuisine is ahead of its time. The unenlightened say it’s ‘ambitious.
  Description 3: The problem isn’t my talent. It’s the ingredients. One cannot craft culinary brilliance from mediocrity.
  Description 4: What I require is fresh pufferfish. Qwilfish in these waters carry the finest specimens — delicate, dangerous, divine.
  Description 5: Bring me pufferfish gathered from Qwilfish, and I shall create a dish so exquisite it will redefine dining in the Land of Eternal Darkness.
  Talk Early: I do not cook for amateurs. Return when you have business in this kitchen.
  Talk Again Active: Qwilfish awaits. Perfection does not source itself.
  After Completion: Ahhh… look at that texture. Superb quality. Yes, yes — this will do nicely. Why is my mouth all fuzzy…
}

class NextGenMedicine["Next Gen Medicine"] {
  NPC: Dr. Keira Holt
  Area: Neon Grove
  Starting Location: Timberland Village Lab, Building 1, first floor
  Objective: Head to Neon Grove Medical Center
  Quest Icon Sprite: pixelmon:textures/gui/research/money_pouch.png
  Reward: Nothing
  Turn In NPC: Nurse Ada
  NPC Model Texture: pixelmon:textures/steve/doctor.png
  Description 1: Scientists are using future technologies to advance medicine.
  Description 2: Deliver a parcel containing valuable cures.
  Description 3: Take it to the Neon Grove Medical Center.
  Talk Early: Check in at the main lab in Timberland Village first; they route Neon Grove deliveries.
  Talk Again Active: Deliver this medical parcel to Neon Grove Medical Center right away.
  After Completion: Delivery confirmed. The medical team has what they need.
}

class MySubscription["My subscription!"] {
  NPC: Frog Maniac
  Area: Timberland Village
  Starting Location: Frog Maniac house
  Objective: Find Lifеtimе Subscriрtiоn to Оnly Frоgs.crоаk
  Quest Icon Sprite: minecraft:textures/item/paper.png
  Reward: Nothing
  Turn In NPC: Frog Maniac
  NPC Model Texture: pixelmon:textures/steve/pokemaniac3.png
  Description 1: Frog Maniac lost his most precious item and asks for help.
  Description 2: He hints it was lost somewhere near his house.
  Description 3: The item is in the forest behind his house.
  Talk Early: Please look behind my house first. I think I dropped it near the forest edge.
  Talk Again Active: I still cannot find it. Search behind my house for the paper.
  After Completion: You found it! I owe you one.
}

class DelvingDeeperAncientCraterLab["Delving Deeper, the Ancient Crater Lab"] {
  NPC: Ian
  Area: Ancient Crater
  Starting Location: Mobile Research Unit
  Objective: Reach the Ancient Crater Lab at the bottom of the map
  Quest Icon Sprite: pixelmon:textures/gui/research/exclamation.png
  Reward: Nothing
  Turn In NPC: Ian
  NPC Model Texture: pixelmon:textures/steve/scientist_m.png
  Description 1: The MRU is tied up with a wounded Tyrunt, and we cannot all move forward.
  Description 2: Push to the on-site lab at the crater bottom and tell me what you find.
  Talk Early: First head down to the MRU team in Ancient Crater and report in.
  Talk Again Active: Keep moving toward the on-site lab at the crater bottom.
  After Completion: Good work making it that far. We can continue the operation from here.
}

class FriendsInHighPlaces["Friends in high places"] {
  NPC: Robert
  Area: Ancient Crater
  Starting Location: Upper Ancient Crater, Archeops nest
  Objective: Catch Pokemon from the Upper-Ancient Crater area
  Objective Filter 1: Swinub, Piloswine, Treecko, Grovyle, Sceptile
  Objective Filter 2: Lileep, Cradily, Tropius, Archen, Archeops
  Objective Filter 3: Amaura, Aurorus, Morelull, Shiinotic
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/ornithologist.png
  Description 1: I am documenting the upper crater wildlife around the Archeops nest.
  Description 2: Catch local upper-level Pokemon so we can record their behavior.
  Talk Early: First report to the MRU team so the crater route is secured.
  Talk Again Active: Catch Pokemon from the Upper-Ancient Crater area and bring me your notes.
  After Completion: Excellent fieldwork. Those upper-level records will help a lot.
}

class IGotABadFeelingAboutThis["I got a bad feeling about this..."] {
  NPC: Nick
  Area: Ancient Crater
  Starting Location: Mobile Research Unit
  Objective: Have Pokemon drop warped roots for the wounded Tyrunt
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Nick
  NPC Model Texture: pixelmon:textures/steve/scientist_m.png
  Description 1: That wounded Tyrunt has us stuck, and we need to move fast.
  Description 2: Bring back warped roots from local Pokemon drops so we can treat it and move out.
  Talk Early: First check in with the MRU team so the emergency response is underway.
  Talk Again Active: We still need warped roots from a Pokemon drop before we can move out.
  After Completion: Thank you. This should stabilize the Tyrunt long enough for us to move.
}

class HelpingBestICan["Helping best I can"] {
  NPC: Kelly
  Area: Ancient Crater
  Starting Location: Mobile Research Unit
  Objective: Have Pokemon drop jungle logs for expedition firewood
  Quest Icon Sprite: pixelmon:textures/gui/research/question.png
  Reward: Nothing
  Turn In NPC: Kelly
  NPC Model Texture: pixelmon:textures/steve/scientist_f.png
  Description 1: I am keeping the camp fed, but our firewood supply is getting low.
  Description 2: Gather jungle logs from Pokemon drops for the expedition while I keep the food from burning.
  Talk Early: First secure access by checking in with the MRU team in the crater.
  Talk Again Active: We still need jungle logs from Pokemon drops to keep the camp running.
  After Completion: Perfect. That should keep the camp running while we treat the Tyrunt.
}

class HidingHigh["Hiding high"] {
  NPC: Eddie
  Area: Ancient Crater
  Starting Location: The High Hide
  Objective: Catch Pokemon from the mid-Ancient Crater area
  Objective Filter 1: Slakoth, Vigoroth, Slaking, Aron, Lairon
  Objective Filter 2: Aggron, Turtwig, Grotle, Torterra, Cranidos
  Objective Filter 3: Rampardos, Shieldon, Bastiodon, Tyrunt, Tyrantrum
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/engineer.png
  Description 1: This hide is perfect for observing the mid-crater wildlife.
  Description 2: Catch mid-level Ancient Crater Pokemon so we can log local specimens.
  Talk Early: First check in with the MRU team so the crater travel paths are safe.
  Talk Again Active: Catch Pokemon from the mid-Ancient Crater area and we will catalog them.
  After Completion: Great catches. Those mid-level observations are exactly what we needed.
}

class InHotWater["In hot water"] {
  NPC: Ajay
  Area: Ancient Crater
  Starting Location: Ancient Crater Lake submersible
  Objective: Catch Pokemon from the lower-Ancient Crater area
  Objective Filter 1: Exeggutor (Alolan), Lapras, Omanyte, Omastar, Kabuto
  Objective Filter 2: Kabutops, Aerodactyl, Carvanha, Anorith, Armaldo
  Objective Filter 3: Relicanth, Tirtouga, Carracosta, Wimpod
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/engineer.png
  Description 1: Our submersible team is documenting Pokemon in the lower crater waters.
  Description 2: Catch lower-area Ancient Crater Pokemon so we can complete our records.
  Talk Early: First check in with the MRU team so the lower route is operational.
  Talk Again Active: Catch Pokemon from the lower Ancient Crater area and report back here.
  After Completion: Excellent work. The lower-crater survey just got a lot stronger.
}

class BigBoned["Big Boned"] {
  NPC: Roland
  Area: Ancient Crater
  Starting Location: Ancient Crater mid, skeleton structure
  Objective: Catch a Tyrantrum
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/shopman.png
  Description 1: See this skeleton? I want proof that giants still roam this crater.
  Description 2: Catch a Tyrantrum and show everyone you can handle true power.
  Talk Early: First report to the MRU team so the deeper crater routes open.
  Talk Again Active: Track down and catch a Tyrantrum. That is the trophy we are after.
  After Completion: Now that is a proper trophy catch. Outstanding work.
}

class AncientCraterAreaCollection["Ancient Crater area collection"] {
  Area: Ancient Crater
  Objective 1: Complete all Ancient Crater quests
  Objective 2: Progression and side quests both count
  Reward: ₽6000
  Completion Flag: safari-zone:completed/ancient_crater_area_collection
}

class ATrainMissed["A train missed"] {
  NPC: Arthur
  Area: Scorched Mesa
  Starting Location: Train Station
  Objective: Reach the mining camp
  Quest Icon Sprite: pixelmon:textures/gui/research/exclamation.png
  Reward: Nothing
  Turn In NPC: Arthur
  NPC Model Texture: pixelmon:textures/steve/engineer.png
  Description 1: We missed the train, but we still need support at the western mine camp.
  Description 2: Head there and assist Marston while we wait for the next departure.
  Talk Early: First head to the Scorched Mesa train station and get your west-route assignment.
  Talk Again Active: Get to the mining camp and check in with Marston as soon as you can.
  After Completion: Good call heading to the mine camp. That keeps our west operation moving.
}

class MiningOurOwnBusiness["Mining our own business"] {
  NPC: Marston
  Area: Scorched Mesa
  Starting Location: Mine camp
  Objective: Have Pokemon drop raw tumblestone 1 time in the mines
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/question.png
  Reward: Nothing
  Turn In NPC: None (auto-complete)
  NPC Model Texture: pixelmon:textures/steve/engineer.png
  Description 1: The mine is full of thumblestones, and we need more orange samples.
  Description 2: Catch local mine Pokemon and track 1 raw tumblestone loot drop.
  Talk Early: First speak with Arthur at the station and get routed to the mine camp.
  Talk Again Active: It only counts when raw tumblestone drops from battle loot, and we still need one drop.
  After Completion: Great haul. Those samples should keep this research moving.
}

class DamIt["Dam it!"] {
  NPC: Bill
  Area: Scorched Mesa
  Starting Location: Train Station
  Objective: Go to the electric dam
  Quest Icon Sprite: pixelmon:textures/gui/research/exclamation.png
  Reward: Nothing
  Turn In NPC: Bill
  NPC Model Texture: pixelmon:textures/steve/shopman.png
  Description 1: I missed the northbound train, and someone needs to check the dam team.
  Description 2: Head to the electric dam and make sure my colleague is all right.
  Talk Early: First check in at the Scorched Mesa train station to get regional clearance.
  Talk Again Active: Please get to the electric dam and confirm everything is under control.
  After Completion: Thanks for stepping in. The dam team can keep operating now.
}

class SaddlingUp["Saddling up!"] {
  NPC: Kitty
  Area: Scorched Mesa
  Starting Location: Kitty's ranch
  Objective: Catch horse-like Pokemon
  Objective Filter 1: Ponyta, Rapidash, Blitzle, Zebstrika
  Objective Filter 2: Mudbray, Mudsdale, Tauros, Bouffalant
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/shoplady2.png
  Description 1: My ranch always needs strong mounts for visiting trainers.
  Description 2: Catch horse-like Pokemon from the mesa and help restock my stables.
  Talk Early: First get train-station clearance for Scorched Mesa operations.
  Talk Again Active: Catch horse-like Pokemon and bring me your ranch-ready partners.
  After Completion: Wonderful picks. These will make excellent ranch mounts.
}

class CateringOnRails["Catering on rails"] {
  NPC: Abigail
  Area: Scorched Mesa
  Starting Location: Train rear cab
  Objective: Collect ingredients for the food service
  Quest Icon Sprite: pixelmon:textures/gui/research/speech_bubble.png
  Reward: Nothing
  Turn In NPC: Abigail
  NPC Model Texture: pixelmon:textures/steve/shoplady.png
  Description 1: Our appetizer crate never arrived, and service cannot start without supplies.
  Description 2: Collect local ingredients so we can keep the rail kitchen running.
  Talk Early: First get cleared at the train station so this rail line opens to you.
  Talk Again Active: Please gather the missing food-service ingredients around this area.
  After Completion: You saved service. The rail crew can stay on schedule now.
}

class Birdwatching["Birdwatching"] {
  NPC: Javier
  Area: Scorched Mesa
  Starting Location: Canyon observatory
  Objective: Catch bird Pokemon in the Scorched Mesa
  Objective Filter 1: Doduo, Dodrio, Rufflet
  Objective Filter 2: Braviary, Vullaby, Mandibuzz
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/ornithologist.png
  Description 1: These mesas are full of rare birds, and I cannot track them all alone.
  Description 2: Catch bird Pokemon in Scorched Mesa so we can document flight behavior.
  Talk Early: First get regional clearance at the train station before heading to the canyon.
  Talk Again Active: Catch bird Pokemon in the mesa and help finish this survey.
  After Completion: Fantastic observations. Our bird records are far more complete now.
}

class SpareAPart["Spare a part"] {
  NPC: Jack
  Area: Scorched Mesa
  Starting Location: Dam control building
  Objective: Receive a Cell Battery as Pokemon loot from battle
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/question.png
  Reward: Nothing
  Turn In NPC: Jack
  NPC Model Texture: pixelmon:textures/steve/engineer.png
  Description 1: Bill sent you? Wildlife keeps stealing the parts I need.
  Description 2: Track down spare parts nearby so I can restore dam controls.
  Talk Early: First speak with Bill at the train station, then check on the electric dam.
  Talk Again Active: It counts when a Cell Battery drops as battle loot.
  After Completion: That is exactly what I needed. I can finish the repairs now.
}

class DocumentingTheWest["Documenting the west"] {
  NPC: Leopold
  Area: Scorched Mesa
  Starting Location: Train passenger cab
  Objective: Catch large land Pokemon from the mesa
  Objective Filter 1: Bouffalant, Tauros, Hippopotas, Hippowdon
  Objective Filter 2: Numel, Camerupt
  Quest Icon Sprite: pixelmon:textures/gui/research/pokeball.png
  Reward: Nothing
  NPC Model Texture: pixelmon:textures/steve/shopman.png
  Description 1: Dutch needs data on the largest land species roaming these mesas.
  Description 2: Catch large land Pokemon in the west so I can complete the archive.
  Talk Early: First get train-station clearance, then return for this rail assignment.
  Talk Again Active: Catch large land Pokemon from the mesa and report your findings.
  After Completion: Excellent entries. That western species record looks much better now.
}

class BlackDiamondsAndGold["Black diamonds and gold"] {
  NPC: Cleet
  Area: Scorched Mesa
  Starting Location: Oil fields
  Objective: Have Pokemon drop coal 10 times in Scorched Mesa
  Objective Trigger: pixelmon:pokemon_drop_item
  Quest Icon Sprite: pixelmon:textures/gui/research/question.png
  Reward: Nothing
  Turn In NPC: None (auto-complete)
  NPC Model Texture: pixelmon:textures/steve/shopman.png
  Description 1: Oil keeps flowing, but I still need coal to keep these furnaces roaring.
  Description 2: Catch local mesa Pokemon and watch for coal dropping as loot.
  Talk Early: First get cleared at the train station before taking field contracts.
  Talk Again Active: It only counts when coal drops from battle loot, and we still need ten drops.
  After Completion: Now that is a haul. The furnaces will keep roaring.
}

class ScorchedMesaAreaCollection["Scorched Mesa area collection"] {
  Area: Scorched Mesa
  Objective 1: Complete all Scorched Mesa quests
  Objective 2: Progression and side quests both count
  Reward: ₽6000
  Completion Flag: safari-zone:completed/scorched_mesa_area_collection
}

class TwilightKeepAreaCollection["Twilight Keep area collection"] {
  Area: Twilight Keep
  Objective 1: Complete all Twilight Keep quests
  Objective 2: Progression and side quests both count
  Reward: ₽6000
  Completion Flag: safari-zone:completed/twilight_keep_area_collection
}

MapProgressionStart --> WelcomeToTheSafari : unlocks
WelcomeToTheSafari --> HandingInThePass : unlocks
HandingInThePass --> TimberlandVillageLab : unlocks

TimberlandVillageLab --> PanicInTheJurassic : unlocks
TimberlandVillageLab --> AMysticalResearch : unlocks
TimberlandVillageLab --> ToCatchATrain : unlocks
TimberlandVillageLab --> IntoTheTwilight : unlocks
TimberlandVillageLab --> NextGenMedicine : unlocks

MapProgressionStart --> MySubscription : side quest available
PanicInTheJurassic --> DelvingDeeperAncientCraterLab : unlocks
DelvingDeeperAncientCraterLab --> FriendsInHighPlaces : unlocks
DelvingDeeperAncientCraterLab --> IGotABadFeelingAboutThis : unlocks
DelvingDeeperAncientCraterLab --> HelpingBestICan : unlocks
DelvingDeeperAncientCraterLab --> HidingHigh : unlocks
DelvingDeeperAncientCraterLab --> InHotWater : unlocks
DelvingDeeperAncientCraterLab --> BigBoned : unlocks

PanicInTheJurassic --> AncientCraterAreaCollection : contributes
DelvingDeeperAncientCraterLab --> AncientCraterAreaCollection : contributes
FriendsInHighPlaces --> AncientCraterAreaCollection : contributes
IGotABadFeelingAboutThis --> AncientCraterAreaCollection : contributes
HelpingBestICan --> AncientCraterAreaCollection : contributes
HidingHigh --> AncientCraterAreaCollection : contributes
InHotWater --> AncientCraterAreaCollection : contributes
BigBoned --> AncientCraterAreaCollection : contributes

ToCatchATrain --> ATrainMissed : unlocks
IntoTheTwilight --> ABlessingFromTheLord : unlocks
IntoTheTwilight --> ToArms : unlocks
IntoTheTwilight --> TotallyNotSpells : unlocks
IntoTheTwilight --> SuppliesWhileLasted : unlocks
IntoTheTwilight --> SoldiersLikeNoneOther : unlocks
IntoTheTwilight --> TheDomainOfDarkness : unlocks
IntoTheTwilight --> HospitalityInDarkness : unlocks
IntoTheTwilight --> RiskeCuisine : unlocks

IntoTheTwilight --> TwilightKeepAreaCollection : contributes
ABlessingFromTheLord --> TwilightKeepAreaCollection : contributes
ToArms --> TwilightKeepAreaCollection : contributes
TotallyNotSpells --> TwilightKeepAreaCollection : contributes
SuppliesWhileLasted --> TwilightKeepAreaCollection : contributes
SoldiersLikeNoneOther --> TwilightKeepAreaCollection : contributes
TheDomainOfDarkness --> TwilightKeepAreaCollection : contributes
HospitalityInDarkness --> TwilightKeepAreaCollection : contributes
RiskeCuisine --> TwilightKeepAreaCollection : contributes

ATrainMissed --> MiningOurOwnBusiness : unlocks
ToCatchATrain --> DamIt : unlocks
DamIt --> SpareAPart : unlocks
ToCatchATrain --> SaddlingUp : unlocks
ToCatchATrain --> CateringOnRails : unlocks
ToCatchATrain --> Birdwatching : unlocks
ToCatchATrain --> DocumentingTheWest : unlocks
ToCatchATrain --> BlackDiamondsAndGold : unlocks

ToCatchATrain --> ScorchedMesaAreaCollection : contributes
ATrainMissed --> ScorchedMesaAreaCollection : contributes
MiningOurOwnBusiness --> ScorchedMesaAreaCollection : contributes
DamIt --> ScorchedMesaAreaCollection : contributes
SpareAPart --> ScorchedMesaAreaCollection : contributes
SaddlingUp --> ScorchedMesaAreaCollection : contributes
CateringOnRails --> ScorchedMesaAreaCollection : contributes
Birdwatching --> ScorchedMesaAreaCollection : contributes
DocumentingTheWest --> ScorchedMesaAreaCollection : contributes
BlackDiamondsAndGold --> ScorchedMesaAreaCollection : contributes
```
