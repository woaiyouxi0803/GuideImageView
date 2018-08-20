///https://www.jianshu.com/p/b40f5decd085
///https://github.com/woaiyouxi0803/GuideImageView
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GuideImageViewClick) {
    GuideImageViewClickNone,
    GuideImageViewClickMaskButton,
    GuideImageViewClickConfirmButton,
    GuideImageViewClickOther
};


typedef NS_ENUM(NSInteger, GuideImageViewMask) {
    GuideImageViewMaskNone,
    /**
     矩形/带圆角的矩形/内接圆
     1.cornerRadius==0 --> 矩形
     2.(maskImageRect.w == maskImageRect.h && cornerRadius == maskImageRect.w/2.0) --> 内接圆
     */
    GuideImageViewMaskRoundRect,
    /// 外接圆
    GuideImageViewMaskCircumcircle,
};


typedef void (^GuideImageViewClickBlock)(GuideImageViewClick click);

@interface GuideImageView : UIView

@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , strong) UIButton *maskButton;
@property (nonatomic , strong) UIButton *confirmButton;

+ (instancetype)sharedInstance;

/// 基础方法
- (void)addGuideWithMaskViewRect:(CGRect)maskViewRect imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

/// 普通View
- (void)addGuideWithMaskView:(UIView *)maskView imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

/// tabBar
- (void)addGuideWithTabBarItemIndex:(NSUInteger)index imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

/// 带镂空效果
- (void)hollowWithGuideImageViewMaskType:(GuideImageViewMask)maskType cornerRadius:(CGFloat)cornerRadius maskView:(UIView *)maskView imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

/// 镂空
- (void)hollowWithGuideImageViewMaskType:(GuideImageViewMask)maskType cornerRadius:(CGFloat)cornerRadius;

@property (nonatomic , copy) GuideImageViewClickBlock clickBlock;

/**
 *  maskRect.size == maskImageRect.size
 *  maskRect.center == maskViewRect.center
 * (line45 & line55 GuideImageView.m)
 */
@property (nonatomic , assign) CGRect maskRect;

@end
