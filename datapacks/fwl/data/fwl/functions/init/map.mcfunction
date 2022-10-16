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
# Templates
#-----------------------------------------------------------------------

# Template for book on a lectern
#setblock -3220 66 3372 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{}}} replace
# Template for a book in a chest
#setblock ~1 ~ ~1 minecraft:trapped_chest[facing=north,type=single]{Lock:"LOCKME",Items:[{Slot:0b,id:"minecraft:written_book",Count:1b,tag:{}}]}

#-----------------------------------------------------------------------
# Part One
#-----------------------------------------------------------------------

# Book: How to Play
setblock -3220 66 3372 minecraft:air
setblock -3220 66 3372 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"How to Play"}'},pages:['{"text":"Welcome to\\n\\nFANTASY WORLD LAND\\n\\n~~ About ~~\\n\\nThis is a game of adventure and exploration. As a player, your goal is to talk to people, find books and collect stuff.\\n\\n"}','{"text":"You are a new arrival to the land of Fantasy World, fresh off that boat at the end of the dock. You\'ve traveled across the sea in search of work.\\n\\nYou\'re tired and hungry, but you can satisfy neither with an empty purse. Your bed will have to wait!\\n\\n"}','{"text":"~~ Gameplay ~~\\n\\nTo Begin:\\n\\n1. Wander around the town of Southport\\n\\n2. Find Farmer Ham to begin the main quest\\n\\n3. Locate his Prize-Winning Pumpkin\\n\\n4. Return it to him\\n"}','{"text":"5. Then follow your feet!\\n\\nFrom here, continue to wander, finding and talking to NPCs or reading the occasional stray books. Some interactions advance the main quest, others serve as side quests. All along the way you\'ll explore strange "}','{"text":"new worlds, seek out new life and new civilizations, and boldly go where no Minecraft player has gone before.\\n\\n~~ Objective ~~\\n\\nYour ultimate goal is to collect the Five Scary Skulls. The main quest is divided into five parts, which take "}','{"text":"place in five different areas of the world. At the end of each part, you\'ll collect one of the Scary Skulls. Hang on to them, because you\'ll need them all to win!\\n\\n~~ Tips ~~\\n\\nPress \\"k\\" for quest info. After an NPC has given you a quest, you "}','{"text":"can view the details of each from this screen.\\n\\nIf you ever run across a locked chest, note that there is one and only one item which will unlock it. Find that item and come back.\\n\\nIf you find an open book on a lectern, this "}','{"text":"is either information about the story or the start of a side-quest.\\n\\n~~ Credits ~~\\n\\nLots of building by bluenerdminecraft.com\\n"}'],title:"How to Play",author:"Gamemaster",generation:0}}} replace

# Book: Welcome to Southport
setblock -3250 70 3373 minecraft:air
setblock -3250 70 3373 minecraft:lectern[facing=east,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Welcome to Southport"}'},pages:['{"text":"Welcome to Southport!\\n\\nWhether your family has lived here for generations or it\'s your first visit, Southport always provides an unforgettable experience.\\n\\nThis small harbor village is actually the first one officially "}','{"text":"established in the land of Fantasy World, where a Famous Explorer first set foot centuries ago.\\n\\nSo visit the pub, stop by the local farm, or look into one of our homes if you\'re wanting to stay longer. And if you\'re looking for work, be sure to check out the "}','{"text":"Help Wanted list.\\n\\nEnjoy your stay!\\n"}'],title:"Welcome to Southport",author:"Mayor of Southport",generation:0}}} replace

# Book: Guest Book
setblock -3245 70 3371 minecraft:air
setblock -3245 70 3371 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Guest Book"}'},pages:['{"text":"Guest Book\\n\\nThurk Brihand\\nVil Lad\\nSigut Broon\\nSirok Kimp\\nKama Drad\\nGlithi Skirk\\nNoda Glisk\\nBridu Vum\\nHona Pigum\\nKama Primi\\nKlitan Nutilt\\nKoku Mib\\n"}','{"text":"Thormed Mirtle\\nNiksu Bror\\nReer Vered\\nColin Creevey\\nRomilda Vane\\nBlaise Zabini\\nJustin Finch-Fletchley\\nKatie Bell\\nCormac McLaggen\\nZacharias Smith\\n\\n"}'],title:"Guest Book",author:"Old Zedd",generation:3}}} replace

