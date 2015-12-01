//
//  CookFoodBean.h
//  FoodSimulator
//
//  Created by Shuwei on 15/11/30.
//  Copyright © 2015年 jov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FoodBean.h"

@interface CookFoodBean : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *eName;
@property (nonatomic,assign) NSInteger priority;
@property (nonatomic,assign) CGFloat health;
@property (nonatomic,assign) CGFloat hunger;
@property (nonatomic,assign) CGFloat sanity;
@property (nonatomic,assign) CGFloat perish;
@property (nonatomic,copy) NSString *img;
-(BOOL)test:(NSMutableArray *)cooker;

@end
