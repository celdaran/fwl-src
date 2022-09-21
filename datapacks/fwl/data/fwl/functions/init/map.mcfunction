#-----------------------------------------------------------------------
# function fwl:init/map
#
# This mcfunction completely resets the game map. Every book, chest,
# dynamic entity, etc., gets registered here and can be run within
# a single function.
# 
# This is intended to replace both the init/reset-game.mcfunction as
# well as CC3 itself. At least the bulk of it. I had the epiphany on
# September 20, 2022 that everything I do in CC3 can be done here too.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Part One
#-----------------------------------------------------------------------

# Template
setblock -3220 66 3372 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{}}} replace

# Book: How to Play
setblock -3220 66 3372 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"How to Play"}'},pages:['{"text":"Welcome to\\n\\nFANTASY WORLD LAND\\n\\n~~ About ~~\\n\\nThis is a game of adventure and exploration. As a player, your goal is to talk to people, find books and collect stuff.\\n\\n"}','{"text":"You are a new arrival to the land of Fantasy World, fresh off that boat at the end of the dock. You\'ve traveled across the sea in search of work.\\n\\nYou\'re tired and hungry, but you can satisfy neither with an empty purse. Your bed will have to wait!\\n\\n"}','{"text":"~~ Gameplay ~~\\n\\nTo Begin:\\n\\n1. Wander around the town of Southport\\n\\n2. Find Farmer Ham to begin the main quest\\n\\n3. Locate his Prize-Winning Pumpkin\\n\\n4. Return it to him\\n"}','{"text":"5. Then follow your feet!\\n\\nFrom here, continue to wander, finding and talking to NPCs or reading the occasional stray books. Some interactions advance the main quest, others serve as side quests. All along the way you\'ll explore strange "}','{"text":"new worlds, seek out new life and new civilizations, and boldly go where no Minecraft player has gone before.\\n\\n~~ Objective ~~\\n\\nYour ultimate goal is to collect the Five Scary Skulls. The main quest is divided into five parts, which take "}','{"text":"place in five different areas of the world. At the end of each part, you\'ll collect one of the Scary Skulls. Hang on to them, because you\'ll need them all to win!\\n\\n~~ Tips ~~\\n\\nPress \\"k\\" for quest info. After an NPC has given you a quest, you "}','{"text":"can view the details of each from this screen.\\n\\nIf you ever run across a locked chest, note that there is one and only one item which will unlock it. Find that item and come back.\\n\\nIf you find an open book on a lectern, this "}','{"text":"is either information about the story or the start of a side-quest.\\n\\n~~ Credits ~~\\n\\nLots of building by bluenerdminecraft.com\\n"}'],title:"How to Play",author:"Gamemaster",generation:0}}} replace

# Book: Welcome to Southport
setblock -3250 70 3373 minecraft:lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Welcome to Southport"}'},pages:['{"text":"Welcome to Southport!\\n\\nWhether your family has lived here for generations or it\'s your first visit, Southport always provides an unforgettable experience.\\n\\nThis small harbor village is actually the first one officially "}','{"text":"established in the land of Fantasy World, where a Famous Explorer first set foot centuries ago.\\n\\nSo visit the pub, stop by the local farm, or look into one of our homes if you\'re wanting to stay longer. And if you\'re looking for work, be sure to check out the "}','{"text":"Help Wanted list.\\n\\nEnjoy your stay!\\n"}'],title:"Welcome to Southport",author:"Mayor of Southport",generation:0}}} replace

# Book: Guest Book
setblock -3245 70 3371 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Guest Book"}'},pages:['{"text":"Guest Book\\n\\nThurk Brihand\\nVil Lad\\nSigut Broon\\nSirok Kimp\\nKama Drad\\nGlithi Skirk\\nNoda Glisk\\nBridu Vum\\nHona Pigum\\nKama Primi\\nKlitan Nutilt\\nKoku Mib\\n"}','{"text":"Thormed Mirtle\\nNiksu Bror\\nReer Vered\\nColin Creevey\\nRomilda Vane\\nBlaise Zabini\\nJustin Finch-Fletchley\\nKatie Bell\\nCormac McLaggen\\nZacharias Smith\\n\\n"}'],title:"Guest Book",author:"Old Zedd",generation:3}}} replace

