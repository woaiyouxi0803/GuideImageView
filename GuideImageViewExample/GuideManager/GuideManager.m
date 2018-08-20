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

+ (void)maskExample:(UIView *)view clickBlock:(GuideImageViewClickBlock)clickBlock
{
    GuideImageView *maskGuidImageView = [[GuideImageView alloc] init];

    [maskGuidImageView hollowWithGuideImageViewMaskType:GuideImageViewMaskRoundRect cornerRadius:15 maskView:view imageName:@"Coin_Speed_BlackSecond6" imageSize:CGSizeMake(270, 185) maskImageRect:CGRectMake(80, -30, 80+30, 30) confirmRect:CGRectMake(0, 0, 270, 185) clickBlock:clickBlock];
}

+ (void)maskTabbarItemAtIndex:(NSUInteger)index clickBlock:(GuideImageViewClickBlock)clickBlock
{
    GuideImageView *maskGuidImageView = [[GuideImageView alloc] init];
    [maskGuidImageView addGuideWithTabBarItemIndex:index imageName:@"containerGuide" imageSize:CGSizeMake(248, 73.5) maskImageRect:CGRectMake(100, 73.5, 48, 48) confirmRect:CGRectMake(0, 0, 248,73.5) clickBlock:clickBlock];
    
    /// maskViewRect.size.height = 48
    [maskGuidImageView hollowWithGuideImageViewMaskType:GuideImageViewMaskRoundRect cornerRadius:48/2.0];
}


@end
