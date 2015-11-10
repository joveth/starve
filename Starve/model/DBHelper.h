//
//  DBHelper.h
//  Isaac
//
//  Created by Shuwei on 15/7/2.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "DataBean.h"
typedef void (^BOOLCallBack)(BOOL ret);

@interface DBHelper : NSObject
+(id)sharedInstance;
-(BOOL)openDB;
-(void)initData:(BOOLCallBack)success;
-(void)initModSeedData:(BOOLCallBack)success;
-(NSInteger)getCnt;
-(NSInteger)getModSeedCnt;
-(NSMutableArray *)getIsaacs:(NSString *)offset;
-(NSMutableArray *)getIsaacsByKey:(NSString *)keyword;
-(NSMutableArray *)getStarveByType:(NSString *)type;
-(NSMutableArray *)getStarves;
-(NSMutableArray *)getStarveByType:(NSString *)type andTag:(NSString *)tag;
-(NSMutableArray *)getStarveByType:(NSString *)type andKey:(NSString *)key;
-(NSMutableArray *)getBoss:(NSString *)offset;
-(NSMutableArray *)getSmall:(NSString *)offset;
-(NSMutableArray *)getOtherByType:(NSString *)type;
-(NSMutableArray *)getOther;

-(NSMutableArray *)getModOrSeed:(NSString *)type;
@end
