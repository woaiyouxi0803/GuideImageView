///https://www.jianshu.com/p/b40f5decd085
///https://github.com/woaiyouxi0803/GuideImageView
#import "GuideImageView.h"
@implementation GuideImageView

+ (instancetype)sharedInstance
{
    static GuideImageView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.frame = [UIScreen mainScreen].bounds;
        [self addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(otherTapClick)]];
    }
    return self;
}

- (void)addGuideWithMaskView:(UIView *)maskView imageName:(NSString *)imageName imageSize:(CGSize )imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock
{
    CGRect maskViewRect;
    BOOL err = NO;
    @try{
        [maskView superview];
    }@catch(NSException *exception){
        NSLog(@"\nexception:\n%@",exception);
        err = YES;
    }@finally{
        
    }
    if (err)
    {
        return;
    }
    
    maskViewRect = [maskView.superview convertRect:maskView.frame toView:[UIApplication sharedApplication].keyWindow];
    ///maskRect.size == maskImageRect.size && maskRect.center == maskViewRect.center
    _maskRect = CGRectMake(maskViewRect.origin.x + (maskViewRect.size.width - maskImageRect.size.width)/2.0 , maskViewRect.origin.y + (maskViewRect.size.height - maskImageRect.size.height)/2.0, maskImageRect.size.width, maskImageRect.size.height);
    
    [self addGuideWithMaskViewRect:maskViewRect imageName:imageName imageSize:imageSize maskImageRect:maskImageRect confirmRect:confirmRect clickBlock:clickBlock];
}

- (void)addGuideWithTabBarItemIndex:(NSUInteger)index imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock
{
    CGRect maskViewRect = [self getTabBarItemConvertRectTokeyWindowAtIndex:index];
    /// (maskViewRect.size.height = 48)
    /// maskRect.size == maskImageRect.size && maskRect.center == maskViewRect.center
    _maskRect = CGRectMake(maskViewRect.origin.x + (maskViewRect.size.width - maskImageRect.size.width)/2.0 , maskViewRect.origin.y,  maskImageRect.size.width, maskImageRect.size.height);
    
    [self addGuideWithMaskViewRect:maskViewRect imageName:imageName imageSize:imageSize maskImageRect:maskImageRect confirmRect:confirmRect clickBlock:clickBlock];
}

#pragma mark - ************* 基础方法 ******************
- (void)addGuideWithMaskViewRect:(CGRect)maskViewRect imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock
{
    self.layer.mask = nil;
    _clickBlock = clickBlock;
    
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
    }
    _imageView.image = [UIImage imageNamed:imageName];
    [self addSubview:_imageView];
    CGFloat x = (maskViewRect.origin.x + maskViewRect.size.width/2.0) - (maskImageRect.origin.x + maskImageRect.size.width/2.0);
    CGFloat y =  (maskViewRect.origin.y + maskViewRect.size.height/2.0) - (maskImageRect.origin.y + maskImageRect.size.height/2.0);
    _imageView.frame = CGRectMake(x, y, imageSize.width, imageSize.height);
    
    
    if (!_maskButton)
    {
        _maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_maskButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self addSubview:_maskButton];
    _maskButton.frame = maskViewRect;
    
    if (!_confirmButton)
    {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [_imageView addSubview:_confirmButton];
    _confirmButton.frame = confirmRect;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

#pragma mark - ************* tabbarItem（UITabBarButton）相对屏幕坐标 ******************
- (CGRect)getTabBarItemConvertRectTokeyWindowAtIndex:(NSUInteger)index
{
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([rootVC isKindOfClass:[UITabBarController class]])
    {
        UITabBar *tabBar = ((UITabBarController *)rootVC).tabBar;
        if (index < tabBar.items.count)
        {
            NSMutableArray * tabbarBtns = [NSMutableArray array];
            for (UIView *subView in tabBar.subviews)
            {
                if ([NSStringFromClass([subView class]) isEqualToString:@"UITabBarButton"])
                {
                    
                    if (tabbarBtns.count==0)
                    {
                        [tabbarBtns addObject:subView];
                    }
                    else
                    {
                        for (NSInteger i = tabbarBtns.count - 1; 0 <= i ; i--)
                        {
                            UIView * preView = tabbarBtns[i];
                            if (preView.frame.origin.x <= subView.frame.origin.x)
                            {
                                [tabbarBtns addObject:subView];
                                break;
                            }
                            if (i == 0)
                            {
                                [tabbarBtns insertObject:subView atIndex:0];
                            }
                        }
                    }
                }
            }
            UIView * indexView = tabbarBtns[index];
            return [indexView.superview convertRect:indexView.frame toView:[UIApplication sharedApplication].keyWindow];
        }
        NSLog(@"\nerror:\n(index < tabBar.items.count) == NO ");
        return CGRectZero;
    }
    NSLog(@"\nerror:\n[rootVC isKindOfClass:[UITabBarController class]] == NO!");
    return CGRectZero;
}

#pragma mark - ************* 普通View镂空效果 ******************

- (void)hollowWithGuideImageViewMaskType:(GuideImageViewMask)maskType cornerRadius:(CGFloat)cornerRadius maskView:(UIView *)maskView imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock
{
    [self addGuideWithMaskView:maskView imageName:imageName imageSize:imageSize maskImageRect:maskImageRect confirmRect:confirmRect clickBlock:clickBlock];

    [self hollowWithGuideImageViewMaskType:maskType cornerRadius:cornerRadius];
}

#pragma mark - ************* 镂空效果 ******************

- (void)hollowWithGuideImageViewMaskType:(GuideImageViewMask)maskType cornerRadius:(CGFloat)cornerRadius
{
    if (maskType != GuideImageViewMaskNone)
    {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:[UIApplication sharedApplication].keyWindow.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        if (maskType == GuideImageViewMaskRoundRect)
        {
            [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:_maskRect cornerRadius:cornerRadius] bezierPathByReversingPath]];
        }else if (maskType == GuideImageViewMaskCircumcircle)
        {
            CGPoint point = CGPointMake(_maskRect.origin.x + _maskRect.size.width/2.0, _maskRect.origin.y + _maskRect.size.height/2.0);
            CGFloat leg = hypotf((_maskRect.size.width/2), (_maskRect.size.height/2));
            [path appendPath:[UIBezierPath bezierPathWithArcCenter:point radius:leg startAngle:0 endAngle:2*M_PI clockwise:NO]];
        }
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    }
}

#pragma mark - ************* 点击 ******************
- (void)buttonClick:(UIButton *)button
{
    if (button == _maskButton)
    {
//        NSLog(@"_maskButton");
        if (_clickBlock)
        {
            _clickBlock(GuideImageViewClickMaskButton);
        }
    }
    else if (button == _confirmButton)
    {
//        NSLog(@"_confirmButton");
        if (_clickBlock)
        {
            _clickBlock(GuideImageViewClickConfirmButton);
        }
        if (self.superview)
        {
            [self removeFromSuperview];
        }
    }
}

- (void)otherTapClick
{
//    NSLog(@"otherTapClick");
    if (_clickBlock)
    {
        _clickBlock(GuideImageViewClickOther);
    }
}

@end