# Book: Help Wanted
setblock -3245 70 3373 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Help Wanted"}'},pages:['{"text":"Help Wanted\\n\\n* Kelp Harvest [taken]\\n\\n* Pick up shipment of ale and deliver to the pub [taken]\\n\\n* Unload boats at docks for a day [taken]\\n\\n* Deliver package to Elan [taken]\\n"}','{"text":"\\n* Weed Thirsa\'s garden [taken]\\n\\n* Locate a prize-winning pumpkin and take to Ham\'s farm\\n\\n* Clean cabins on the south harbor [taken]\\n\\n* Collect flowers [taken]\\n"}'],title:"Help Wanted",author:"Mayor of Southport",generation:0}}} replace

# Item: Prize-Winning Pumpkin
setblock -3195 63 3373 minecraft:trapped_chest[facing=west]{CustomName:'{"text":"Farmer Ham\'s Goods"}',Items:[{Slot:0b,id:"minecraft:pumpkin",Count:1b,tag:{display:{Name:'{"text":"A Prize-Winning Pumpkin","italic":true}'}}}]} replace

# Item: Big Fat Melon
setblock -3239 63 3373 minecraft:trapped_chest[facing=east]{CustomName:'{"text":"Farmer Ham\'s Goods"}',Items:[{Slot:0b,id:"minecraft:melon",Count:1b,tag:{display:{Name:'{"text":"A Big Fat Melon","italic":true}'}}}]} replace

# Item: Jepson's Shovel
summon minecraft:item_frame -3110 11 3204 {Facing:1b,Item:{id:"minecraft:iron_shovel",Count:1b},Tags: ["jepsons_shovel"]}
data merge entity @e[tag=jepsons_shovel,limit=1] {Invisible:1b}

# Item: Lapis Lazuli of Light
#   key: give @p minecraft:lapis_lazuli{display:{Name:'{"text":"Lapis Lazuli of Light","italic":"true"}'}}
setblock -3263 -13 3192 minecraft:trapped_chest[facing=east]{CustomName:'{"text":"Quest Chest"}',Items:[{Slot:0b,id:"minecraft:lapis_lazuli",Count:1b,tag:{display:{Name:'{"text":"Lapis Lazuli of Light","italic":true}'}}},{Slot:1b,id:"minecraft:wooden_pickaxe",Count:1b},{Slot:2b,id:"minecraft:soul_lantern",Count:1b}],Lock:"Lapis Lazuli Chest Key"} replace

# Chest: End of Part One | key: give @p minecraft:lapis_lazuli{display:{Name:'{"text":"Lapis Lazuli of Light","italic":"true"}'}}
#   key: give @p minecraft:gold_ingot{display:{Name:'{"text":"A Very Special Gold Ingot","italic":"true"}'}}
#   slot0: Book Part One
#   slot1: Scary Skull #1
#   slot2: Part One Banner
#   slot3: Emeralds
#   slot4: Map of Area
#   slot5: Stone Sword
setblock -3055 19 3244 minecraft:trapped_chest[facing=north,type=single]{Lock:"A Very Special Gold Ingot",Items:[{Slot:0b,id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Part One Completed"}'},pages:['{"text":"Congratulations!\\n\\nYou have found The First Scary Skull and have completed Part One of the main quest.\\n\\nTake this banner as a token of your accomplishment and a few emeralds for your troubles. Feel free to visit the pub and TREAT YO\'SELF.\\n"}','{"text":"But don\'t lose the First Scary Skull. It\'s the only one of its kind and you\'ll very much need it later.\\n\\nPart Two of your quest awaits. Follow the Kayst River east until you find the Village of Omarth.\\n\\nGood luck!\\n"}'],title:"Part One Completed",author:"Gamemaster",generation:0}},{Slot:1b,id:"minecraft:player_head",Count:1b,tag:{display:{Name:'{"text":"The First Scary Skull"}'},SkullOwner:"Titan",tag:{CanPlaceOn:["minecraft:stone"]}}},{Slot:2b,id:"minecraft:orange_banner",Count:1b,tag:{display:{Name:'{"text":"Part One Completed"}'},BlockEntityTag:{Patterns:[{Pattern:"flo",Color:4},{Pattern:"bs",Color:11}]}}},{Slot:3b,id:"minecraft:emerald",Count:3b,tag:{}},{Slot:4b,id:"minecraft:filled_map",Count:1b,tag:{display:{Name:'{"text":"South Tana"}'},map:63}},{Slot:5b,id:"minecraft:stone_sword",Count:1b,tag:{display:{Name:'{"text":"Batbane","italic":true}'}}}]} replace

