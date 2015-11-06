//
//  DBHelper.m
//  Isaac
//
//  Created by Shuwei on 15/7/2.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import "DBHelper.h"
#import "FMDatabase.h"
#import "Common.h"


@interface DBHelper(){
    FMDatabase *db;
}
@end

static const NSString *TB_STARVE = @"tb_starve";
static const NSString *TB_BOSS = @"tb_isaac_boss";
static const NSString *TB_SMALL = @"tb_isaac_small";
static const NSString *TB_OTHER = @"tb_other";
static const NSString *TB_USER = @"tb_user";
static const NSString *TB_MODSEED = @"tb_modseed";
@implementation DBHelper
+(id)sharedInstance{
    static DBHelper *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedInstance = [[super alloc]init];
    });
    return sharedInstance;
}
-(BOOL)openDB{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *fileName = [path stringByAppendingPathComponent:@"starve.sqlite"];
    
    // 1.获得数据库对象
    db = [FMDatabase databaseWithPath:fileName];
    // 2.打开数据库
    if ([db open]) {
        NSLog(@"打开成功");
        // 2.1创建表
        NSString *sql = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name varchar(60),enname varchar(60),image varchar(40),position varchar(20),content varchar(1200),p1 varchar(20),p2 varchar(20),p3 varchar(20),p4 varchar(20),n1 varchar(20),n2 varchar(20),n3 varchar(20),n4 varchar(20),html varchar(20),type char(1),tag INTEGER )";
        BOOL success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_STARVE]];
        
//        sql = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, image varchar(20),name varchar(60),enname varchar(60) ,content varchar(1200),score varchar(5))";
//        
//        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_BOSS]];
//        
//        sql = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, image varchar(20),name varchar(60),enname varchar(60) ,content varchar(500))";
//        
//        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_SMALL]];
//        
//        sql = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, image varchar(20),name varchar(60),enname varchar(60) ,content varchar(1000),type char(1))";
//        
//        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_OTHER]];
//        
//        sql = @"CREATE TABLE IF NOT EXISTS %@ (Name varchar(100),Email varchar(100),Logo  varchar(100), CreateDate  varchar(100))";
//        
//        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_USER]];
//        
//        sql = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, image varchar(20),name varchar(60),content varchar(1000),link varchar(200),author varchar(60),oldlink varchar(200),type char(1))";
//        
//        success =  [db executeUpdate:[NSString stringWithFormat:sql,TB_MODSEED]];
        
        return success;
    }else{
        return NO;
    }
}
-(void)initData:(BOOLCallBack)success{
    NSArray *aArray = [@"store.db" componentsSeparatedByString:@"."];
    NSString *filename = [aArray objectAtIndex:0];
    NSString *sufix = [aArray objectAtIndex:1];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:sufix];
    NSString* myString = [NSString stringWithContentsOfFile:filePath usedEncoding:NULL error:NULL];
    NSArray *result = [myString componentsSeparatedByString:@"\n"];
    if(![db open]){
        if(success){
            success(NO);
        }
        return;
    }
    for(int i=0;i<[result count];i++){
        myString = [result objectAtIndex:i];
        if([Common isEmptyString:myString]){
            continue;
        }
        [db executeUpdate:myString];
    }
    [db close];
    if(success){
        success(YES);
    }
}
-(void)initModSeedData:(BOOLCallBack)success{
    NSArray *aArray = [@"other.db" componentsSeparatedByString:@"."];
    NSString *filename = [aArray objectAtIndex:0];
    NSString *sufix = [aArray objectAtIndex:1];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:sufix];
    NSString* myString = [NSString stringWithContentsOfFile:filePath usedEncoding:NULL error:NULL];
    NSArray *result = [myString componentsSeparatedByString:@"\n"];
    if(![db open]){
        if(success){
            success(NO);
        }
        return;
    }
    for(int i=0;i<[result count];i++){
        myString = [result objectAtIndex:i];
        if([Common isEmptyString:myString]){
            continue;
        }
        [db executeUpdate:myString];
    }
    [db close];
    if(success){
        success(YES);
    }
}
-(NSInteger)getCnt{
    if(![db open])
    {
        return 0;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select count(*) as total from %@ ",TB_STARVE]];
    NSString *temp =@"0";
    if ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        temp = dict[@"total"];
    }
    [rs close];
    [db close];
    return temp.integerValue;
}
-(NSInteger)getModSeedCnt{
    if(![db open]){
        return 0;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select count(*) as total from %@ ",TB_MODSEED]];
    NSString *temp =@"0";
    if ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        temp = dict[@"total"];
    }
    [rs close];
    [db close];
    return temp.integerValue;
}


