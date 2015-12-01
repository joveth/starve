//
//  Ver2Controller.m
//  IsaacNew
//
//  Created by Shuwei on 15/10/9.
//  Copyright © 2015年 jov. All rights reserved.
//

#import "Ver2Controller.h"


@interface Ver2Controller ()

@end

@implementation Ver2Controller{
    UIView *topView,*content,*other;
    CGFloat width,avgWidth,avgHeight;
    NSInteger tag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"饥荒攻略";
    width = self.view.frame.size.width;
    avgWidth = width/3;
    avgHeight = 90;
    CGFloat offset=64;
    self.view.backgroundColor=[Common colorWithHexString:@"e0e0e0"];
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, offset, width, 200)];
    topView.backgroundColor=[Common colorWithHexString:@"693471"];
    [self.view addSubview:topView];
    offset+=220;
    content = [[UIView alloc] initWithFrame:CGRectMake(0, offset, width, 110)];
    content.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:content];
    offset+=130;
    other= [[UIView alloc] initWithFrame:CGRectMake(0, offset, width, 44)];
    other.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:other];
    UILabel *copyright=[[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-20, self.view.frame.size.width, 20)];
    copyright.text=@"小v出品";
    copyright.textColor=[Common colorWithHexString:@"707070"];
    copyright.font=[UIFont systemFontOfSize:10.0];
    copyright.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:copyright];
    tag=1;
    UIView *b0 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, avgWidth, 90)];
    UIImageView *i0 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-55)/2, 10, 55, 55)];
    i0.image = [UIImage imageNamed:@"p_Wilson"];
