# summon a frame
summon minecraft:item_frame -3110 11 3204 {Facing:1b,Item:{id:"minecraft:iron_shovel",Count:1b},Tags: ["jepsons_shovel"]}
# turn it invisible
data merge entity @e[tag=jepsons_shovel,limit=1] {Invisible:1}