# Template for a book in a chest
setblock ~1 ~ ~1 minecraft:trapped_chest[facing=north,type=single]{Lock:"LOCKME",Items:[{Slot:0b,id:"minecraft:written_book",Count:1b,tag:{}}]}

# Item: Mike's diamond pickaxe
setblock -3264 67 3463 minecraft:barrel[facing=west]{Items:[{Slot:0b,id:"minecraft:coal",Count:4b,tag:{}},{Slot:1b,id:"minecraft:flint",Count:1b,tag:{}},{Slot:2b,id:"minecraft:bowl",Count:1b,tag:{}},{Slot:3b,id:"minecraft:diamond_pickaxe",Count:3b,tag:{display:{Name:'{"text":"Mike\'s Diamond Pickaxe","italic":true}'}}}]} replace

# Item: Ike's netherite shovel
setblock -3264 67 3463 minecraft:barrel[facing=west]{Items:[{Slot:0b,id:"minecraft:charcoal",Count:5b,tag:{}},{Slot:1b,id:"minecraft:flint",Count:1b,tag:{}},{Slot:2b,id:"minecraft:coal",Count:1b,tag:{}},{Slot:3b,id:"minecraft:netherite_shovel",Count:3b,tag:{display:{Name:'{"text":"Ike\'s Netherite Shovel","italic":true}'}}}]} replace

# Quest: Frickin' Bats
# ohhhhh! that's NOT what this is. Good. I finally have a counter-example to everything I'm doing.
# pick it up here
summon minecraft:bat -3195 1 3189
summon minecraft:bat -3194 1 3189
summon minecraft:bat -3193 1 3189
summon minecraft:bat -3194 2 3190
summon minecraft:bat -3194 2 3190
summon minecraft:bat -3195 1 3189
summon minecraft:bat -3194 1 3189
summon minecraft:bat -3193 1 3189
summon minecraft:bat -3194 2 3190
summon minecraft:bat -3194 2 3190
setblock ~ ~ ~ minecraft:stone
clone ~ ~1 ~3 ~ ~ ~3 -3194 -4 3199

#-----------------------------------------------------------------------
# Part Three
#-----------------------------------------------------------------------

# Golden Blade of Whatever
setblock -2644 65 2728 minecraft:air
#setblock -2644 65 2728 minecraft:chest[facing=west]{CustomName:'"Koldo\'s Stuff"',Items:[{Slot:0,id:"minecraft:golden_sword{display:{Name:'{"text":"Golden Blade of Whatever","italic":true}'}}",Count:1}]}
setblock -2644 65 2728 minecraft:chest[facing=west]{CustomName:'{"text":"Koldo\'s Stuff","color":"dark_blue","italic":true}',Items:[{Slot:0b,id:"minecraft:golden_sword",Count:1b,tag:{display:{Name:'{"text":"Golden Blade of Whatever","color":"yellow","italic":true}'}}}]} replace


give @p minecraft:golden_sword{display:{Name:'{"text":"Golden Blade of Whatever","italic":true}'}}