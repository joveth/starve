//
//  Common.m
//  Isaac
//
//  Created by Shuwei on 15/7/3.
//  Copyright (c) 2015年 Shuwei. All rights reserved.
//

#import "Common.h"

@implementation Common

+(BOOL) isEmptyString:(NSString *)string{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+(void)showMessage:(NSString*) message seconds:(int)seconds {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:nil, nil];
    [view show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view dismissWithClickedButtonIndex:0 animated:YES];
    });
}
+(void)showMessageWithOkButton:(NSString*) message {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"确定", nil];
    [view show];
}
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:id
                                         cancelButtonTitle:@"取消"
                                         otherButtonTitles:@"确定", nil];
    view.tag=tag;
    [view show];
    
}
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id andCancelMsg:(NSString *)cancelMsg andOkMsg:(NSString *)okMsg{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:id
                                         cancelButtonTitle:cancelMsg
                                         otherButtonTitles:okMsg, nil];
    view.tag=tag;
    [view show];
}
+(void)showMessageWithOkButton:(NSString*) message andDelegate:id{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:id
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"确定", nil];
    view.tag=12;
    [view show];
}
+(CGFloat)clcLine:(CGFloat)width{
    if(width<1){
        width=1;
    }else{
        NSString *th = [NSString stringWithFormat:@"%0.0f",width];
        NSInteger t = th.integerValue;
        if(width-t>0){
            width  = t+1;
        }else{
            width = t;
        }
    }
    return width;
}
@end
