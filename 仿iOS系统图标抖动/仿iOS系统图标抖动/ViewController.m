//
//  ViewController.m
//  仿iOS系统图标抖动
//
//  Created by cym_bj on 15/7/28.
//  Copyright (c) 2015年 com.cym. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,strong)UIImageView *appleIconImage;
-(IBAction)start;
-(IBAction)stop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    self.appleIconImage=[[UIImageView alloc]init];
    self.appleIconImage.frame=CGRectMake(100, 50, 60, 60);
    self.appleIconImage.image=[UIImage imageNamed:@"applelogo.jpg"];
    [self.view addSubview:self.appleIconImage];
    
    
}
-(void)start
{
    CAKeyframeAnimation *keyAn=[[CAKeyframeAnimation alloc]init];
    
    keyAn.keyPath=@"transform.rotation";
    //keyAn.duration=3;
    //旋转弧度
    CGFloat rot=M_PI_4;
    keyAn.values=@[@(-rot),@(rot),@(-rot)];
    //设置动画执行的次数
    keyAn.repeatCount=MAX_CANON;
    
    [self.appleIconImage.layer addAnimation:keyAn forKey:@"rotation"];
   
    
}
-(void)stop
{
    //通过key把动画移除
    [self.appleIconImage.layer removeAnimationForKey:@"rotation"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
