//
//  ViewController.m
//  FoodSimulator
//
//  Created by Shuwei on 15/11/30.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "SimulatorController.h"

@interface SimulatorController ()

@end

@implementation SimulatorController{
    NSMutableArray *cookFoods;
    NSMutableArray *foodList;
    MBProgressHUD *HUD;
    CGFloat width;
    UIView *topView;
    UIScrollView *scroll;
    UIImageView *m1,*m2,*m3,*m4;
    FoodBean *f1,*f2,*f3,*f4;
    UIView *resultView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"食谱模拟器";
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:HUD];
    HUD.labelText = @"加载中...";
    [HUD show:YES];
    cookFoods = [[NSMutableArray alloc] init];
    width = self.view.frame.size.width/4.0f;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"clear"] style:UIBarButtonItemStyleBordered target:self action:@selector(doClear:)];
    rightItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =rightItem;
}
-(IBAction)doClear:(id)sender{
    [cookFoods removeAllObjects];
    f1=nil;
    f2=nil;
    f3=nil;
    f4=nil;
    m1.image=nil;
    m2.image=nil;
    m3.image=nil;
    m4.image=nil;
    [self reMakeView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 62)];
    UIImageView *m11 = [[UIImageView alloc] initWithFrame:CGRectMake(1, 2, width, 60)];
    m11.image=[UIImage imageNamed:@"background"];
    m1= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, width-10, 50)];
    m1.tag=-1;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap1.cancelsTouchesInView=NO;
    tap1.delegate = self;
    [m1 setUserInteractionEnabled:YES];
    [m11 setUserInteractionEnabled:YES];
    [m1 addGestureRecognizer:tap1];
    
    [m11 addSubview:m1];
    [m11 bringSubviewToFront:m1];
    [topView addSubview:m11];
    
    UIImageView *m22 = [[UIImageView alloc] initWithFrame:CGRectMake(1+width, 2, width, 60)];
    m22.image=[UIImage imageNamed:@"background"];
    m2= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, width-10, 50)];
    [m22 addSubview:m2];
    m2.tag=-2;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap2.cancelsTouchesInView=NO;
    tap2.delegate = self;
    [m2 setUserInteractionEnabled:YES];
    [m22 setUserInteractionEnabled:YES];
    [m2 addGestureRecognizer:tap2];
    
    [topView addSubview:m22];
    
    UIImageView *m33 = [[UIImageView alloc] initWithFrame:CGRectMake(2+width*2, 2, width, 60)];
    m33.image=[UIImage imageNamed:@"background"];
    m3= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, width-10, 50)];
    [m33 addSubview:m3];
    m3.tag=-3;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap3.cancelsTouchesInView=NO;
    tap3.delegate = self;
    [m3 setUserInteractionEnabled:YES];
    [m33 setUserInteractionEnabled:YES];
    [m3 addGestureRecognizer:tap3];
    [topView addSubview:m33];
    UIImageView *m44 = [[UIImageView alloc] initWithFrame:CGRectMake(3+width*3, 2, width, 60)];
    m44.image=[UIImage imageNamed:@"background"];
    m4= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, width-10, 50)];
    [m44 addSubview:m4];
    m4.tag=-4;
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap4.cancelsTouchesInView=NO;
    tap4.delegate = self;
    [m4 setUserInteractionEnabled:YES];
    [m44 setUserInteractionEnabled:YES];
    [m4 addGestureRecognizer:tap4];
    [topView addSubview:m44];
    
    scroll = [[UIScrollView alloc] init];
    scroll.frame = CGRectMake(0, 126, self.view.frame.size.width, self.view.frame.size.height-126);
    scroll.backgroundColor = [Common colorWithHexString:@"e0e0e0"];
    resultView = [[UIView alloc] initWithFrame:CGRectMake(0, 126, self.view.frame.size.width, 60)];
    resultView.backgroundColor=[Common colorWithHexString:@"e0e0e0"];
    foodList = [[[FoodBean alloc] init] getFood];
    NSInteger size =[foodList count];
    CGFloat x,y;
    for(int i=0;i<size;i++){
        FoodBean *bean = [foodList objectAtIndex:i];
        x = i%4*width;
        y=i/4*60;
        UIView *b6 = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, 60)];
        b6.backgroundColor=[UIColor whiteColor];
        b6.layer.borderWidth=0.5;
        b6.layer.borderColor=[Common colorWithHexString:@"e0e0e0"].CGColor;
        UIImageView *i6 = [[UIImageView alloc] initWithFrame:CGRectMake( (width-35)/2, 5, 35, 35)];
        i6.image = [UIImage imageNamed:bean.img];
        UILabel *l6 = [[UILabel alloc] initWithFrame:CGRectMake(1, 40, width-2, 20)];
        l6.font=[UIFont systemFontOfSize:16];
        l6.textColor=[UIColor blackColor];
        l6.textAlignment=NSTextAlignmentCenter;
        l6.text=bean.name;
        [b6 addSubview:i6];
        [b6 addSubview:l6];
        b6.tag=(i+1);
        UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
        tap6.cancelsTouchesInView=NO;
        tap6.delegate = self;
        [b6 addGestureRecognizer:tap6];
        [scroll addSubview:b6];
    }
    
    NSInteger line = 0;
    if(size%4==0){
        line=size/4;
    }else{
        line=size/4+1;
    }
    scroll.contentSize = CGSizeMake(self.view.frame.size.width, 60*line+10);
    [self.view addSubview:topView];
    [self.view addSubview:resultView];
    [self.view addSubview:scroll];
    [HUD hide:YES];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
