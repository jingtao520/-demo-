//
//  ViewController.m
//  CABasicAnimation基本使用1
//
//  Created by cym_bj on 15/7/27.
//  Copyright (c) 2015年 com.cym. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *appleIconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.appleIconImageView=[[UIImageView alloc]init];
    self.appleIconImageView.frame=CGRectMake(100, 200, 100, 100);
    self.appleIconImageView.image=[UIImage imageNamed:@"applelogo.jpg"];
    [self.view addSubview:self.appleIconImageView];
    
    
    
}

/*
 核心动画，只是一个假象，真实的大小是没有变化。
 
 解决方案1：如果想控件的大小真实改变，要在动画结束之后设置控件的尺寸。 通过delegate
 解决方案2:使动画保存执行之后的状态，默认动动执行完后，会返回原来的状态。
 设置两个属性.
 baseicAn.removedOnCompletion=NO;
 baseicAn.fillMode=kCAFillModeForwards;
 
 
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    
   
    
    //创建动画
    CABasicAnimation *baseicAn=[[CABasicAnimation alloc]init];
    
    //设置图层的忏悔来决定动画类型。
    baseicAn.keyPath=@"bounds";
    //设置bounds尺寸变化后的大小
    baseicAn.toValue=[NSValue valueWithCGRect:CGRectMake(100, 200, 200, 200)];
    
    
    
    
    //解决方案1： 动画的代理
    //animation.delegate = self;
    
    //解决方案2：使动画保存执行之后的状态，只要设置动画的两个属性
    baseicAn.removedOnCompletion=NO;//动画对象不要移除
    baseicAn.fillMode=kCAFillModeForwards;//保存当前的状态
    
    [self.appleIconImageView.layer addAnimation:baseicAn forKey:nil];
     
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.appleIconImageView.bounds=CGRectMake(100, 200, 200, 200);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
