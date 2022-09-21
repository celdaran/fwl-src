# summon a frame with a named item in it
summon minecraft:item_frame -2633 -8 2825 {Facing:1b,Item:{id:"minecraft:red_dye",Count:1b,tag:{display:{Name:'{"text":"Philosopher\'s Stone Dust"}'}}}, Tags: ["philosophers_stone_dust"]}
# turn it invisible
data merge entity @e[tag=philosophers_stone_dust,limit=1] {Invisible:1b}