//    i0.backgroundColor=[UIColor whiteColor];
//    i0.layer.cornerRadius=30;
//    i0.layer.masksToBounds=YES;
    UILabel *l0 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l0.font=[UIFont systemFontOfSize:16 weight:2];
    l0.textColor=[UIColor whiteColor];
    l0.textAlignment=NSTextAlignmentCenter;
    l0.text=@"人物";
    [b0 addSubview:i0];
    [b0 addSubview:l0];
    b0.tag=tag++;
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap0.cancelsTouchesInView=NO;
    tap0.delegate = self;
    [b0 addGestureRecognizer:tap0];
    [topView addSubview:b0];
    
    //原图片
    UIImage * img = [UIImage imageNamed:@"all.png"];
    //转化为位图
    CGImageRef temImg = img.CGImage;
    
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(1152, 512, 64, 64));
    //得到新的图片
    UIImage *pic0 = [UIImage imageWithCGImage:temImg];
    UIView *b1 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 10, avgWidth, 90)];
    UIImageView *i1 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-55)/2, 10, 55, 55)];
    i1.image = pic0;
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l1.font=[UIFont systemFontOfSize:18 weight:2];
    l1.textColor=[UIColor whiteColor];
    l1.textAlignment=NSTextAlignmentCenter;
    l1.text=@"生物";
    [b1 addSubview:i1];
    [b1 addSubview:l1];
    b1.tag=tag++;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap1.cancelsTouchesInView=NO;
    tap1.delegate = self;
    [b1 addGestureRecognizer:tap1];
    [topView addSubview:b1];
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(1536, 64, 64, 64));
    //得到新的图片
    UIImage *pic01 = [UIImage imageWithCGImage:temImg];
    UIView *b2 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 10, avgWidth, 90)];
    UIImageView *i2 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-55)/2, 10, 55, 55)];
    i2.image = pic01;
    UILabel *l2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l2.font=[UIFont systemFontOfSize:18 weight:2];
    l2.textColor=[UIColor whiteColor];
    l2.textAlignment=NSTextAlignmentCenter;
    l2.text=@"食谱";
    [b2 addSubview:i2];
    [b2 addSubview:l2];
    b2.tag=tag++;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap2.cancelsTouchesInView=NO;
    tap2.delegate = self;
    [b2 addGestureRecognizer:tap2];
    [topView addSubview:b2];
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(1344, 256, 64, 64));
    //得到新的图片
    UIImage *pic2 = [UIImage imageWithCGImage:temImg];
    UIView *b3 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, avgWidth, 90)];
    UIImageView *i3 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-55)/2, 10, 55, 55)];
    i3.image = pic2;
    UILabel *l3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l3.font=[UIFont systemFontOfSize:16];
    l3.textColor=[UIColor whiteColor];
    l3.textAlignment=NSTextAlignmentCenter;
    l3.text=@"材料";
    [b3 addSubview:i3];
    [b3 addSubview:l3];
    b3.tag=tag++;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap3.cancelsTouchesInView=NO;
    tap3.delegate = self;
    [b3 addGestureRecognizer:tap3];
    [topView addSubview:b3];
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(256, 320, 64, 64));
    //得到新的图片
    UIImage *pic3 = [UIImage imageWithCGImage:temImg];

    UIView *b4 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 100, avgWidth, 90)];
    UIImageView *i4 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-55)/2, 15, 55, 55)];
    i4.image = pic3;
    UILabel *l4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l4.font=[UIFont systemFontOfSize:16];
    l4.textColor=[UIColor whiteColor];
    l4.textAlignment=NSTextAlignmentCenter;
    l4.text=@"工具";
    [b4 addSubview:i4];
    [b4 addSubview:l4];
    b4.tag=tag++;
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap4.cancelsTouchesInView=NO;
    tap4.delegate = self;
    [b4 addGestureRecognizer:tap4];
    [topView addSubview:b4];
    
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(512, 64, 64, 64));
    //得到新的图片
    UIImage *pic4 = [UIImage imageWithCGImage:temImg];
    UIView *b5 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 100, avgWidth, 90)];
    UIImageView *i5 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-55)/2, 10, 55, 55)];
    i5.image = pic4;
    UILabel *l5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l5.font=[UIFont systemFontOfSize:16];
    l5.textColor=[UIColor whiteColor];
    l5.textAlignment=NSTextAlignmentCenter;
    l5.text=@"食材";
    [b5 addSubview:i5];
    [b5 addSubview:l5];
    b5.tag=tag++;
    UITapGestureRecognizer *tap5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap5.cancelsTouchesInView=NO;
    tap5.delegate = self;
    [b5 addGestureRecognizer:tap5];
    [topView addSubview:b5];
    
    UIView *b6 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, avgWidth, 90)];
    UIImageView *i6 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i6.image = [UIImage imageNamed:@"newuser"];
    UILabel *l6 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l6.font=[UIFont systemFontOfSize:16];
    l6.textColor=[UIColor blackColor];
    l6.textAlignment=NSTextAlignmentCenter;
    l6.text=@"新手攻略";
    [b6 addSubview:i6];
    [b6 addSubview:l6];
    b6.tag=tag++;
    UITapGestureRecognizer *tap6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap6.cancelsTouchesInView=NO;
    tap6.delegate = self;
    [b6 addGestureRecognizer:tap6];
    [content addSubview:b6];
    
    UIView *b7 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 10, avgWidth, 90)];
    UIImageView *i7 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    temImg=CGImageCreateWithImageInRect(img.CGImage, CGRectMake(704, 128, 64, 64));
    UIImage *pic02 = [UIImage imageWithCGImage:temImg];
    i7.image = pic02;
    UILabel *l7 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l7.font=[UIFont systemFontOfSize:16];
    l7.textColor=[UIColor blackColor];
    l7.textAlignment=NSTextAlignmentCenter;
    l7.text=@"食谱模拟器";
    [b7 addSubview:i7];
    [b7 addSubview:l7];
    b7.tag=tag++;
    UITapGestureRecognizer *tap7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap7.cancelsTouchesInView=NO;
    tap7.delegate = self;
    [b7 addGestureRecognizer:tap7];
    [content addSubview:b7];
    
    UIView *b8 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 10, avgWidth, 90)];
    UIImageView *i8 = [[UIImageView alloc] initWithFrame:CGRectMake( (avgWidth-50)/2, 10, 50, 50)];
    i8.image = [UIImage imageNamed:@"showall"];
    UILabel *l8 = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, avgWidth, 25)];
    l8.font=[UIFont systemFontOfSize:16];
    l8.textColor=[UIColor blackColor];
    l8.textAlignment=NSTextAlignmentCenter;
    l8.text=@"全物速览";
    [b8 addSubview:i8];
    [b8 addSubview:l8];
    b8.tag=tag++;
    UITapGestureRecognizer *tap8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap8.cancelsTouchesInView=NO;
    tap8.delegate = self;
    [b8 addGestureRecognizer:tap8];
    [content addSubview:b8];
    
    NSString *temp=@"更新计划" ;
    CGSize size=[temp sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:14.0f] forKey:NSFontAttributeName]];
    CGFloat x = avgWidth - size.width-30;
    UIView *other0 = [[UIView alloc] initWithFrame:CGRectMake(0, 2, avgWidth, 40)];
    UIImageView *otherimage0 = [[UIImageView alloc] initWithFrame:CGRectMake(x/2, 10, 20, 20)];
    otherimage0.image = [UIImage imageNamed:@"nothing"];
    UILabel *otherlabel0 = [[UILabel alloc] initWithFrame:CGRectMake(x/2+25, 10, size.width+5, 20)];
    otherlabel0.font=[UIFont systemFontOfSize:14];
    otherlabel0.textColor=[UIColor blackColor];
    
    otherlabel0.text=temp;
    [other0 addSubview:otherimage0];
    [other0 addSubview:otherlabel0];
    other0.tag=tag++;
    UITapGestureRecognizer *tap9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap8.cancelsTouchesInView=NO;
    tap8.delegate = self;
    [other0 addGestureRecognizer:tap9];
    [other addSubview:other0];
    
    temp = @"关于应用";
    size =[temp sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:14.0f] forKey:NSFontAttributeName]];
    x = avgWidth - size.width- 30;
    UIView *other1 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth, 2, avgWidth, 40)];
    UIImageView *otherimage1 = [[UIImageView alloc] initWithFrame:CGRectMake(x/2, 10, 20, 20)];
    otherimage1.image = [UIImage imageNamed:@"about"];
    UILabel *otherlabel1 = [[UILabel alloc] initWithFrame:CGRectMake(x/2+25, 10, size.width+5, 20)];
    otherlabel1.font=[UIFont systemFontOfSize:14];
    otherlabel1.textColor=[UIColor blackColor];
    otherlabel1.text=@"关于应用";
    [other1 addSubview:otherimage1];
    [other1 addSubview:otherlabel1];
    other1.tag=tag++;
    UITapGestureRecognizer *tap10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap9.cancelsTouchesInView=NO;
    tap9.delegate = self;
    [other1 addGestureRecognizer:tap10];
    [other addSubview:other1];
    temp = @"给我留言";
    size =[temp sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont fontWithName:@"Arial" size:14.0f] forKey:NSFontAttributeName]];
    x = avgWidth - size.width- 30;
    UIView *other2 = [[UIView alloc] initWithFrame:CGRectMake(avgWidth*2, 2, avgWidth-5, 40)];
    UIImageView *otherimage2 = [[UIImageView alloc] initWithFrame:CGRectMake(x/2, 10, 20, 20)];
    otherimage2.image = [UIImage imageNamed:@"message"];
    UILabel *otherlabel2 = [[UILabel alloc] initWithFrame:CGRectMake(x/2+25, 10, size.width+5, 20)];
    otherlabel2.font=[UIFont systemFontOfSize:14];
    otherlabel2.textColor=[UIColor blackColor];
    //otherlabel2.textAlignment=NSTextAlignmentCenter;
    otherlabel2.text=@"给我留言";//userContentWrapper,
    [other2 addSubview:otherimage2];
    [other2 addSubview:otherlabel2];
    other2.tag=tag;
    UITapGestureRecognizer *tap11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    tap10.cancelsTouchesInView=NO;
    tap10.delegate = self;
    [other2 addGestureRecognizer:tap11];
    [other addSubview:other2];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search2"] style:UIBarButtonItemStyleBordered target:self action:@selector(doSearch:)];
    rightItem.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"quicklook"] style:UIBarButtonItemStyleBordered target:self action:@selector(quickLook:)];
    leftItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem =leftItem;
    
}
-(IBAction)quickLook:(id)sender{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake([UIScreen mainScreen].applicationFrame.size.width/4,60)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical]; //控制滑动分页用
    
