///https://www.jianshu.com/p/b40f5decd085
///https://github.com/woaiyouxi0803/GuideImageView
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GuideImageViewClick) {
    GuideImageViewClickNone,
    GuideImageViewClickMaskButton,
    GuideImageViewClickConfirmButton
};

typedef void (^GuideImageViewClickBlock)(GuideImageViewClick click);

@interface GuideImageView : UIView

@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , strong) UIButton *maskButton;
@property (nonatomic , strong) UIButton *confirmButton;

+ (instancetype)sharedInstance;

- (void)addGuideWithMaskViewRect:(CGRect)maskViewRect imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

- (void)addGuideWithMaskView:(UIView *)maskView imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

- (void)addGuideWithTabBarItemIndex:(NSUInteger)index imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;

@property (nonatomic , copy) GuideImageViewClickBlock clickBlock;

@end
