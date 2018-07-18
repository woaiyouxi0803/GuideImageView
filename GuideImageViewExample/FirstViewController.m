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
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 150, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"guideTabbar" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(guideTabbarItemAtIndex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

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

@end