//    QuickLookController *show = [[QuickLookController alloc] initWithCollectionViewLayout:flowLayout];
//    [self.navigationController pushViewController:show animated:YES];
}
-(IBAction)doSearch:(id)sender{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
//    SearchViewController *show = [[SearchViewController alloc] init];
//    [self.navigationController pushViewController:show animated:YES];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
-(void)handler :(UITapGestureRecognizer *)sender{
    NSLog(@"tag=%ld",sender.view.tag);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    backItem.tintColor=[UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:backItem];
    switch (sender.view.tag) {
        case 1:{
            PersonController *show = [[PersonController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 2:{
            AnimalController *show = [[AnimalController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
            break;
        }
        case 3:{
            FoodController *show = [[FoodController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 4:{
            BaseMetrController *show = [[BaseMetrController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 5:{
            ToolController *show = [[ToolController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 6:{
            FoodBaseController *show = [[FoodBaseController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 7:{
            TutController *show = [[TutController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 8:{
            SimulatorController *show = [[SimulatorController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 9:{
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
            [flowLayout setItemSize:CGSizeMake([UIScreen mainScreen].applicationFrame.size.width/4,60)];
            [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
            QuickLookController *show = [[QuickLookController alloc] initWithCollectionViewLayout:flowLayout];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 10:{
            WebController *show = [[WebController alloc] init];
            [ShareData shareInstance].urltype=@"http://joveth.github.io/starve";
            show.title=@"更新与计划";
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 11:{
            AboutController *show = [[AboutController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        case 12:{
            MessageViewController *show =[[MessageViewController alloc] init];
            [self.navigationController pushViewController:show animated:YES];
            break;
        }
        default:
            break;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