# Book: Help Wanted
setblock -3245 70 3373 minecraft:air
setblock -3245 70 3373 minecraft:lectern[facing=west,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Help Wanted"}'},pages:['{"text":"Help Wanted\\n\\n* Kelp Harvest [taken]\\n\\n* Pick up shipment of ale and deliver to the pub [taken]\\n\\n* Unload boats at docks for a day [taken]\\n\\n* Deliver package to Elan [taken]\\n"}','{"text":"\\n* Weed Thirsa\'s garden [taken]\\n\\n* Locate a prize-winning pumpkin and take to Ham\'s farm\\n\\n* Clean cabins on the south harbor [taken]\\n\\n* Collect flowers [taken]\\n"}'],title:"Help Wanted",author:"Mayor of Southport",generation:0}}} replace

# Item: Prize-Winning Pumpkin
setblock -3195 63 3373 minecraft:air
setblock -3195 63 3373 minecraft:trapped_chest[facing=west]{CustomName:'{"text":"Farmer Ham\'s Goods"}',Items:[{Slot:0b,id:"minecraft:pumpkin",Count:1b,tag:{display:{Name:'{"text":"A Prize-Winning Pumpkin","italic":true}'}}}]} replace

# Item: Big Fat Melon
setblock -3239 63 3373 minecraft:air
setblock -3239 63 3373 minecraft:trapped_chest[facing=east]{CustomName:'{"text":"Farmer Ham\'s Goods"}',Items:[{Slot:0b,id:"minecraft:melon",Count:1b,tag:{display:{Name:'{"text":"A Big Fat Melon","italic":true}'}}}]} replace

# Item: Jepson's Shovel
setblock -3110 11 3204 minecraft:air
summon minecraft:item_frame -3110 11 3204 {Facing:1b,Item:{id:"minecraft:iron_shovel",Count:1b},Tags: ["jepsons_shovel"]}
data merge entity @e[tag=jepsons_shovel,limit=1] {Invisible:1b}

# Item: Lapis Lazuli of Light
#   key: give @p minecraft:paper{display:{Name:'{"text":"Lapis Lazuli Chest Key","italic":"true"}'}}
setblock -3263 -13 3192 minecraft:air
setblock -3263 -13 3192 minecraft:trapped_chest[facing=east]{CustomName:'{"text":"Quest Chest"}',Items:[{Slot:0b,id:"minecraft:lapis_lazuli",Count:1b,tag:{display:{Name:'{"text":"Lapis Lazuli of Light","italic":true}'}}},{Slot:1b,id:"minecraft:wooden_pickaxe",Count:1b},{Slot:2b,id:"minecraft:soul_lantern",Count:1b}],Lock:"Lapis Lazuli Chest Key"} replace

