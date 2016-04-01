//
//  ViewController.m
//  CAAnimationGroup使用
//
//  Created by cym_bj on 15/7/28.
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
    self.appleIconImageView.frame=CGRectMake(0, 0, 100, 100);
    self.appleIconImageView.image=[UIImage imageNamed:@"applelogo.jpg"];
    [self.view addSubview:self.appleIconImageView];
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
 

    
    CAAnimationGroup *group=[CAAnimationGroup animation];
    
    CABasicAnimation *ba1=[[CABasicAnimation alloc]init];
    ba1.keyPath=@"transform.rotation";
    ba1.toValue=@(M_PI_2);
    
    CABasicAnimation *ba2=[[CABasicAnimation alloc]init];
    ba1.keyPath=@"transform.scale";
    ba1.toValue=@(1.5);
    CABasicAnimation *ba3=[[CABasicAnimation alloc]init];
    ba3.keyPath=@"position";
    ba3.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
    group.animations=@[ba1,ba2,ba3];
    group.duration=3;
    [self.appleIconImageView.layer addAnimation:group forKey:nil];
  
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