-(NSMutableArray *)getIsaacs:(NSString *)offset{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@ ",TB_STARVE]];
    //IsaacBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        bean.power = dict[@"power"];
//        bean.unlock = dict[@"unlock"];
//        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getIsaacsByKey:(NSString *)keyword{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where enname like '%%%@%%' or  name like '%%%@%%'   ",TB_STARVE,keyword,keyword]];
    //IsaacBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        bean.type=@"0";
//        [ret addObject:bean];
    }
    
    rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where enname like '%%%@%%' or  name like '%%%@%%'  ",TB_BOSS,keyword,keyword]];
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }
    
    rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where enname like '%%%@%%' or  name like '%%%@%%'  ",TB_SMALL,keyword,keyword]];
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }
    
    rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where enname like '%%%@%%' or  name like '%%%@%%'  ",TB_OTHER,keyword,keyword]];
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }

    rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where  content like '%%%@%%' or power like '%%%@%%' or unlock like '%%%@%%' ",TB_STARVE,keyword,keyword,keyword]];
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }
    
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getStarveByType:(NSString *)type{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where type=? ",TB_STARVE],type];
    DataBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
        bean = [[DataBean alloc] init];
        bean.sid = dict[@"id"];
        bean.image = dict[@"image"];
        bean.name = dict[@"name"];
        bean.enName = dict[@"enname"];
        bean.content = dict[@"content"];
        bean.positon = dict[@"positon"];
        bean.p1 = dict[@"p1"];
        bean.p2 = dict[@"p2"];
        bean.p3 = dict[@"p3"];
        bean.p4 = dict[@"p4"];
        bean.n1 = dict[@"n1"];
        bean.n2 = dict[@"n2"];
        bean.n3 = dict[@"n3"];
        bean.n4 = dict[@"n4"];
        bean.html = dict[@"html"];
        bean.tag=dict[@"tag"];
        bean.type=dict[@"type"];
        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getModOrSeed:(NSString *)type{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where type=? ",TB_MODSEED],type];
    //ModSeedBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[ModSeedBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.content = dict[@"content"];
//        bean.link = dict[@"link"];
//        bean.author = dict[@"author"];
//        bean.oldlink = dict[@"oldlink"];
//        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getBoss:(NSString *)offset{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@ ",TB_BOSS]];
    //BossBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[BossBean alloc] init];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        bean.score = dict[@"score"];
//        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getSmall:(NSString *)offset{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@ ",TB_SMALL]];
    //BossBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[BossBean alloc] init];
//        bean.sid = dict[@"id"];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getOtherByType:(NSString *)type{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  where type=? ",TB_OTHER],type];
    //IsaacBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}
-(NSMutableArray *)getOther{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    if(![db open])
    {
        return ret;
    }
    FMResultSet *rs = [db executeQuery:[NSString stringWithFormat:@"select * from %@  ",TB_OTHER]];
    //IsaacBean *bean;
    while ([rs next]) {
        NSDictionary *dict = [rs resultDictionary];
//        bean = [[IsaacBean alloc] init];
//        bean.image = dict[@"image"];
//        bean.name = dict[@"name"];
//        bean.enName = dict[@"enname"];
//        bean.content = dict[@"content"];
//        [ret addObject:bean];
    }
    [rs close];
    [db close];
    return ret;
}

@end