# Chest: End of Part One | key: give @p minecraft:lapis_lazuli{display:{Name:'{"text":"Lapis Lazuli of Light","italic":"true"}'}}
#   key: give @p minecraft:gold_ingot{display:{Name:'{"text":"A Very Special Gold Ingot","italic":"true"}'}}
#   slot0: Book Part One
#   slot1: Scary Skull #1
#   slot2: Part One Banner
#   slot3: Emeralds
#   slot4: Map of Area
#   slot5: Stone Sword
setblock -3055 19 3244 minecraft:air
setblock -3055 19 3244 minecraft:trapped_chest[facing=north,type=single]{Lock:"A Very Special Gold Ingot",Items:[{Slot:0b,id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Part One Completed"}'},pages:['{"text":"Congratulations!\\n\\nYou have found The First Scary Skull and have completed Part One of the main quest.\\n\\nTake this banner as a token of your accomplishment and a few emeralds for your troubles. Feel free to visit the pub and TREAT YO\'SELF.\\n"}','{"text":"But don\'t lose the First Scary Skull. It\'s the only one of its kind and you\'ll very much need it later.\\n\\nPart Two of your quest awaits. Follow the Kayst River east until you find the Village of Omarth.\\n\\nGood luck!\\n"}'],title:"Part One Completed",author:"Gamemaster",generation:0}},{Slot:1b,id:"minecraft:player_head",Count:1b,tag:{display:{Name:'{"text":"The First Scary Skull"}'},SkullOwner:"Titan",tag:{CanPlaceOn:["minecraft:stone"]}}},{Slot:2b,id:"minecraft:orange_banner",Count:1b,tag:{display:{Name:'{"text":"Part One Completed"}'},BlockEntityTag:{Patterns:[{Pattern:"flo",Color:4},{Pattern:"bs",Color:11}]}}},{Slot:3b,id:"minecraft:emerald",Count:3b,tag:{}},{Slot:4b,id:"minecraft:filled_map",Count:1b,tag:{display:{Name:'{"text":"South Tana"}'},map:63}},{Slot:5b,id:"minecraft:stone_sword",Count:1b,tag:{display:{Name:'{"text":"Batbane","italic":true}'}}}]} replace

# Item: Mike's diamond pickaxe
setblock -3264 67 3463 minecraft:air
setblock -3264 67 3463 minecraft:barrel[facing=west]{Items:[{Slot:0b,id:"minecraft:coal",Count:4b,tag:{}},{Slot:1b,id:"minecraft:flint",Count:1b,tag:{}},{Slot:2b,id:"minecraft:bowl",Count:1b,tag:{}},{Slot:3b,id:"minecraft:diamond_pickaxe",Count:3b,tag:{display:{Name:'{"text":"Mike\'s Diamond Pickaxe","italic":true}'}}}]} replace

# Item: Ike's netherite shovel
setblock -3264 67 3463 minecraft:air
setblock -3264 67 3463 minecraft:barrel[facing=west]{Items:[{Slot:0b,id:"minecraft:charcoal",Count:5b,tag:{}},{Slot:1b,id:"minecraft:flint",Count:1b,tag:{}},{Slot:2b,id:"minecraft:coal",Count:1b,tag:{}},{Slot:3b,id:"minecraft:netherite_shovel",Count:3b,tag:{display:{Name:'{"text":"Ike\'s Netherite Shovel","italic":true}'}}}]} replace

# Quest: Frickin' Bats
setblock -3194 -4 3199 minecraft:air
setblock -3194 -3 3199 minecraft:air
setblock -3194 -4 3199 minecraft:command_block{Command:"function fwl:frickin-bats"}
setblock -3194 -3 3199 minecraft:stone_pressure_plate

# Chest: Bat Box Helper
setblock -3198 3 3207 minecraft:air
setblock -3198 3 3207 minecraft:trapped_chest[facing=south,type=single]{Items:[{Slot:0b,id:"minecraft:stone_sword",Count:1b,tag:{}},{Slot:0b,id:"minecraft:apple",Count:18b,tag:{}}]}

# Chest: Extra Loot
setblock -3089 21 3222 minecraft:air
setblock -3089 21 3222 minecraft:trapped_chest[facing=north,type=single]{Items:[{Slot:0b,id:"minecraft:iron_sword",Count:1b,tag:{}},{Slot:0b,id:"minecraft:spyglass",Count:1b,tag:{}},{Slot:1b,id:"minecraft:emerald",Count:2b,tag:{}},{Slot:2b,id:"minecraft:carrot",Count:8b,tag:{}}]}

# Chest: Dead End Cookie
setblock -3250 70 3373 minecraft:air
setblock -3173 24 3256 minecraft:trapped_chest[facing=south,type=single]{Items:[{Slot:0b,id:"minecraft:cookie",Count:1b,tag:{}}]}

#-----------------------------------------------------------------------
# Part Two
#-----------------------------------------------------------------------

