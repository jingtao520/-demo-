//
//  ViewController.m
//  CABasicAnimation 使用2
//
//  Created by cym_bj on 15/7/27.
//  Copyright (c) 2015年 com.cym. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic,strong)UIImageView *appleIcionImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appleIcionImage=[[UIImageView alloc]init];
    self.appleIcionImage.frame=CGRectMake(100, 100, 100,100);
    self.appleIcionImage.image=[UIImage imageNamed:@"applelogo.jpg"];
    [self.view addSubview:self.appleIcionImage];
   
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self transformScaleAnnimation];
    
    //[self transformRotationAnniation];
   // [self transformTranslationAnniation];
    [self positionAnnimation];
}
#pragma mark - 缩放的动画
-(void)transformScaleAnnimation
{
    CABasicAnimation *baAn=[[CABasicAnimation alloc]init];
    baAn.keyPath=@"transform.scale.x";
    
    
    //byValue的数据类型 由 keyPath 决定每次动画执行的  "增加值"
    baAn.byValue=@(1.5);
    baAn.removedOnCompletion=NO;
    baAn.fillMode=kCAFillModeForwards;
    [self.appleIcionImage.layer addAnimation:baAn forKey:nil];
}
#pragma mark- 旋转的动画
-(void)transformRotationAnniation
{
    CABasicAnimation *baAn=[[CABasicAnimation alloc]init];
    baAn.keyPath=@"transform.rotation.x";
    baAn.byValue=@(M_PI);
    
    //动画执行时间
    baAn.duration=3;
    
    baAn.removedOnCompletion=NO;
    baAn.fillMode=kCAFillModeForwards;
    [self.appleIcionImage.layer addAnimation:baAn forKey:nil];
    
}
#pragma mark - 平移的动画
-(void)transformTranslationAnniation
{
    
    
    CABasicAnimation *baAn=[[CABasicAnimation alloc]init];
    
    baAn.keyPath=@"transform.translation.x";
    baAn.byValue=@10;
    baAn.removedOnCompletion=NO;
    baAn.fillMode=kCAFillModeForwards;
    
    [self.appleIcionImage.layer addAnimation:baAn forKey:nil];
    
}


#pragma mark 位置的动画
-(void)positionAnnimation{
    //核心动画使用步骤
    //1.创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    //设置动画类型
    animation.keyPath = @"position";
    
    //动画执行的 "初始状态"
    //animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    //动画执行的 "最终状态"
    //animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 250)];
    
    
    //每次动画执行的  "增加值"
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    
    //保存动画执行状态
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    animation.removedOnCompletion = NO;//动画对象不要移除
    animation.fillMode = kCAFillModeForwards;//保存当前的状态
    
    
    //2.往控件的图层添加动画
    [self.appleIcionImage.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
