//
//  FoodBean.h
//  FoodSimulator
//
//  Created by Shuwei on 15/11/30.
//  Copyright © 2015年 jov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FoodBean : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *eName;
@property (nonatomic,assign) CGFloat health;
@property (nonatomic,assign) CGFloat hunger;
@property (nonatomic,assign) CGFloat sanity;
@property (nonatomic,assign) CGFloat perish;
@property (nonatomic,assign) BOOL isFruit;
@property (nonatomic,assign) BOOL isVeggie;
@property (nonatomic,assign) BOOL isMeat;
@property (nonatomic,assign) BOOL isIce;
@property (nonatomic,assign) BOOL isTree;
@property (nonatomic,assign) BOOL isSeed;
@property (nonatomic,assign) BOOL isCooked;
@property (nonatomic,assign) BOOL isEgg;
@property (nonatomic,assign) BOOL isDairy;
@property (nonatomic,assign) BOOL isMonster;
@property (nonatomic,assign) BOOL isFish;
@property (nonatomic,assign) BOOL isHoney;
@property (nonatomic,assign) BOOL isMagic;
@property (nonatomic,assign) BOOL isDried;
@property (nonatomic,assign) CGFloat value;
@property (nonatomic,assign) CGFloat monster;
@property (nonatomic,assign) CGFloat fish;
@property (nonatomic,assign) CGFloat magic;
@property (nonatomic,copy) NSString *img;

-(NSMutableArray *)getFood;
@end
