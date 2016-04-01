//
//  ViewController.m
//  CAKeyframeAnimation 使用1
//
//  Created by cym_bj on 15/7/28.
//  Copyright (c) 2015年 com.cym. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *appleIconImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appleIconImage=[[UIImageView alloc]init];
    self.appleIconImage.frame=CGRectMake(0, 0, 100, 100);
    self.appleIconImage.image=[UIImage imageNamed:@"applelogo.jpg"];
    [self.view addSubview:self.appleIconImage];
    CGFloat W=[UIScreen mainScreen].bounds.size.width;
    
    UIView *myView=[[UIView alloc]init];
    myView.frame=CGRectMake(0, 0, W, W);
    myView.backgroundColor=[UIColor redColor];
    myView.layer.cornerRadius=W*0.5;
    [self.view addSubview:myView];
    //把图片移至顶部
    [self.view bringSubviewToFront:self.appleIconImage];
    
    
    
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *keyAn=[[CAKeyframeAnimation alloc]init];
    keyAn.keyPath=@"position";
    
    
    //设置动画执行的路径 指定四个点
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(250, 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 250)];
    
    //数组第一个是“开始状态”。最后一个是“结束状态”。
    keyAn.values=@[value1,value2,value3,value4];
    //设置动画时间
    keyAn.duration=5;
    
    //设置动画节奏
    /*
     
     //kCAMediaTimingFunctionEaseIn 先慢后快
     //kCAMediaTimingFunctionEaseOut 先快后慢
     //kCAMediaTimingFunctionLinear 线性匀速
     //kCAMediaTimingFunctionEaseInEaseOut 中间快两边慢
     */
    keyAn.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
#warning 内部的path的优级大小values优先级
    CGMutablePathRef path=CGPathCreateMutable();
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, screenW, screenW));
    keyAn.path=path;
    CFRelease(path);

    [self.appleIconImage.layer addAnimation:keyAn forKey:nil];

    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
