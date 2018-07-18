//
//  GuideManager.m
//  GuideImageViewExample
//
//  Created by jiangxin on 2018/7/18.
//  Copyright © 2018年 woaiyouxi0803. All rights reserved.
//

#import "GuideManager.h"

@implementation GuideManager

+ (void)guidExample:(UIView *)view clickBlock:(GuideImageViewClickBlock)clickBlock
{
     [[[GuideImageView alloc] init] addGuideWithMaskView:view imageName:@"Group1" imageSize:CGSizeMake(289, 247) maskImageRect:CGRectMake(180, 0, 110, 40) confirmRect:CGRectMake(50, 207, 120, 40) clickBlock:clickBlock];
}

+ (void)guideTabbarItemAtIndex:(NSUInteger)index clickBlock:(GuideImageViewClickBlock)clickBlock
{
    [[[GuideImageView alloc] init] addGuideWithTabBarItemIndex:index imageName:@"Group4" imageSize:CGSizeMake(218, 313) maskImageRect:CGRectMake(20, 255, 60, 58) confirmRect:CGRectMake(60, 0, 120, 40) clickBlock:clickBlock];
}


@end