-(void)handler :(UITapGestureRecognizer *)sender{
    NSLog(@"tag=%ld",sender.view.tag);
    if(sender.view.tag>0){
        NSInteger index = sender.view.tag-1;
        FoodBean *bean = [foodList objectAtIndex:index];
        [self addToCook:bean];
    }else{
        if(sender.view.tag==-1){
            if(f1){
                m1.image=nil;
                f1=nil;
                [self clearCook];
            }
        }else if(sender.view.tag==-2){
            if(f2){
                m2.image=nil;
                f2=nil;
                [self clearCook];
            }
        }else if(sender.view.tag==-3){
            if(f3){
                m3.image=nil;
                f3=nil;
                [self clearCook];
            }
        }else if(sender.view.tag==-4){
            if(f4){
                m4.image=nil;
                f4=nil;
                [self clearCook];
            }
        }
    }
}

-(void)clearCook{
    [cookFoods removeAllObjects];
    [self reMakeView];
}

-(void)addToCook:(FoodBean *)foodbean{
    if(f1&&f2&&f3&&f4){
        
        return;
    }else{
        
        if(!f1){
            f1=foodbean;
            m1.image=[UIImage imageNamed:f1.img];
        }else if(!f2){
            f2=foodbean;
            m2.image=[UIImage imageNamed:f2.img];
        }else if(!f3){
            f3=foodbean;
            m3.image=[UIImage imageNamed:f3.img];
        }else if(!f4){
            f4=foodbean;
            m4.image=[UIImage imageNamed:f4.img];
        }
        if(f1&&f2&&f3&&f4){
            [self cook];
        }
    }
}