# Item: Village Clock
setblock -2380 124 2877 minecraft:air
setblock -2380 124 2877 minecraft:trapped_chest[facing=south,type=single]{Lock:"Village Clock Chest Key",CustomName:'{"text":"Jim\'s Stuff"}',Items:[{Slot:0b,id:"minecraft:clock",Count:1b,tag:{display:{Name:'{"text":"The Village Clock","italic":true}'}}},{Slot:1b,id:"minecraft:cooked_chicken",Count:1b,tag:{}},{Slot:2b,id:"minecraft:carrot",Count:1b,tag:{}},{Slot:3b,id:"minecraft:baked_potato",Count:2b,tag:{}},{Slot:4b,id:"minecraft:pumpkin_pie",Count:1b,tag:{}},{Slot:5b,id:"minecraft:gold_nugget",Count:1b,tag:{}},{Slot:6b,id:"minecraft:emerald",Count:1b,tag:{}}]} replace

# Item: Village Clock Chest Key
setblock -3264 67 3463 minecraft:air
setblock -3264 67 3463 minecraft:barrel[facing=north]{Items:[{Slot:0b,id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"Village Clock Chest Key","italic":true}'}}},{Slot:1b,id:"minecraft:cookie",Count:1b,tag:{}}]} replace

# Player's House Locked Door
setblock -2837 65 3076 minecraft:air
setblock -2837 66 3076 minecraft:air
setblock -2837 66 3075 minecraft:air
setblock -2837 65 3076 minecraft:acacia_planks
setblock -2837 66 3076 minecraft:acacia_planks
setblock -2837 66 3075 minecraft:spruce_wall_sign{Text1:'{"text":"HOUSE AVAILABLE"}',Text3:'{"text":"Speak to Agent"}',Text4:'{"text":"For More Info"}'}

# Chest: End of Part Two | key: give @p minecraft:paper{display:{Name:'{"text":"Scary Skull Chest Key","italic":"true"}'}}
#   key: give @p minecraft:gold_ingot{display:{Name:'{"text":"A Very Special Gold Ingot","italic":"true"}'}}
#   slot0: Book Part Two
#   slot1: Scary Skull #2
#   slot2: Part Two Banner
#   slot3: Certificate of Completion
#   slot4: Emeralds
setblock -2451 57 2812 minecraft:air
setblock -2451 57 2812 minecraft:trapped_chest[facing=north,type=single]{Lock:"Scary Skull Chest Key",Items:[{Slot:0b,id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"Part Two Completed"}'},pages:['{"text":"Congratulations!\\n\\nYou have found The Second Scary Skull and have nearly completed Part Two of the main quest. Return to Redd for the final step. Oh, and don\'t forget about your new house!\\n\\nTake this banner as a token of your "}','{"text":"accomplishment and keep the Scary Skull under your close protection. You will need it later.\\n\\nPart Three of your quest awaits. If you go back to West Bridge, where Redd usually hangs out, you\'ll find a small path leading north through the woods towards the "}','{"text":"Great Desert. Follow this path to the Catacombs and take heart. Challenging adventures await.\\n\\nGood luck!\\n"}'],title:"Part Two Completed",author:"Gamemaster",generation:0}},{Slot:1b,id:"minecraft:player_head",Count:1b,tag:{display:{Name:'{"text":"The Second Scary Skull"}'},SkullOwner:"oppn",tag:{CanPlaceOn:["minecraft:stone"]}}},{Slot:2b,id:"minecraft:black_banner",Count:1b,tag:{display:{Name:'{"text":"Part Two Completed"}'},BlockEntityTag:{Patterns:[{Pattern:"bs",Color:15},{Pattern:"bt",Color:0},{Pattern:"bts",Color:7}]}}},{Slot:1b,id:"minecraft:paper",Count:3b,tag:{display:{Name:'{"text":"Certificate of Completion: Part Two","italic":true}'}}},{Slot:4b,id:"minecraft:emerald",Count:2b,tag:{}}]} replace

#-----------------------------------------------------------------------

# Item: Hagrid's Clock
setblock -3082 -9 3179 minecraft:air
setblock -3082 -9 3179 minecraft:trapped_chest[facing=north,type=single]{CustomName:'{"text":"Thieves\' Chest"}',Items:[{Slot:0b,id:"minecraft:clock",Count:1b,tag:{display:{Name:'{"text":"Hagrid\'s Clock","italic":true}'}}},{Slot:1b,id:"minecraft:apple",Count:6b,tag:{}},{Slot:2b,id:"minecraft:iron_shovel",Count:1b,tag:{}}]} replace

# Item: Upton's Axe
setblock -2667 76 3078 minecraft:air
setblock -2667 76 3078 minecraft:barrel[facing=east]{Items:[{Slot:0b,id:"minecraft:iron_axe",Count:1b,tag:{display:{Name:'{"text":"Upton\'s Grandfather\'s Iron Axe","italic":true}'}}},{Slot:1b,id:"minecraft:cookie",Count:1b,tag:{}}]} replace

# Item: Melon Seeds
setblock -2696 63 3036 minecraft:air
setblock -2696 63 3036 minecraft:barrel[facing=west]{Items:[{Slot:0b,id:"minecraft:wheat_seeds",Count:64b,tag:{}},{Slot:1b,id:"minecraft:cocoa_beans",Count:64b,tag:{}},{Slot:2b,id:"minecraft:wheat",Count:1b,tag:{}},{Slot:3b,id:"minecraft:melon_seeds",Count:1b,tag:{display:{Name:'{"text":"Prize-Winning Melon Seeds","italic":true}'}}},{Slot:4b,id:"minecraft:bone_meal",Count:1b,tag:{}}]} replace

# Quest: Spider Quest #1
setblock -2359 112 2903 minecraft:air
setblock -2359 113 2903 minecraft:air
setblock -2359 112 2903 minecraft:command_block{Command:"function fwl:spider-quest"}
setblock -2359 113 2903 minecraft:stone_pressure_plate

# Item: Spider Quest #1 Rewards Chest
setblock -2361 113 2897 minecraft:air
setblock -2361 113 2897 minecraft:trapped_chest[facing=north,type=single]{Lock:"Spider Quest Chest Key",CustomName:'{"text":"Storage Chest"}',Items:[{Slot:0b,id:"minecraft:chainmail_helmet",Count:1b,tag:{}},{Slot:1b,id:"minecraft:chainmail_chestplate",Count:1b,tag:{}},{Slot:2b,id:"minecraft:chainmail_leggings",Count:1b,tag:{}},{Slot:3b,id:"minecraft:chainmail_boots",Count:1b,tag:{}},{Slot:4b,id:"minecraft:torch",Count:10b,tag:{}}]} replace

# Item: Hana's ComicCon Ticket
setblock -2325 126 2904 minecraft:air
setblock -2325 126 2904 minecraft:trapped_chest[facing=east,type=single]{Items:[{Slot:0b,id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"Hana\'s ComicCon Ticket","italic":true}'}}},{Slot:1b,id:"minecraft:pumpkin_pie",Count:1b,tag:{}},{Slot:2b,id:"minecraft:glow_berries",Count:1b,tag:{}},{Slot:3b,id:"minecraft:leather_chestplate",Count:1b,tag:{}},{Slot:4b,id:"minecraft:leather_leggings",Count:1b,tag:{}}]} replace

#-----------------------------------------------------------------------
# Part Three
#-----------------------------------------------------------------------

# Item: Golden Blade of Whatever
setblock -2644 65 2728 minecraft:air
setblock -2644 65 2728 minecraft:chest[facing=west]{CustomName:'{"text":"Koldo\'s Stuff","color":"dark_blue","italic":true}',Items:[{Slot:0b,id:"minecraft:golden_sword",Count:1b,tag:{display:{Name:'{"text":"Golden Blade of Whatever","color":"yellow","italic":true}'}}}]} replace

# Geography: Dedric's Door
setblock -2689 83 2749 minecraft:warped_door[facing=east,open=false,hinge=left,half=lower]
setblock -2689 84 2749 minecraft:warped_door[facing=east,open=false,hinge=left,half=upper]

# Geography: Remove Gwenor's Door
setblock -2688 82 2768 minecraft:air
setblock -2689 82 2768 minecraft:air
setblock -2690 82 2768 minecraft:air
setblock -2691 82 2768 minecraft:air
setblock -2692 82 2768 minecraft:air

# Item: Withered Skull of Doom
setblock -2655 76 2762 minecraft:trapped_chest[facing=west,type=single]{Lock:"",CustomName:'{"text":"Osanna\'s Stuff","color":"dark_blue","italic":true}',Items:[{Slot:0b,id:"minecraft:wither_skeleton_skull",Count:1b,tag:{display:{Name:'{"text":"Withered Skull of Doom","italic":true}'}}}]} replace

# Geography: Replace Koldo's Wall
setblock -2647 65 2731 minecraft:mossy_stone_bricks
setblock -2647 66 2731 minecraft:mossy_stone_bricks

# Geography: Replace Dumbledoor's Wall
setblock -2625 22 2776 minecraft:stone_brick_wall
setblock -2625 23 2776 minecraft:stone_brick_wall

# Item: Flamel's Dust
setblock -2633 -8 2825 minecraft:air
summon minecraft:item_frame -2633 -8 2825 {Facing:1b,Item:{id:"minecraft:red_dye",Count:1b,tag:{display:{Name:'{"text":"Philosopher\'s Stone Dust"}'}}}, Tags: ["philosophers_stone_dust"]}
data merge entity @e[tag=philosophers_stone_dust,limit=1] {Invisible:1b}

# Geography: Remove Catacombs Exit Plate
setblock -2641 68 2747 minecraft:air

# Geography: Remove Renfeld's Entrance Plate
setblock -2679 83 2757 minecraft:air

# Book: The Crafter's Guide
setblock -2608 -41 2798 minecraft:air
setblock -2608 -41 2798 minecraft:lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"The Crafter\'s Guide"}'},pages:['{"text":"THE CRAFTER\'S GUIDE\\n\\nby Lalia Underhill\\n\\nThere\'s nothing quite as satisfying as creating something with your own two hands. In this guidebook, you\'ll find all the information you need to create several useful objects and "}','{"text":"experience for yourself, first-hand, the thrill of making.\\n\\nFor all items you\'ll need a crafting table. For some you might also need an anvil.\\n\\nCLOCK\\n\\nIngredients: Four gold ingots, one Redstone dust.\\n"}','{"text":"Recipe: Place the ingots in the N, E, S, and W positions with the dust in the center.\\n\\nCOMPASS\\n\\nIngredients: Four iron ingots, one Redstone dust.\\n\\nRecipe: Place the ingots in the N, E, S, and W positions with "}','{"text":"the dust in the center.\\n\\nSHEARS\\n\\nIngredients: Two iron ingots.\\n\\nRecipe: Place one ingot in the center and the other in the lower left-hand corner\\n\\nSPYGLASS\\n"}','{"text":"Ingredients: Two copper ingots, one Amethyst Shard.\\n\\nRecipe: Place the shard in the top, center spot. Place the two ingots in line below that.\\n"}'],title:"The Crafter's Guide",author:"Lalia Underhill",generation:0}}} replace

# Book: The Big Book of Anvils
setblock -2604 -41 2798 minecraft:air
setblock -2604 -41 2798 minecraft:lectern[facing=south,has_book=true]{Book:{id:"minecraft:written_book",Count:1b,tag:{display:{Name:'{"text":"The Big Book of Anvils"}'},pages:['{"text":"THE BIG BOOK OF ANVILS\\n\\nby Lalia Underhill\\n\\nThere\'s nothing quite as satisfying as banging an anvil. In this guidebook, you\'ll find all the information you need to get the most out of your new anvil.\\n\\n"}','{"text":"Anvils have been used throughout history to forge swords, craft armor, and fall on cartoon character\'s heads. Now you too can take part in this exciting world.\\n\\nHISTORY OF ANVILS\\n\\nThousands of years ago, someone created the anvil.\\n"}','{"text":"FAMOUS ANVILS\\n\\nI think one of them must have been used to create Thor\'s Hammer. idk.\\n\\nREPAIRING ITEMS\\n\\nYou may repair items by combining two similar items. You may also use materials originally required in "}','{"text":"the crafting of the item to repair a single item. Just put the thing in the little box and bang, bang, bang, you\'re done.\\n\\nRENAMING ITEMS\\n\\nJust put the thing in the little box, type a new name in the slot, and bang, bang, bang, you\'re done.\\n"}','{"text":"THE END\\n"}'],title:"The Big Book of Anvils",author:"Lalia Underhill",generation:0}}} replace

# Geography: Close Platform 9.75
setblock -2580 -41 2830 minecraft:stone
setblock -2580 -40 2830 minecraft:stone
setblock -2580 -39 2829 minecraft:air

# Druvine Storage Level Zero:
setblock -2595 -41 2818 minecraft:air
setblock -2595 -41 2817 minecraft:air
setblock -2595 -41 2816 minecraft:air
setblock -2595 -41 2818 minecraft:chest[facing=east]{CustomName:'"Chest"',Items:[{Slot:0,id:"minecraft:glowstone_dust",Count:1}]}
setblock -2595 -41 2817 minecraft:chest[facing=east]{CustomName:'"Chest"',Items:[{Slot:0,id:"minecraft:diamond",Count:3}]}
setblock -2595 -41 2816 minecraft:chest[facing=east]{CustomName:'"Druvine Storage"',Items:[{Slot:0,id:"minecraft:emerald",Count:3},{Slot:1,id:"minecraft:lapis_lazuli",Count:1}]}

setblock -2595 -39 2818 minecraft:air
setblock -2595 -39 2817 minecraft:air
setblock -2595 -39 2816 minecraft:air
setblock -2595 -39 2818 minecraft:barrel[facing=east]{CustomName:'"Barrel"',Items:[{Slot:0,id:"minecraft:apple",Count:4}]}
setblock -2595 -39 2817 minecraft:barrel[facing=east]{CustomName:'"Barrel"',Items:[{Slot:0,id:"minecraft:carrot",Count:8}]}
setblock -2595 -39 2816 minecraft:barrel[facing=east]{CustomName:'"Barrel"',Items:[{Slot:0,id:"minecraft:pumpkin_pie",Count:2}]}

setblock -2595 -39 2812 minecraft:air
setblock -2595 -40 2812 minecraft:air
setblock -2595 -39 2812 minecraft:barrel[facing=east]{CustomName:'"Barrel"',Items:[{Slot:0,id:"minecraft:stone_axe",Count:1}]}
setblock -2595 -40 2812 minecraft:barrel[facing=east]{CustomName:'"Barrel"',Items:[{Slot:0,id:"minecraft:stone_pickaxe",Count:1},{Slot:1,id:"minecraft:stick",Count:10}]}

# Druvine Storage Level Two
setblock -2600 -33 2840 minecraft:air
setblock -2600 -33 2840 minecraft:chest[facing=south]{CustomName:'"Public Supplies"',Items:[{Slot:0,id:"minecraft:coal",Count:64},{Slot:1,id:"minecraft:coal",Count:64},{Slot:2,id:"minecraft:coal",Count:64},{Slot:3,id:"minecraft:coal",Count:64},{Slot:4,id:"minecraft:charcoal",Count:32},{Slot:9,id:"minecraft:flint_and_steel",Count:1}]} replace

# Summon NPC
#summon flashnpcs:npc -2594 -49 2801 {dialogue: "sadie", texture: "http://textures.minecraft.net/texture/754776cea16cf74d97cd06b552d56c91035243ee5a86d7a91517f81163188c6c", Rotation: [-29.467468f, 0.0f], textColor: 12566272, CustomName: '{"text":"Sadie"}'}
