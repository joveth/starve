//
//  ShowSearchController.m
//  IsaacNew
//
//  Created by Shuwei on 15/9/14.
//  Copyright (c) 2015年 jov. All rights reserved.
//

#import "ShowSearchController.h"
#import "ShareData.h"
#import "Common.h"

@interface ShowSearchController ()

@end

@implementation ShowSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    DataBean *bean =[ShareData shareInstance].bean;
    self.title = bean.name;
    UIImage *temp = [UIImage imageNamed:bean.image];
    CGFloat width = temp.size.width;
    if(temp.size.width<temp.size.height){
        width = temp.size.height;
    }
    CGFloat yp = self.view.center.x-width/2-10;
    UIImageView *bossImageView = [[UIImageView alloc] initWithFrame:CGRectMake(yp, 80, width+20, width+20)];
    bossImageView.backgroundColor = [UIColor whiteColor];
    bossImageView.image = temp;
    [self.view setBackgroundColor:[Common colorWithHexString:@"e0e0e0"]];
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.frame = self.view.frame;
    scroll.backgroundColor = [Common colorWithHexString:@"e0e0e0"];
    [scroll addSubview:bossImageView];
    CGFloat screenWidth = [UIScreen mainScreen].applicationFrame.size.width;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16.0]};
    CGSize size = [bean.content sizeWithAttributes:attributes];
    CGFloat line = size.width/screenWidth;
    if(line<1){
        line=1;
    }else{
        NSString *th = [NSString stringWithFormat:@"%0.0f",line];
        NSInteger t = th.integerValue;
        if(line-t>0){
            line  = t+1;
        }else{
            line = t;
        }
    }
//    UILabel *enLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120+width, screenWidth, 30)];
//    enLabel.textAlignment = NSTextAlignmentCenter;
//    enLabel.text = [NSString stringWithFormat:@"英文名：%@",bean.enName];
//    enLabel.textColor = [UIColor blackColor];
//    enLabel.font = [UIFont systemFontOfSize:16.0];
//    [scroll addSubview:enLabel];
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160+width, screenWidth-20, line*size.height+40)];
    contentLabel.text = bean.content;
    [contentLabel setFont:[UIFont systemFontOfSize:16.0]];
    contentLabel.numberOfLines=0;
    contentLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    [scroll addSubview:contentLabel];
    scroll.contentSize = CGSizeMake(screenWidth, 250+width+line*size.height);
    [self.view addSubview:scroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