-(void)cook{
    if(!f1||!f2||!f3||!f4){
        return;
    }
    [cookFoods removeAllObjects];
    
    BOOL hasEgg=NO,hasMeat=NO,hasVeggie=NO,hasFruit=NO,hasTree=NO,hasButterfly=NO,hasDragon=NO,hasFish=NO,hasCorn=NO
    ,hasHoney=NO,hasCactusflower=NO,hasFrogLeg=NO,hasMole=NO,hasCactus=NO,hasDairy=NO,hasIce=NO,hasMonster=NO,hasMandrake=NO
    ,hasPumpkin=NO,hasEggplant=NO,hasSeed=NO,hasBirchnutCooked=NO,hasBerries=NO,hasDrumstick=NO,hasCutlichen=NO,hasEel=NO
    ,hasButter=NO,hasWatermelon=NO;
    CGFloat egg=0,meat=0,veggie=0,fruit=0,tree=0,fish=0,honey=0,monster=0,seed=0,drumstick=0;
    if(f1.isMeat){
        hasMeat=YES;
        meat+=f1.value;
    }
    if(f1.isEgg){
        hasEgg=YES;
        egg+=f1.value;
    }
    if(f1.isVeggie){
        hasVeggie=YES;
        veggie+=f1.value;
    }
    if(f1.isFruit){
        hasFruit=YES;
        fruit+=f1.value;
    }
    if(f1.isTree){
        hasTree=YES;
        tree+=f1.value;
    }
    if(f1.isFish){
        hasFish=YES;
        fish+=f1.fish;
    }
    if([f1.img isEqualToString:@"butterfly_wings"]){
        hasButterfly=YES;
    }
    if([f1.img isEqualToString:@"dragonfruit"]||[f1.img isEqualToString:@"dragonfruit_cooked"]){
        hasDragon=YES;
    }
    if([f1.img isEqualToString:@"corn"]||[f1.img isEqualToString:@"corn_cooked"]){
        hasCorn=YES;
    }
    if([f1.img isEqualToString:@"cactus_flower"]){
        hasCactusflower=YES;
    }
    if(f1.isHoney){
        hasHoney=YES;
        honey+=f1.value;
    }
    if([f1.img isEqualToString:@"frog_legs"]||[f1.img isEqualToString:@"frog_legs_cooked"]){
        hasFrogLeg=YES;
    }
    if([f1.img isEqualToString:@"mole"]){
        hasMole=YES;
    }
    if([f1.img isEqualToString:@"cactus_meat"]){
        hasCactus=YES;
    }
    if(f1.isDairy){
        hasDairy=YES;
    }
    if(f1.isIce){
        hasIce=YES;
    }
    if(f1.isMonster){
        hasMonster=YES;
        monster+=f1.monster;
    }
    if([f1.img isEqualToString:@"mandrake"]){
        hasMandrake=YES;
    }
    if([f1.img isEqualToString:@"pumpkin"]||[f1.img isEqualToString:@"pumpkin_cooked"]){
        hasPumpkin=YES;
    }
    if([f1.img isEqualToString:@"eggplant"]||[f1.img isEqualToString:@"eggplant_cooked"]){
        hasEggplant=YES;
    }
    if(f1.isSeed){
        hasSeed=YES;
        seed+=f1.value;
    }
    if([f1.img isEqualToString:@"birchnut_cooked"]){
        hasBirchnutCooked=YES;
    }
    if([f1.img isEqualToString:@"berries"]||[f1.img isEqualToString:@"berries_cooked"]){
        hasBerries=YES;
    }
    if([f1.img isEqualToString:@"drumstick"]){
        hasDrumstick=YES;
        drumstick+=1;
    }
    if([f1.img isEqualToString:@"eel"]||[f1.img isEqualToString:@"eel_cooked"]){
        hasEel=YES;
    }
    if([f1.img isEqualToString:@"cutlichen"]){
        hasCutlichen=YES;
    }
    if([f1.img isEqualToString:@"butter"]){
        hasButter=YES;
    }
    if([f1.img isEqualToString:@"watermelon"]){
        hasWatermelon=YES;
    }
    
    if(f2.isMeat){
        hasMeat=YES;
        meat+=f2.value;
    }
    if(f2.isEgg){
        hasEgg=YES;
        egg+=f2.value;
    }
    if(f2.isVeggie){
        hasVeggie=YES;
        veggie+=f2.value;
    }
    if(f2.isFruit){
        hasFruit=YES;
        fruit+=f2.value;
    }
    if(f2.isTree){
        hasTree=YES;
        tree+=f2.value;
    }
    if([f2.img isEqualToString:@"butterfly_wings"]){
        hasButterfly=YES;
    }
    if([f2.img isEqualToString:@"dragonfruit"]||[f2.img isEqualToString:@"dragonfruit_cooked"]){
        hasDragon=YES;
    }
    if(f2.isFish){
        hasFish=YES;
        fish+=f2.fish;
    }
    if([f2.img isEqualToString:@"corn"]||[f2.img isEqualToString:@"corn_cooked"]){
        hasCorn=YES;
    }
    if([f2.img isEqualToString:@"cactus_flower"]){
        hasCactusflower=YES;
    }
    if(f2.isHoney){
        hasHoney=YES;
        honey+=f2.value;
    }
    if([f2.img isEqualToString:@"frog_legs"]||[f2.img isEqualToString:@"frog_legs_cooked"]){
        hasFrogLeg=YES;
    }
    if([f2.img isEqualToString:@"mole"]){
        hasMole=YES;
    }
    if([f2.img isEqualToString:@"cactus_meat"]){
        hasCactus=YES;
    }
    if(f2.isDairy){
        hasDairy=YES;
    }
    if(f2.isIce){
        hasIce=YES;
    }
    if(f2.isMonster){
        hasMonster=YES;
        monster+=f2.monster;
    }
    if([f2.img isEqualToString:@"mandrake"]){
        hasMandrake=YES;
    }
    if([f2.img isEqualToString:@"pumpkin"]||[f2.img isEqualToString:@"pumpkin_cooked"]){
        hasPumpkin=YES;
    }
    if([f2.img isEqualToString:@"eggplant"]||[f2.img isEqualToString:@"eggplant_cooked"]){
        hasEggplant=YES;
    }
    if(f2.isSeed){
        hasSeed=YES;
        seed+=f2.value;
    }
    if([f2.img isEqualToString:@"birchnut_cooked"]){
        hasBirchnutCooked=YES;
    }
    if([f2.img isEqualToString:@"berries"]||[f2.img isEqualToString:@"berries_cooked"]){
        hasBerries=YES;
    }
    if([f2.img isEqualToString:@"drumstick"]){
        hasDrumstick=YES;
        drumstick+=1;
    }
    if([f2.img isEqualToString:@"eel"]||[f2.img isEqualToString:@"eel_cooked"]){
        hasEel=YES;
    }
    if([f2.img isEqualToString:@"cutlichen"]){
        hasCutlichen=YES;
    }
    if([f2.img isEqualToString:@"butter"]){
        hasButter=YES;
    }
    if([f2.img isEqualToString:@"watermelon"]){
        hasWatermelon=YES;
    }
    
    if(f3.isMeat){
        hasMeat=YES;
        meat+=f3.value;
    }
    if(f3.isEgg){
        hasEgg=YES;
        egg+=f3.value;
    }
    if(f3.isVeggie){
        hasVeggie=YES;
        veggie+=f3.value;
    }
    if(f3.isFruit){
        hasFruit=YES;
        fruit+=f3.value;
    }
    if(f3.isTree){
        hasTree=YES;
        tree+=f3.value;
    }
    if([f3.img isEqualToString:@"butterfly_wings"]){
        hasButterfly=YES;
    }
    if([f3.img isEqualToString:@"dragonfruit"]||[f3.img isEqualToString:@"dragonfruit_cooked"]){
        hasDragon=YES;
    }
    if(f3.isFish){
        hasFish=YES;
        fish+=f3.fish;
    }
    if([f3.img isEqualToString:@"corn"]||[f3.img isEqualToString:@"corn_cooked"]){
        hasCorn=YES;
    }
    if([f3.img isEqualToString:@"cactus_flower"]){
        hasCactusflower=YES;
    }
    if(f3.isHoney){
        hasHoney=YES;
        honey+=f3.value;
    }
    if([f3.img isEqualToString:@"frog_legs"]||[f3.img isEqualToString:@"frog_legs_cooked"]){
        hasFrogLeg=YES;
    }
    if([f3.img isEqualToString:@"mole"]){
        hasMole=YES;
    }
    if([f3.img isEqualToString:@"cactus_meat"]){
        hasCactus=YES;
    }
    if(f3.isDairy){
        hasDairy=YES;
    }
    if(f3.isIce){
        hasIce=YES;
    }
    if(f3.isMonster){
        hasMonster=YES;
        monster+=f3.monster;
    }
    if([f3.img isEqualToString:@"mandrake"]){
        hasMandrake=YES;
    }
    if([f3.img isEqualToString:@"pumpkin"]||[f3.img isEqualToString:@"pumpkin_cooked"]){
        hasPumpkin=YES;
    }
    if([f3.img isEqualToString:@"eggplant"]||[f3.img isEqualToString:@"eggplant_cooked"]){
        hasEggplant=YES;
    }
    if(f3.isSeed){
        hasSeed=YES;
        seed+=f3.value;
    }
    if([f3.img isEqualToString:@"birchnut_cooked"]){
        hasBirchnutCooked=YES;
    }
    if([f3.img isEqualToString:@"berries"]||[f3.img isEqualToString:@"berries_cooked"]){
        hasBerries=YES;
    }
    if([f3.img isEqualToString:@"drumstick"]){
        hasDrumstick=YES;
        drumstick+=1;
    }
    if([f3.img isEqualToString:@"eel"]||[f3.img isEqualToString:@"eel_cooked"]){
        hasEel=YES;
    }
    if([f3.img isEqualToString:@"cutlichen"]){
        hasCutlichen=YES;
    }
    if([f3.img isEqualToString:@"butter"]){
        hasButter=YES;
    }
    if([f3.img isEqualToString:@"watermelon"]){
        hasWatermelon=YES;
    }
    
    if(f4.isMeat){
        hasMeat=YES;
        meat+=f4.value;
    }
    if(f4.isEgg){
        hasEgg=YES;
        egg+=f4.value;
    }
    if(f4.isVeggie){
        hasVeggie=YES;
        veggie+=f4.value;
    }
    if(f4.isFruit){
        hasFruit=YES;
        fruit+=f4.value;
    }
    if(f4.isTree){
        hasTree=YES;
        tree+=f4.value;
    }
    if([f4.img isEqualToString:@"butterfly_wings"]){
        hasButterfly=YES;
    }
    if([f4.img isEqualToString:@"dragonfruit"]||[f4.img isEqualToString:@"dragonfruit_cooked"]){
        hasDragon=YES;
    }
    if(f4.isFish){
        hasFish=YES;
        fish+=f4.fish;
    }
    if([f4.img isEqualToString:@"corn"]||[f4.img isEqualToString:@"corn_cooked"]){
        hasCorn=YES;
    }
    if([f4.img isEqualToString:@"cactus_flower"]){
        hasCactusflower=YES;
    }
    if(f4.isHoney){
        hasHoney=YES;
        honey+=f4.value;
    }
    if([f4.img isEqualToString:@"frog_legs"]||[f4.img isEqualToString:@"frog_legs_cooked"]){
        hasFrogLeg=YES;
    }
    if([f4.img isEqualToString:@"mole"]){
        hasMole=YES;
    }
    if([f4.img isEqualToString:@"cactus_meat"]){
        hasCactus=YES;
    }
    if(f4.isDairy){
        hasDairy=YES;
    }
    if(f4.isIce){
        hasIce=YES;
    }
    if(f4.isMonster){
        hasMonster=YES;
        monster+=f4.monster;
    }
    if([f4.img isEqualToString:@"mandrake"]){
        hasMandrake=YES;
    }
    if([f4.img isEqualToString:@"pumpkin"]||[f4.img isEqualToString:@"pumpkin_cooked"]){
        hasPumpkin=YES;
    }
    if([f4.img isEqualToString:@"eggplant"]||[f4.img isEqualToString:@"eggplant_cooked"]){
        hasEggplant=YES;
    }
    if(f4.isSeed){
        hasSeed=YES;
        seed+=f4.value;
    }
    if([f4.img isEqualToString:@"birchnut_cooked"]){
        hasBirchnutCooked=YES;
    }
    if([f4.img isEqualToString:@"berries"]||[f4.img isEqualToString:@"berries_cooked"]){
        hasBerries=YES;
    }
    if([f4.img isEqualToString:@"drumstick"]){
        hasDrumstick=YES;
        drumstick+=1;
    }
    if([f4.img isEqualToString:@"eel"]||[f4.img isEqualToString:@"eel_cooked"]){
        hasEel=YES;
    }
    if([f4.img isEqualToString:@"cutlichen"]){
        hasCutlichen=YES;
    }
    if([f4.img isEqualToString:@"butter"]){
        hasButter=YES;
    }
    if([f4.img isEqualToString:@"watermelon"]){
        hasWatermelon=YES;
    }
    
    if(hasEgg&&egg>1&&hasMeat&&meat>1&&!hasVeggie){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"培根煎蛋";
        baconeggs.eName=@"Bacon and Eggs";
        baconeggs.img=@"baconeggs";
        baconeggs.health=20;
        baconeggs.hunger=75;
        baconeggs.sanity=5;
        baconeggs.perish=20;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasMeat&&meat>=3&&!hasTree){
        CookFoodBean *bonestew = [[CookFoodBean alloc] init];
        bonestew.name=@"肉汤";
        bonestew.eName=@"Meaty Stew";
        bonestew.img=@"bonestew";
        bonestew.health=12;
        bonestew.hunger=150;
        bonestew.sanity=5;
        bonestew.perish=10;
        bonestew.priority=0;
        [cookFoods addObject:bonestew];
    }
    if(hasButterfly&&!hasMeat&&hasVeggie){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"奶油松饼";
        baconeggs.eName=@"Butter Muffin";
        baconeggs.img=@"butterflymuffin";
        baconeggs.health=20;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=1;
        [cookFoods addObject:baconeggs];
    }
    if(!hasMeat&&hasDragon){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"火龙果派";
        baconeggs.eName=@"Dragonpie";
        baconeggs.img=@"dragonpie";
        baconeggs.health=40;
        baconeggs.hunger=75;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=1;
        [cookFoods addObject:baconeggs];
    }
    if(hasFish&&hasTree&&tree<=1){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"鱼排";
        baconeggs.eName=@"Fishsticks";
        baconeggs.img=@"fishsticks";
        baconeggs.health=40;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=10;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasFish&&hasCorn){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"炸鱼玉米饼";
        baconeggs.eName=@"Fish Tacos";
        baconeggs.img=@"fishtacos";
        baconeggs.health=20;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=6;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasCactusflower&&hasVeggie&&veggie>=2&&!hasMeat&&!hasTree&&!hasEgg&&!hasFruit&&!hasHoney){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@" 花瓣沙拉";
        baconeggs.eName=@"Flower Salad";
        baconeggs.img=@"flowersalad";
        baconeggs.health=40;
        baconeggs.hunger=13;
        baconeggs.sanity=5;
        baconeggs.perish=6;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasFrogLeg&&hasVeggie){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"蛙腿三明治";
        baconeggs.eName=@"Froggle Bunwich";
        baconeggs.img=@"frogglebunwich";
        baconeggs.health=20;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=1;
        [cookFoods addObject:baconeggs];
    }
    if(hasFruit&&fruit>=3&&!hasMeat&&!hasVeggie){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"水果拼盘";
        baconeggs.eName=@"Fruit Medley";
        baconeggs.img=@"fruitmedley";
        baconeggs.health=20;
        baconeggs.hunger=25;
        baconeggs.sanity=5;
        baconeggs.perish=6;
        baconeggs.priority=0;
        [cookFoods addObject:baconeggs];
    }
    if(hasMole&&hasCactus&&!hasFruit){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"酪梨酱";
        baconeggs.eName=@"Guacamole";
        baconeggs.img=@"guacamole";
        baconeggs.health=20;
        baconeggs.hunger=38;
        baconeggs.sanity=0;
        baconeggs.perish=10;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasHoney&&hasMeat&&meat>1.5&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"蜂蜜火腿";
        baconeggs.eName=@"Honey Ham";
        baconeggs.img=@"honeyham";
        baconeggs.health=30;
        baconeggs.hunger=75;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=2;
        [cookFoods addObject:baconeggs];
    }
    if(hasHoney&&hasMeat&&meat<=1.5&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"蜂蜜肉块";
        baconeggs.eName=@"Honey Nuggets";
        baconeggs.img=@"honeynuggets";
        baconeggs.health=30;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=2;
        [cookFoods addObject:baconeggs];
    }
    if(hasMeat&&meat>=1.5&&hasVeggie&&veggie>=1.5){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"辣椒炖肉";
        baconeggs.eName=@"Spicy Chili";
        baconeggs.img=@"hotchili";
        baconeggs.health=20;
        baconeggs.hunger=38;
        baconeggs.sanity=0;
        baconeggs.perish=10;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasDairy&&hasIce&&hasHoney&&!hasMeat&&!hasVeggie&&!hasTree&&!hasEgg){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"冰淇淋";
        baconeggs.eName=@"Ice Cream";
        baconeggs.img=@"icecream";
        baconeggs.health=0;
        baconeggs.hunger=25;
        baconeggs.sanity=50;
        baconeggs.perish=3;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasFruit&&!hasMeat&&!hasVeggie&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"果酱";
        baconeggs.eName=@"Fist Full of Jam";
        baconeggs.img=@"jammypreserves";
        baconeggs.health=3;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=0;
        [cookFoods addObject:baconeggs];
    }
    if(hasMeat&&hasTree&&tree<=1&&(!hasMonster||monster<=1)){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"烤肉串";
        baconeggs.eName=@"Kabobs";
        baconeggs.img=@"kabobs";
        baconeggs.health=3;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=5;
        [cookFoods addObject:baconeggs];
    }
    if(hasMandrake){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"曼德拉草汤";
        baconeggs.eName=@"Mandrake Soup";
        baconeggs.img=@"mandrakesoup";
        baconeggs.health=100;
        baconeggs.hunger=150;
        baconeggs.sanity=5;
        baconeggs.perish=6;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasMeat&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"肉丸";
        baconeggs.eName=@"Meatballs";
        baconeggs.img=@"meatballs";
        baconeggs.health=3;
        baconeggs.hunger=63;
        baconeggs.sanity=5;
        baconeggs.perish=10;
        baconeggs.priority=-1;
        [cookFoods addObject:baconeggs];
    }
    if(hasMonster&&monster>=2&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"怪物千层派";
        baconeggs.eName=@"Monster Lasagna";
        baconeggs.img=@"monsterlasagna";
        baconeggs.health=-20;
        baconeggs.hunger=38;
        baconeggs.sanity=-20;
        baconeggs.perish=6;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasEgg&&hasMeat&&hasVeggie&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"波兰饺子";
        baconeggs.eName=@"Pierogi";
        baconeggs.img=@"perogies";
        baconeggs.health=40;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=20;
        baconeggs.priority=5;
        [cookFoods addObject:baconeggs];
    }
    if(hasCorn&&hasTree&&hasHoney){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"粉末蛋糕";
        baconeggs.eName=@"Powdercake";
        baconeggs.img=@"powcake";
        baconeggs.health=-3;
        baconeggs.hunger=0;
        baconeggs.sanity=0;
        baconeggs.perish=18750;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasPumpkin&&hasHoney&&honey>=2){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"南瓜饼干";
        baconeggs.eName=@"Pumpkin Cookie";
        baconeggs.img=@"pumpkincookie";
        baconeggs.health=0;
        baconeggs.hunger=38;
        baconeggs.sanity=15;
        baconeggs.perish=10;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasVeggie&&!hasMeat&&!hasTree){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"蔬菜杂烩";
        baconeggs.eName=@"Ratatouille";
        baconeggs.img=@"ratatouille";
        baconeggs.health=3;
        baconeggs.hunger=25;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=0;
        [cookFoods addObject:baconeggs];
    }
    
    if(hasEggplant&&hasVeggie&&veggie>1){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"酿茄子";
        baconeggs.eName=@"Stuffed Eggplant";
        baconeggs.img=@"stuffedeggplant";
        baconeggs.health=3;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=1;
        [cookFoods addObject:baconeggs];
    }
    if(hasHoney&&honey>=3&&!hasMeat){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"太妃糖";
        baconeggs.eName=@"Taffy";
        baconeggs.img=@"taffy";
        baconeggs.health=-3;
        baconeggs.hunger=25;
        baconeggs.sanity=15;
        baconeggs.perish=15;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasSeed&&hasBirchnutCooked&&seed>=1&&hasBerries&&hasFruit&&fruit>=1&&!hasMeat&&!hasVeggie&&!hasEgg&&!hasDairy){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"综合坚果";
        baconeggs.eName=@"Trail Mix";
        baconeggs.img=@"trailmix";
        baconeggs.health=30;
        baconeggs.hunger=13;
        baconeggs.sanity=5;
        baconeggs.perish=15;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasDrumstick&&drumstick>1&&hasMeat&&meat>1&&(hasVeggie||hasFruit)){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"火鸡大餐";
        baconeggs.eName=@"Turkey Dinner";
        baconeggs.img=@"turkeydinner";
        baconeggs.health=20;
        baconeggs.hunger=75;
        baconeggs.sanity=5;
        baconeggs.perish=6;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasCutlichen&&hasEel){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"鳗鱼寿司";
        baconeggs.eName=@"Unagi";
        baconeggs.img=@"unagi";
        baconeggs.health=20;
        baconeggs.hunger=19;
        baconeggs.sanity=5;
        baconeggs.perish=10;
        baconeggs.priority=20;
        [cookFoods addObject:baconeggs];
    }
    if(hasButter&&hasBerries&&hasEgg){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"松饼";
        baconeggs.eName=@"Waffles";
        baconeggs.img=@"waffles";
        baconeggs.health=60;
        baconeggs.hunger=38;
        baconeggs.sanity=5;
        baconeggs.perish=6;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if(hasWatermelon&&hasIce&&hasTree&&!hasVeggie&&!hasMeat&&!hasEgg){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"西瓜冰";
        baconeggs.eName=@"Melonsicle";
        baconeggs.img=@"watermelonicle";
        baconeggs.health=3;
        baconeggs.hunger=13;
        baconeggs.sanity=20;
        baconeggs.perish=3;
        baconeggs.priority=10;
        [cookFoods addObject:baconeggs];
    }
    if([cookFoods count]==0){
        CookFoodBean *baconeggs = [[CookFoodBean alloc] init];
        baconeggs.name=@"失败料理";
        baconeggs.eName=@"Wet Goop";
        baconeggs.img=@"wetgoop";
        baconeggs.health=0;
        baconeggs.hunger=0;
        baconeggs.sanity=0;
        baconeggs.perish=6;
        baconeggs.priority=-2;
        [cookFoods addObject:baconeggs];
    }
    
    [self reMakeView];
}
-(void)reMakeView{
    if([cookFoods count]==0){
        [resultView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        scroll.frame = CGRectMake(0, 126, self.view.frame.size.width, self.view.frame.size.height-126);
    }else{
        
        CGFloat avgWidth = (self.view.frame.size.width-width)/4.0f;
        if([cookFoods count]>1){
            [cookFoods sortUsingComparator:^NSComparisonResult(CookFoodBean *obj1,CookFoodBean *obj2){
                return obj1.priority<obj2.priority;
            }];
            CookFoodBean *cook1=[cookFoods objectAtIndex:0];
            CookFoodBean *cook2=[cookFoods objectAtIndex:1];
            [cookFoods removeAllObjects];
            if(cook1.priority>cook2.priority){
                [cookFoods addObject:cook1];
            }else if(cook1.priority==cook2.priority){
                [cookFoods addObject:cook1];
                [cookFoods addObject:cook2];
            }
        }
        CGFloat offset=[cookFoods count]*60,y=0;
        resultView.frame=CGRectMake(0, 126, self.view.frame.size.width, offset);
        scroll.frame = CGRectMake(0, 126+offset, self.view.frame.size.width, self.view.frame.size.height-126-offset);
        
        for(int i=0;i<[cookFoods count];i++){
            CookFoodBean *cook = [cookFoods objectAtIndex:i];
            y=i*60;
            UIView *b6 = [[UIView alloc] initWithFrame:CGRectMake(0, y, width, 60)];
            UIImageView *i6 = [[UIImageView alloc] initWithFrame:CGRectMake( (width-35)/2, 5, 35, 35)];
            i6.image = [UIImage imageNamed:cook.img];
            UILabel *l6 = [[UILabel alloc] initWithFrame:CGRectMake(1, 40, width-2, 20)];
            l6.font=[UIFont systemFontOfSize:16];
            l6.textColor=[UIColor blackColor];
            l6.textAlignment=NSTextAlignmentCenter;
            l6.text=cook.name;
            [b6 addSubview:i6];
            [b6 addSubview:l6];
            
            UILabel *l0 = [[UILabel alloc] initWithFrame:CGRectMake(width, 5, avgWidth, 20)];
            l0.font=[UIFont systemFontOfSize:16];
            l0.textColor=[UIColor blackColor];
            l0.textAlignment=NSTextAlignmentCenter;
            l0.text=@"饱食度";
            
            UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(width, 30, avgWidth, 20)];
            l1.font=[UIFont systemFontOfSize:16];
            l1.textColor=[UIColor blackColor];
            l1.textAlignment=NSTextAlignmentCenter;
            if(cook.hunger>0){
                l1.text=[NSString stringWithFormat:@"+%0.1f",cook.hunger];
            }else if(cook.hunger==0){
                l1.text=[NSString stringWithFormat:@"%0.1f",cook.hunger];
            }else if(cook.hunger<0){
                l1.text=[NSString stringWithFormat:@"%0.1f",cook.hunger];
                l1.textColor=[UIColor redColor];
            }
            [b6 addSubview:l0];
            [b6 addSubview:l1];
            
            UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectMake(width+avgWidth, 5, avgWidth, 20)];
            l3.font=[UIFont systemFontOfSize:16];
            l3.textColor=[UIColor blackColor];
            l3.textAlignment=NSTextAlignmentCenter;
            l3.text=@"精神值";
            
            UILabel *l4 = [[UILabel alloc] initWithFrame:CGRectMake(width+avgWidth, 30, avgWidth, 20)];
            l4.font=[UIFont systemFontOfSize:16];
            l4.textColor=[UIColor blackColor];
            l4.textAlignment=NSTextAlignmentCenter;
            if(cook.sanity>0){
                l4.text=[NSString stringWithFormat:@"+%0.0f",cook.sanity];
            }else if(cook.sanity==0){
                l4.text=[NSString stringWithFormat:@"%0.0f",cook.sanity];
            }else if(cook.sanity<0){
                l4.text=[NSString stringWithFormat:@"%0.0f",cook.sanity];
                l4.textColor=[UIColor redColor];
            }
            [b6 addSubview:l3];
            [b6 addSubview:l4];
            
            UILabel *l5 = [[UILabel alloc] initWithFrame:CGRectMake(width+avgWidth*2, 5, avgWidth, 20)];
            l5.font=[UIFont systemFontOfSize:16];
            l5.textColor=[UIColor blackColor];
            l5.textAlignment=NSTextAlignmentCenter;
            l5.text=@"生命值";
            
            UILabel *l7 = [[UILabel alloc] initWithFrame:CGRectMake(width+avgWidth*2, 30, avgWidth, 20)];
            l7.font=[UIFont systemFontOfSize:16];
            l7.textColor=[UIColor blackColor];
            l7.textAlignment=NSTextAlignmentCenter;
            if(cook.health>0){
                l7.text=[NSString stringWithFormat:@"+%0.0f",cook.health];
            }else if(cook.health==0){
                l7.text=[NSString stringWithFormat:@"%0.0f",cook.health];
            }else if(cook.health<0){
                l7.text=[NSString stringWithFormat:@"%0.0f",cook.health];
                l7.textColor=[UIColor redColor];
            }

            [b6 addSubview:l5];
            [b6 addSubview:l7];
            
            UILabel *l8 = [[UILabel alloc] initWithFrame:CGRectMake(width+avgWidth*3, 5, avgWidth, 20)];
            l8.font=[UIFont systemFontOfSize:16];
            l8.textColor=[UIColor blackColor];
            l8.textAlignment=NSTextAlignmentCenter;
            l8.text=@"保质期";
            
            UILabel *l9 = [[UILabel alloc] initWithFrame:CGRectMake(width+avgWidth*3, 30, avgWidth, 20)];
            l9.font=[UIFont systemFontOfSize:16];
            l9.textColor=[UIColor blackColor];
            l9.textAlignment=NSTextAlignmentCenter;
            l9.text=[NSString stringWithFormat:@"%0.0f天",cook.perish];
            [b6 addSubview:l8];
            [b6 addSubview:l9];

            [resultView addSubview:b6];
        }
    }
}


@end
