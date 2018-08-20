//
//  FirstViewController.m
//  GuideImageViewExample
//
//  Created by jiangxin on 2018/7/18.
//  Copyright © 2018年 woaiyouxi0803. All rights reserved.
//

#import "FirstViewController.h"
#import "GuideManager.h"

@interface FirstViewController ()
@property (nonatomic ,strong) UIButton *exampleView;
@property (nonatomic ,strong) UIButton *maskExampleView;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
  
    _exampleView = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:_exampleView];
    [_exampleView setTitle:@"连续播放" forState:UIControlStateNormal];
    [_exampleView addTarget:self action:@selector(guidExample) forControlEvents:UIControlEventTouchUpInside];
    _exampleView.backgroundColor = [UIColor yellowColor];
    _exampleView.frame = CGRectMake(220, 120, 80, 30);
    
    UIButton * guideTabbarItembutton = [UIButton buttonWithType:UIButtonTypeSystem];
    guideTabbarItembutton.frame = CGRectMake(50, 150, 120, 50);
    guideTabbarItembutton.backgroundColor = [UIColor redColor];
    [guideTabbarItembutton setTitle:@"guideTabbarItem" forState:UIControlStateNormal];
    [guideTabbarItembutton addTarget:self action:@selector(guideTabbarItemAtIndex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:guideTabbarItembutton];

    _maskExampleView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_maskExampleView];
    [_maskExampleView setTitle:@"点击加速" forState:(UIControlStateNormal)];
    [_maskExampleView addTarget:self action:@selector(maskExample) forControlEvents:UIControlEventTouchUpInside];
    _maskExampleView.backgroundColor = [UIColor blueColor];
    _maskExampleView.frame = CGRectMake(220, 180, 80, 30);
    
    UIButton * maskTabbarItembutton = [UIButton buttonWithType:UIButtonTypeSystem];
    maskTabbarItembutton.frame = CGRectMake(50, 270, 120, 50);
    maskTabbarItembutton.backgroundColor = [UIColor redColor];
    [maskTabbarItembutton setTitle:@"maskTabbarItem" forState:UIControlStateNormal];
    [maskTabbarItembutton addTarget:self action:@selector(maskTabbarItemAtIndex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:maskTabbarItembutton];
}

- (void)guidExample
{
    [GuideManager guidExample:_exampleView clickBlock:^(GuideImageViewClick click) {
        NSLog(@"block click:%zd",click);
    }];
}

- (void)guideTabbarItemAtIndex
{
    [GuideManager guideTabbarItemAtIndex:0 clickBlock:^(GuideImageViewClick click) {
        NSLog(@"block click:%zd",click);
    }];
}

- (void)maskExample
{
    [GuideManager maskExample:_maskExampleView clickBlock:^(GuideImageViewClick click) {
        NSLog(@"block click:%zd",click);
    }];
}

- (void)maskTabbarItemAtIndex
{
    [GuideManager maskTabbarItemAtIndex:1 clickBlock:^(GuideImageViewClick click) {
        NSLog(@"block click:%zd",click);
    }];
}

@end
