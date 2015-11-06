//
//  ShareData.h
//  Isaac
//
//  Created by Shuwei on 15/7/23.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataBean.h"
@interface ShareData : NSObject

@property(atomic,retain) DataBean *bean;
@property(atomic,retain) NSString *type;
@property(atomic,retain) NSString *urltype;
@property(atomic,retain) NSString *title;
+(ShareData *) shareInstance;
@end
