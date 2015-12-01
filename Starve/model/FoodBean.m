//
//  FoodBean.m
//  FoodSimulator
//
//  Created by Shuwei on 15/11/30.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "FoodBean.h"

@implementation FoodBean
-(NSMutableArray *)getFood{
    NSMutableArray *foods = [[NSMutableArray alloc] init];
    FoodBean *Berries = [[FoodBean alloc] init];
    Berries.name = @"浆果";
    Berries.eName = @"berries";
    Berries.img=@"berries";
    Berries.health=0;
    Berries.hunger=9.375;
    Berries.sanity=0;
    Berries.perish=6;
    Berries.isFruit=YES;
    Berries.value=0.5;
    [foods addObject:Berries];
    
    FoodBean *berries_cooked = [[FoodBean alloc] init];
    berries_cooked.name = @"烤浆果";
    berries_cooked.eName = @"Roasted Berries";
    berries_cooked.img=@"berries_cooked";
    berries_cooked.health=1;
    berries_cooked.hunger=12.5;
    berries_cooked.sanity=0;
    berries_cooked.perish=3;
    berries_cooked.isFruit=YES;
    berries_cooked.value=0.5;
    berries_cooked.isCooked=YES;
    [foods addObject:berries_cooked];
    
    FoodBean *birchnut = [[FoodBean alloc] init];
    birchnut.name = @"橡树果";
    birchnut.eName = @"Birchnut";
    birchnut.img=@"birchnut";
    birchnut.health=0;
    birchnut.hunger=0;
    birchnut.sanity=0;
    birchnut.perish=20;
    birchnut.isSeed=YES;
    birchnut.value=1;
    [foods addObject:birchnut];
    
    FoodBean *birchnut_cooked = [[FoodBean alloc] init];
    birchnut_cooked.name = @"烤橡树果";
    birchnut_cooked.eName = @"Roasted Birchnut";
    birchnut_cooked.img=@"birchnut_cooked";
    birchnut_cooked.health=1;
    birchnut_cooked.hunger=9;
    birchnut_cooked.sanity=0;
    birchnut_cooked.perish=6;
    birchnut_cooked.isSeed=YES;
    birchnut_cooked.value=1;
    birchnut_cooked.isCooked=YES;
    [foods addObject:birchnut_cooked];
    
    FoodBean *bird_egg = [[FoodBean alloc] init];
    bird_egg.name = @"鸟蛋";
    bird_egg.eName = @"Egg";
    bird_egg.img=@"bird_egg";
    bird_egg.health=0;
    bird_egg.hunger=9;
    bird_egg.sanity=0;
    bird_egg.perish=10;
    bird_egg.isEgg=YES;
    bird_egg.value=1;
    [foods addObject:bird_egg];
    
    FoodBean *bird_egg_cooked = [[FoodBean alloc] init];
    bird_egg_cooked.name = @"煎蛋";
    bird_egg_cooked.eName = @"Cooked Egg";
    bird_egg_cooked.img=@"bird_egg_cooked";
    bird_egg_cooked.health=0;
    bird_egg_cooked.hunger=13;
    bird_egg_cooked.sanity=0;
    bird_egg_cooked.perish=6;
    bird_egg_cooked.isEgg=YES;
    bird_egg_cooked.value=1;
    bird_egg_cooked.isCooked=YES;
    [foods addObject:bird_egg_cooked];
    
    FoodBean *blue_mushroom = [[FoodBean alloc] init];
    blue_mushroom.name = @"蓝蘑菇";
    blue_mushroom.eName = @"Blue Cap";
    blue_mushroom.img=@"blue_mushroom";
    blue_mushroom.health=20;
    blue_mushroom.hunger=13;
    blue_mushroom.sanity=-15;
    blue_mushroom.perish=10;
    blue_mushroom.isVeggie=YES;
    blue_mushroom.value=0.5;
    [foods addObject:blue_mushroom];
    
    FoodBean *blue_mushroom_cooked = [[FoodBean alloc] init];
    blue_mushroom_cooked.name = @"烤蓝蘑菇";
    blue_mushroom_cooked.eName = @"Cooked Blue Cap";
    blue_mushroom_cooked.img=@"blue_mushroom_cooked";
    blue_mushroom_cooked.health=-3;
    blue_mushroom_cooked.hunger=0;
    blue_mushroom_cooked.sanity=10;
    blue_mushroom_cooked.perish=10;
    blue_mushroom_cooked.isVeggie=YES;
    blue_mushroom_cooked.value=0.5;
    blue_mushroom_cooked.isCooked=YES;
    [foods addObject:blue_mushroom_cooked];
    
    
    FoodBean *butter = [[FoodBean alloc] init];
    butter.name = @"黄油";
    butter.eName = @"Butter";
    butter.img=@"butter";
    butter.health=40;
    butter.hunger=25;
    butter.sanity=0;
    butter.perish=40;
    butter.isDairy=YES;
    butter.value=1;
    [foods addObject:butter];
    
    
    FoodBean *butterfly_wings = [[FoodBean alloc] init];
    butterfly_wings.name = @"蝴蝶翅膀";
    butterfly_wings.eName = @"Butterfly Wings";
    butterfly_wings.img=@"butterfly_wings";
    butterfly_wings.health=8;
    butterfly_wings.hunger=9;
    butterfly_wings.sanity=0;
    butterfly_wings.perish=6;
    butterfly_wings.isVeggie=YES;
    butterfly_wings.value=2;
    [foods addObject:butterfly_wings];
    
    FoodBean *cactus_flower = [[FoodBean alloc] init];
    cactus_flower.name = @"仙人掌花";
    cactus_flower.eName = @"Cactus Flower";
    cactus_flower.img=@"cactus_flower";
    cactus_flower.health=8;
    cactus_flower.hunger=13;
    cactus_flower.sanity=5;
    cactus_flower.perish=3;
    cactus_flower.isVeggie=YES;
    cactus_flower.value=0.5;
    [foods addObject:cactus_flower];
    
    FoodBean *cactus_meat = [[FoodBean alloc] init];
    cactus_meat.name = @"仙人掌";
    cactus_meat.eName = @"Cactus Flesh";
    cactus_meat.img=@"cactus_meat";
    cactus_meat.health=-3;
    cactus_meat.hunger=13;
    cactus_meat.sanity=-5;
    cactus_meat.perish=10;
    cactus_meat.isVeggie=YES;
    cactus_meat.value=1;
    [foods addObject:cactus_meat];
    
    FoodBean *cactus_meat_cooked = [[FoodBean alloc] init];
    cactus_meat_cooked.name = @"烤仙人掌";
    cactus_meat_cooked.eName = @"Cooked Cactus Flesh";
    cactus_meat_cooked.img=@"cactus_meat_cooked";
    cactus_meat_cooked.health=-3;
    cactus_meat_cooked.hunger=13;
    cactus_meat_cooked.sanity=-5;
    cactus_meat_cooked.perish=10;
    cactus_meat_cooked.isVeggie=YES;
    cactus_meat_cooked.value=1;
    cactus_meat_cooked.isCooked=YES;
    [foods addObject:cactus_meat_cooked];
    
    FoodBean *carrot = [[FoodBean alloc] init];
    carrot.name = @"胡萝卜";
    carrot.eName = @"Carrot";
    carrot.img=@"carrot";
    carrot.health=1;
    carrot.hunger=13;
    carrot.sanity=0;
    carrot.perish=10;
    carrot.isVeggie=YES;
    carrot.value=1;
    [foods addObject:carrot];

    FoodBean *carrot_cooked = [[FoodBean alloc] init];
    carrot_cooked.name = @"烤胡萝卜";
    carrot_cooked.eName = @"Roasted Carrot";
    carrot_cooked.img=@"carrot_cooked";
    carrot_cooked.health=3;
    carrot_cooked.hunger=13;
    carrot_cooked.sanity=0;
    carrot_cooked.perish=6;
    carrot_cooked.isVeggie=YES;
    carrot_cooked.value=1;
    carrot_cooked.isCooked=YES;
    [foods addObject:carrot_cooked];
    
    FoodBean *cave_banana = [[FoodBean alloc] init];
    cave_banana.name = @"洞穴香蕉";
    cave_banana.eName = @"Cave Banana";
    cave_banana.img=@"cave_banana";
    cave_banana.health=1;
    cave_banana.hunger=13;
    cave_banana.sanity=0;
    cave_banana.perish=10;
    cave_banana.isFruit=YES;
    cave_banana.value=1;
    [foods addObject:cave_banana];
    
    FoodBean *cave_banana_cooked = [[FoodBean alloc] init];
    cave_banana_cooked.name = @"烤香蕉";
    cave_banana_cooked.eName = @"Cooked Banana";
    cave_banana_cooked.img=@"cave_banana_cooked";
    cave_banana_cooked.health=3;
    cave_banana_cooked.hunger=13;
    cave_banana_cooked.sanity=0;
    cave_banana_cooked.perish=6;
    cave_banana_cooked.isFruit=YES;
    cave_banana_cooked.value=1;
    cave_banana_cooked.isCooked=YES;
    [foods addObject:cave_banana_cooked];
    
    FoodBean *corn = [[FoodBean alloc] init];
    corn.name = @"玉米";
    corn.eName = @"Corn";
    corn.img=@"corn";
    corn.health=3;
    corn.hunger=25;
    corn.sanity=0;
    corn.perish=10;
    corn.isVeggie=YES;
    corn.value=1;
    [foods addObject:corn];
    
    FoodBean *corn_cooked = [[FoodBean alloc] init];
    corn_cooked.name = @"爆米花";
    corn_cooked.eName = @"Popcorn";
    corn_cooked.img=@"corn_cooked";
    corn_cooked.health=3;
    corn_cooked.hunger=13;
    corn_cooked.sanity=0;
    corn_cooked.perish=15;
    corn_cooked.isVeggie=YES;
    corn_cooked.value=1;
    corn_cooked.isCooked=YES;
    [foods addObject:corn_cooked];
    
    FoodBean *cutlichen = [[FoodBean alloc] init];
    cutlichen.name = @"苔藓";
    cutlichen.eName = @"Lichen";
    cutlichen.img=@"cutlichen";
    cutlichen.health=3;
    cutlichen.hunger=13;
    cutlichen.sanity=-5;
    cutlichen.perish=2;
    cutlichen.isVeggie=YES;
    cutlichen.value=1;
    [foods addObject:cutlichen];
    
    FoodBean *dragonfruit = [[FoodBean alloc] init];
    dragonfruit.name = @"火龙果";
    dragonfruit.eName = @"Dragon Fruit";
    dragonfruit.img=@"dragonfruit";
    dragonfruit.health=3;
    dragonfruit.hunger=9;
    dragonfruit.sanity=0;
    dragonfruit.perish=6;
    dragonfruit.isFruit=YES;
    dragonfruit.value=1;
    [foods addObject:dragonfruit];
    
    FoodBean *dragonfruit_cooked = [[FoodBean alloc] init];
    dragonfruit_cooked.name = @"烤火龙果";
    dragonfruit_cooked.eName = @"Prepared Dragon Fruit";
    dragonfruit_cooked.img=@"dragonfruit_cooked";
    dragonfruit_cooked.health=20;
    dragonfruit_cooked.hunger=13;
    dragonfruit_cooked.sanity=0;
    dragonfruit_cooked.perish=3;
    dragonfruit_cooked.isFruit=YES;
    dragonfruit_cooked.value=1;
    dragonfruit_cooked.isCooked=YES;
    [foods addObject:dragonfruit_cooked];
    
    FoodBean *drumstick = [[FoodBean alloc] init];
    drumstick.name = @"鸡腿";
    drumstick.eName = @"Drumstick";
    drumstick.img=@"drumstick";
    drumstick.health=0;
    drumstick.hunger=13;
    drumstick.sanity=-10;
    drumstick.perish=6;
    drumstick.isMeat=YES;
    drumstick.value=0.5;
    [foods addObject:drumstick];
    
    FoodBean *drumstick_cooked = [[FoodBean alloc] init];
    drumstick_cooked.name = @"烤鸡腿";
    drumstick_cooked.eName = @"Fried Drumstick";
    drumstick_cooked.img=@"drumstick_cooked";
    drumstick_cooked.health=1;
    drumstick_cooked.hunger=13;
    drumstick_cooked.sanity=0;
    drumstick_cooked.perish=10;
    drumstick_cooked.isMeat=YES;
    drumstick_cooked.value=0.5;
    drumstick_cooked.isCooked=YES;
    [foods addObject:drumstick_cooked];
    
    FoodBean *durian = [[FoodBean alloc] init];
    durian.name = @"榴莲";
    durian.eName = @"Durian";
    durian.img=@"durian";
    durian.health=-3;
    durian.hunger=25;
    durian.sanity=-5;
    durian.perish=10;
    durian.isFruit=YES;
    durian.value=1;
    durian.isMonster=YES;
    durian.monster=1;
    [foods addObject:durian];
    
    FoodBean *durian_cooked = [[FoodBean alloc] init];
    durian_cooked.name = @"烤榴莲";
    durian_cooked.eName = @"Extra Smelly Durian";
    durian_cooked.img=@"durian_cooked";
    durian_cooked.health=0;
    durian_cooked.hunger=25;
    durian_cooked.sanity=-5;
    durian_cooked.perish=6;
    durian_cooked.isFruit=YES;
    durian_cooked.value=1;
    durian_cooked.isMonster=YES;
    durian_cooked.monster=1;
    durian_cooked.isCooked=YES;
    [foods addObject:durian_cooked];
    
    FoodBean *eel = [[FoodBean alloc] init];
    eel.name = @"鳗鱼";
    eel.eName = @"Eel";
    eel.img=@"eel";
    eel.health=3;
    eel.hunger=9;
    eel.sanity=0;
    eel.perish=3;
    eel.isMeat=YES;
    eel.value=0.5;
    eel.isFish=YES;
    eel.fish=1;
    [foods addObject:eel];
    
    FoodBean *eel_cooked = [[FoodBean alloc] init];
    eel_cooked.name = @"烤鳗鱼";
    eel_cooked.eName = @"Cooked Eel";
    eel_cooked.img=@"eel_cooked";
    eel_cooked.health=8;
    eel_cooked.hunger=13;
    eel_cooked.sanity=0;
    eel_cooked.perish=6;
    eel_cooked.isMeat=YES;
    eel_cooked.value=0.5;
    eel_cooked.isFish=YES;
    eel_cooked.fish=1;
    eel_cooked.isCooked=YES;
    [foods addObject:eel_cooked];
    
    
    FoodBean *eggplant = [[FoodBean alloc] init];
    eggplant.name = @"茄子";
    eggplant.eName = @"Eggplant";
    eggplant.img=@"eggplant";
    eggplant.health=8;
    eggplant.hunger=25;
    eggplant.sanity=0;
    eggplant.perish=10;
    eggplant.isVeggie=YES;
    eggplant.value=1;
    [foods addObject:eggplant];
    
    FoodBean *eggplant_cooked = [[FoodBean alloc] init];
    eggplant_cooked.name = @"烤茄子";
    eggplant_cooked.eName = @"Braised Eggplant";
    eggplant_cooked.img=@"eggplant_cooked";
    eggplant_cooked.health=20;
    eggplant_cooked.hunger=25;
    eggplant_cooked.sanity=0;
    eggplant_cooked.perish=6;
    eggplant_cooked.isVeggie=YES;
    eggplant_cooked.value=1;
    eggplant_cooked.isCooked=YES;
    [foods addObject:eggplant_cooked];
    
    FoodBean *electric_milk = [[FoodBean alloc] init];
    electric_milk.name = @"牛奶";
    electric_milk.eName = @"Electric Milk";
    electric_milk.img=@"electric_milk";
    electric_milk.health=3;
    electric_milk.hunger=13;
    electric_milk.sanity=10;
    electric_milk.perish=6;
    electric_milk.isDairy=YES;
    electric_milk.value=1;
    [foods addObject:electric_milk];
    
    FoodBean *fish = [[FoodBean alloc] init];
    fish.name = @"鱼";
    fish.eName = @"Fish";
    fish.img=@"fish";
    fish.health=1;
    fish.hunger=13;
    fish.sanity=0;
    fish.perish=3;
    fish.isMeat=YES;
    fish.value=0.5;
    fish.isFish=YES;
    fish.fish=1;
    [foods addObject:fish];
    
    FoodBean *fish_cooked = [[FoodBean alloc] init];
    fish_cooked.name = @"烤鱼";
    fish_cooked.eName = @"Cooked Fish";
    fish_cooked.img=@"fish_cooked";
    fish_cooked.health=1;
    fish_cooked.hunger=13;
    fish_cooked.sanity=0;
    fish_cooked.perish=6;
    fish_cooked.isMeat=YES;
    fish_cooked.value=0.5;
    fish_cooked.isFish=YES;
    fish_cooked.fish=1;
    fish_cooked.isCooked=YES;
    [foods addObject:fish_cooked];
    
    FoodBean *frog_legs = [[FoodBean alloc] init];
    frog_legs.name = @"青蛙腿";
    frog_legs.eName = @"Frog Legs";
    frog_legs.img=@"frog_legs";
    frog_legs.health=0;
    frog_legs.hunger=13;
    frog_legs.sanity=-10;
    frog_legs.perish=6;
    frog_legs.isMeat=YES;
    frog_legs.value=0.5;
    [foods addObject:frog_legs];
    
    FoodBean *frog_legs_cooked = [[FoodBean alloc] init];
    frog_legs_cooked.name = @"烤青蛙腿";
    frog_legs_cooked.eName = @"Cooked Frog Legs";
    frog_legs_cooked.img=@"frog_legs_cooked";
    frog_legs_cooked.health=1;
    frog_legs_cooked.hunger=13;
    frog_legs_cooked.sanity=0;
    frog_legs_cooked.perish=10;
    frog_legs_cooked.isMeat=YES;
    frog_legs_cooked.value=0.5;
    frog_legs_cooked.isCooked=YES;
    [foods addObject:frog_legs_cooked];
    
    FoodBean *green_mushroom = [[FoodBean alloc] init];
    green_mushroom.name = @"绿蘑菇";
    green_mushroom.eName = @"Green Cap";
    green_mushroom.img=@"green_mushroom";
    green_mushroom.health=0;
    green_mushroom.hunger=13;
    green_mushroom.sanity=-50;
    green_mushroom.perish=10;
    green_mushroom.isVeggie=YES;
    green_mushroom.value=0.5;
    [foods addObject:green_mushroom];
    
    FoodBean *green_mushroom_cooked = [[FoodBean alloc] init];
    green_mushroom_cooked.name = @"烤绿蘑菇";
    green_mushroom_cooked.eName = @"Cooked Green Cap";
    green_mushroom_cooked.img=@"green_mushroom_cooked";
    green_mushroom_cooked.health=-1;
    green_mushroom_cooked.hunger=0;
    green_mushroom_cooked.sanity=15;
    green_mushroom_cooked.perish=10;
    green_mushroom_cooked.isVeggie=YES;
    green_mushroom_cooked.value=0.5;
    green_mushroom_cooked.isCooked=YES;
    [foods addObject:green_mushroom_cooked];

    
    FoodBean *honey = [[FoodBean alloc] init];
    honey.name = @"蜂蜜";
    honey.eName = @"Honey";
    honey.img=@"honey";
    honey.health=3;
    honey.hunger=9;
    honey.sanity=0;
    honey.perish=40;
    honey.isHoney=YES;
    honey.value=1;
    [foods addObject:honey];
    
    FoodBean *honeycomb = [[FoodBean alloc] init];
    honeycomb.name = @"蜂窝";
    honeycomb.eName = @"Honeycomb";
    honeycomb.img=@"honeycomb";
    honeycomb.health=0;
    honeycomb.hunger=0;
    honeycomb.sanity=0;
    honeycomb.perish=-1;
    honeycomb.isHoney=YES;
    honeycomb.value=1;
    [foods addObject:honeycomb];
    
    FoodBean *ice = [[FoodBean alloc] init];
    ice.name = @"冰块";
    ice.eName = @"Ice";
    ice.img=@"ice";
    ice.health=0;
    ice.hunger=0;
    ice.sanity=0;
    ice.perish=3;
    ice.isIce=YES;
    ice.value=1;
    [foods addObject:ice];
    
    FoodBean *mandrake = [[FoodBean alloc] init];
    mandrake.name = @"曼德拉草";
    mandrake.eName = @"Mandrake";
    mandrake.img=@"mandrake";
    mandrake.health=60;
    mandrake.hunger=75;
    mandrake.sanity=0;
    mandrake.perish=-1;
    mandrake.isVeggie=YES;
    mandrake.value=1;
    mandrake.isMagic=YES;
    mandrake.magic=1;
    [foods addObject:mandrake];
    
    FoodBean *meat = [[FoodBean alloc] init];
    meat.name = @"大肉";
    meat.eName = @"Meat";
    meat.img=@"meat";
    meat.health=1;
    meat.hunger=25;
    meat.sanity=-10;
    meat.perish=6;
    meat.isMeat=YES;
    meat.value=1;
    [foods addObject:meat];
    
    FoodBean *meat_cooked = [[FoodBean alloc] init];
    meat_cooked.name = @"烤肉";
    meat_cooked.eName = @"Cooked Meat";
    meat_cooked.img=@"meat_cooked";
    meat_cooked.health=3;
    meat_cooked.hunger=25;
    meat_cooked.sanity=0;
    meat_cooked.perish=10;
    meat_cooked.isMeat=YES;
    meat_cooked.value=1;
    meat_cooked.isCooked=YES;
    [foods addObject:meat_cooked];
    
    FoodBean *meat_dried = [[FoodBean alloc] init];
    meat_dried.name = @"肉干";
    meat_dried.eName = @"Jerky";
    meat_dried.img=@"meat_dried";
    meat_dried.health=20;
    meat_dried.hunger=25;
    meat_dried.sanity=15;
    meat_dried.perish=20;
    meat_dried.isMeat=YES;
    meat_dried.value=1;
    meat_dried.isDried=YES;
    [foods addObject:meat_dried];
    
    FoodBean *mole = [[FoodBean alloc] init];
    mole.name = @"鼹鼠";
    mole.eName = @"Moleworm";
    mole.img=@"mole";
    mole.health=0;
    mole.hunger=0;
    mole.sanity=0;
    mole.perish=-1;
    mole.isMeat=YES;
    mole.value=0.5;
    [foods addObject:mole];
    
    FoodBean *monster_meat = [[FoodBean alloc] init];
    monster_meat.name = @"怪物肉";
    monster_meat.eName = @"Monster Meat";
    monster_meat.img=@"monster_meat";
    monster_meat.health=-20;
    monster_meat.hunger=19;
    monster_meat.sanity=-15;
    monster_meat.perish=6;
    monster_meat.isMeat=YES;
    monster_meat.value=1;
    monster_meat.isMonster=YES;
    monster_meat.monster=1;
    [foods addObject:monster_meat];
    
    FoodBean *monster_meat_cooked = [[FoodBean alloc] init];
    monster_meat_cooked.name = @"烤怪物肉";
    monster_meat_cooked.eName = @"Cooked Monster Meat";
    monster_meat_cooked.img=@"monster_meat_cooked";
    monster_meat_cooked.health=-3;
    monster_meat_cooked.hunger=19;
    monster_meat_cooked.sanity=-10;
    monster_meat_cooked.perish=15;
    monster_meat_cooked.isMeat=YES;
    monster_meat_cooked.value=1;
    monster_meat_cooked.isMonster=YES;
    monster_meat_cooked.monster=1;
    monster_meat_cooked.isCooked=YES;
    [foods addObject:monster_meat_cooked];
    
    FoodBean *monster_meat_dried = [[FoodBean alloc] init];
    monster_meat_dried.name = @"怪物肉干";
    monster_meat_dried.eName = @"Monster Jerky";
    monster_meat_dried.img=@"monster_meat_dried";
    monster_meat_dried.health=-3;
    monster_meat_dried.hunger=19;
    monster_meat_dried.sanity=-5;
    monster_meat_dried.perish=20;
    monster_meat_dried.isMeat=YES;
    monster_meat_dried.value=1;
    monster_meat_dried.isMonster=YES;
    monster_meat_dried.monster=1;
    monster_meat_dried.isDried=YES;
    [foods addObject:monster_meat_dried];
    
    FoodBean *morsel = [[FoodBean alloc] init];
    morsel.name = @"碎肉";
    morsel.eName = @"Morsel";
    morsel.img=@"morsel";
    morsel.health=0;
    morsel.hunger=13;
    morsel.sanity=-10;
    morsel.perish=6;
    morsel.isMeat=YES;
    morsel.value=0.5;
    [foods addObject:morsel];
    
    
    FoodBean *morsel_cooked = [[FoodBean alloc] init];
    morsel_cooked.name = @"烤碎肉";
    morsel_cooked.eName = @"Cooked Morsel";
    morsel_cooked.img=@"morsel_cooked";
    morsel_cooked.health=1;
    morsel_cooked.hunger=13;
    morsel_cooked.sanity=0;
    morsel_cooked.perish=10;
    morsel_cooked.isMeat=YES;
    morsel_cooked.value=0.5;
    morsel_cooked.isCooked=YES;
    [foods addObject:morsel_cooked];
    
    
    FoodBean *morsel_dried = [[FoodBean alloc] init];
    morsel_dried.name = @"小肉干";
    morsel_dried.eName = @"Small Jerky";
    morsel_dried.img=@"morsel_dried";
    morsel_dried.health=8;
    morsel_dried.hunger=13;
    morsel_dried.sanity=10;
    morsel_dried.perish=20;
    morsel_dried.isMeat=YES;
    morsel_dried.value=0.5;
    morsel_dried.isDried=YES;
    [foods addObject:morsel_dried];
    
    FoodBean *pomegranate = [[FoodBean alloc] init];
    pomegranate.name = @"石榴";
    pomegranate.eName = @"Pomegranate";
    pomegranate.img=@"pomegranate";
    pomegranate.health=3;
    pomegranate.hunger=9;
    pomegranate.sanity=0;
    pomegranate.perish=6;
    pomegranate.isFruit=YES;
    pomegranate.value=1;
    [foods addObject:pomegranate];

    FoodBean *pomegranate_cooked = [[FoodBean alloc] init];
    pomegranate_cooked.name = @"烤石榴";
    pomegranate_cooked.eName = @"Sliced Pomegranate";
    pomegranate_cooked.img=@"pomegranate_cooked";
    pomegranate_cooked.health=20;
    pomegranate_cooked.hunger=13;
    pomegranate_cooked.sanity=0;
    pomegranate_cooked.perish=3;
    pomegranate_cooked.isFruit=YES;
    pomegranate_cooked.value=1;
    pomegranate_cooked.isCooked=YES;
    [foods addObject:pomegranate_cooked];

    FoodBean *pumpkin = [[FoodBean alloc] init];
    pumpkin.name = @"南瓜";
    pumpkin.eName = @"Pumpkin";
    pumpkin.img=@"pumpkin";
    pumpkin.health=3;
    pumpkin.hunger=38;
    pumpkin.sanity=0;
    pumpkin.perish=10;
    pumpkin.isVeggie=YES;
    pumpkin.value=1;
    [foods addObject:pumpkin];

    FoodBean *pumpkin_cooked = [[FoodBean alloc] init];
    pumpkin_cooked.name = @"烤南瓜";
    pumpkin_cooked.eName = @"Hot Pumpkin";
    pumpkin_cooked.img=@"pumpkin_cooked";
    pumpkin_cooked.health=8;
    pumpkin_cooked.hunger=38;
    pumpkin_cooked.sanity=0;
    pumpkin_cooked.perish=6;
    pumpkin_cooked.isVeggie=YES;
    pumpkin_cooked.value=1;
    pumpkin_cooked.isCooked=YES;
    [foods addObject:pumpkin_cooked];
    
    FoodBean *red_mushroom = [[FoodBean alloc] init];
    red_mushroom.name = @"红蘑菇";
    red_mushroom.eName = @"Red Cap";
    red_mushroom.img=@"red_mushroom";
    red_mushroom.health=-20;
    red_mushroom.hunger=13;
    red_mushroom.sanity=0;
    red_mushroom.perish=10;
    red_mushroom.isVeggie=YES;
    red_mushroom.value=0.5;
    [foods addObject:red_mushroom];
    
    FoodBean *red_mushroom_cooked = [[FoodBean alloc] init];
    red_mushroom_cooked.name = @"烤红蘑菇";
    red_mushroom_cooked.eName = @"Cooked Red Cap";
    red_mushroom_cooked.img=@"red_mushroom_cooked";
    red_mushroom_cooked.health=1;
    red_mushroom_cooked.hunger=0;
    red_mushroom_cooked.sanity=-10;
    red_mushroom_cooked.perish=10;
    red_mushroom_cooked.isVeggie=YES;
    red_mushroom_cooked.value=0.5;
    red_mushroom_cooked.isCooked=YES;
    [foods addObject:red_mushroom_cooked];
    
    FoodBean *tallbird_egg = [[FoodBean alloc] init];
    tallbird_egg.name = @"高鸟蛋";
    tallbird_egg.eName = @"Tallbird Egg";
    tallbird_egg.img=@"tallbird_egg";
    tallbird_egg.health=3;
    tallbird_egg.hunger=25;
    tallbird_egg.sanity=0;
    tallbird_egg.perish=-1;
    tallbird_egg.isEgg=YES;
    tallbird_egg.value=4;
    [foods addObject:tallbird_egg];

    FoodBean *tallbird_egg_cooked = [[FoodBean alloc] init];
    tallbird_egg_cooked.name = @"烤高鸟蛋";
    tallbird_egg_cooked.eName = @"Fried Tallbird Egg";
    tallbird_egg_cooked.img=@"tallbird_egg_cooked";
    tallbird_egg_cooked.health=0;
    tallbird_egg_cooked.hunger=38;
    tallbird_egg_cooked.sanity=0;
    tallbird_egg_cooked.perish=6;
    tallbird_egg_cooked.isEgg=YES;
    tallbird_egg_cooked.value=4;
    tallbird_egg_cooked.isCooked=YES;
    [foods addObject:tallbird_egg_cooked];
    
    FoodBean *twigs = [[FoodBean alloc] init];
    twigs.name = @"树枝";
    twigs.eName = @"Twigs";
    twigs.img=@"twigs";
    twigs.health=0;
    twigs.hunger=0;
    twigs.sanity=0;
    twigs.perish=-1;
    twigs.isTree=YES;
    twigs.value=1;
    [foods addObject:twigs];
    
    FoodBean *watermelon = [[FoodBean alloc] init];
    watermelon.name = @"西瓜";
    watermelon.eName = @"Watermelon";
    watermelon.img=@"watermelon";
    watermelon.health=3;
    watermelon.hunger=13;
    watermelon.sanity=5;
    watermelon.perish=6;
    watermelon.isFruit=YES;
    watermelon.value=1;
    [foods addObject:watermelon];
    
    
    FoodBean *watermelon_cooked = [[FoodBean alloc] init];
    watermelon_cooked.name = @"烤西瓜";
    watermelon_cooked.eName = @"Grilled Watermelon";
    watermelon_cooked.img=@"watermelon_cooked";
    watermelon_cooked.health=1;
    watermelon_cooked.hunger=13;
    watermelon_cooked.sanity=8;
    watermelon_cooked.perish=3;
    watermelon_cooked.isFruit=YES;
    watermelon_cooked.value=1;
    watermelon_cooked.isCooked=YES;
    [foods addObject:watermelon_cooked];
    
    return foods;
    
}
@end
