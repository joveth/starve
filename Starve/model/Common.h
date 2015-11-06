//
//  Common.h
//  Isaac
//
//  Created by Shuwei on 15/7/3.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Common : NSObject

+(UIColor *) colorWithHexString: (NSString *) stringToConvert;
+(BOOL) isEmptyString:(NSString *)str;
+ (void)showMessageWithOkButton:(NSString*) message ;
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id ;
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id andCancelMsg:(NSString *)cancelMsg andOkMsg:(NSString *)okMsg;
+ (void)showMessageWithOkButton:(NSString*) message andDelegate:id;
+(void)showMessage:(NSString*) message seconds:(int)seconds ;
+(CGFloat)clcLine:(CGFloat)width;
@end
