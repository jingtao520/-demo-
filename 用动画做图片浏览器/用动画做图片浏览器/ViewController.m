//
//  ViewController.m
//  用动画做图片浏览器
//
//  Created by cym_bj on 15/7/28.
//  Copyright (c) 2015年 com.cym. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray *imageArray;//所放所在的图片
@property (nonatomic,assign)NSInteger currentImageIndex;//当前图片索引。
@property (nonatomic,strong)UIImageView *displayImageView;

@end

@implementation ViewController


 
 /**
 *******************************************************
 type:动画类型(比如：滴水效果，翻转效果...)
 -------------------------------------------------------
 fade kCATransitionFade 交叉淡化过渡
 moveIn kCATransitionMoveIn 新视图移到旧视图上面
 push kCATransitionPush 新视图把旧视图推出去
 reveal kCATransitionReveal 将旧视图移开,显示下面的新视图
 pageCurl               向上翻一页
 pageUnCurl             向下翻一页
 rippleEffect             滴水效果
 suckEffect 收缩效果，如一块布被抽走
 cube                   立方体效果
 oglFlip              上下左右翻转效果
 rotate     旋转效果
 cameraIrisHollowClose 相机镜头关上效果(不支持过渡方向)
 cameraIrisHollowOpen 相机镜头打开效果(不支持过渡方向)
 
 *******************************************************
 subtype: 动画方向(比如说是从左边进入，还是从右边进入...)
 ------------------------------------------------------
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 
 当 type 为@"rotate"(旋转)的时候,它也有几个对应的 subtype,分别为:
 90cw 逆时针旋转 90°
 90ccw 顺时针旋转 90°
 180cw 逆时针旋转 180°
 180ccw  顺时针旋转 180°
 **/

-(NSMutableArray *)imageArray
{
    if (_imageArray==nil)
    {
        
        _imageArray=[NSMutableArray array];
        
        for (int i=0 ; i<8;i++)
        {
            NSString *name=[NSString stringWithFormat:@"%d.jpg",i+1];
            [_imageArray addObject:name];
            NSLog(@"name=%@",name);
        }
        
        
    }
    return _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.displayImageView=[[UIImageView alloc]init];
    self.displayImageView.frame=self.view.bounds;
    [self.view addSubview:self.displayImageView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(operation:)];
    [self.view addGestureRecognizer:tap];
    
    self.currentImageIndex=-1;
    [self next];
}
-(void)operation:(UITapGestureRecognizer*)tap
{
  CGPoint point = [tap locationInView:self.displayImageView];
    
    if (point.x>=self.view.bounds.size.width/2)
    {
        [self next];
    }
    else
    {
        [self top];
    }
}
#pragma mark - 上一张
-(void)top
{
    
    self.currentImageIndex--;
    if (self.currentImageIndex<0)
    {
        self.currentImageIndex=self.imageArray.count-1;
    }
    self.displayImageView.image=[UIImage imageNamed:self.imageArray[self.currentImageIndex]];
   
    
    CATransition *animation=[[CATransition alloc]init];
    animation.type=@"rotate";;
    animation.subtype=@"90cw";
    animation.duration=2;
    [self.displayImageView.layer addAnimation:animation forKey:nil];
}
#pragma mark - 下一张
-(void)next
{
    self.currentImageIndex++;
    if (self.currentImageIndex>self.imageArray.count-1)
    {
        self.currentImageIndex=0;
    }
    self.displayImageView.image=[UIImage imageNamed:self.imageArray[self.currentImageIndex]];
    
    
    
    
    //设置转场动画
    CATransition *animation=[[CATransition alloc]init];
    animation.type=@"push";
    animation.subtype=@"fromTop";
    animation.duration=2;
    [self.displayImageView.layer addAnimation:animation forKey:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
