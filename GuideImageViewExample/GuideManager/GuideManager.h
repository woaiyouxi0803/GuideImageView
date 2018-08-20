//
//  GuideManager.h
//  GuideImageViewExample
//
//  Created by jiangxin on 2018/7/18.
//  Copyright © 2018年 woaiyouxi0803. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuideImageView.h"
@interface GuideManager : NSObject

+ (void)guidExample:(UIView *)view clickBlock:(GuideImageViewClickBlock)clickBlock;

+ (void)guideTabbarItemAtIndex:(NSUInteger)index clickBlock:(GuideImageViewClickBlock)clickBlock;

+ (void)maskExample:(UIView *)view clickBlock:(GuideImageViewClickBlock)clickBlock;

+ (void)maskTabbarItemAtIndex:(NSUInteger)index clickBlock:(GuideImageViewClickBlock)clickBlock;

@end
