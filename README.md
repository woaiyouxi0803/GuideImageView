# GuideImageView
Object-C ，GuideImageView,新手引导

[简书 https://www.jianshu.com/p/b40f5decd085](https://www.jianshu.com/p/b40f5decd085)

support light on UITabBarItem

![](2.png)

新增hollow镂空,

![](3.png)

常用方法：



####一、主要用于普通View


`- (void)addGuideWithMaskView:(UIView*)maskView imageName:(NSString*)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;`


这里解释下maskImageRect和confirmRect。

![image](http://upload-images.jianshu.io/upload_images/1751374-6d2549e7ba1f6af9?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

maskImageRect和confirmRect都是图片中的相对坐标系。

高亮部分为maskImageRect，上图中为(180, 0 ,110 ,40)

确认部分为confirmRect，上图为( 50 , 207 , 120 , 40)

demo中使用方法为

`[[[GuideImageView alloc] init] addGuideWithMaskView:view imageName:@"Group1" imageSize:CGSizeMake(289, 247) maskImageRect:CGRectMake(180, 0, 110, 40) confirmRect:CGRectMake(50, 207, 120, 40) clickBlock:clickBlock];`

点击maskImageRect和maskImageRect都会有clickBlock

并且confirmRect的位置会`[self removeFromSuperview]`移除视图

--------------



####二、对于UITabBarItem，则根据下面方法


`- (void)addGuideWithTabBarItemIndex:(NSUInteger)index imageName:(NSString*)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;`

demo：

`[[[GuideImageView alloc] init] addGuideWithTabBarItemIndex:index imageName:@"Group4" imageSize:CGSizeMake(218, 313) maskImageRect:CGRectMake(20, 255, 60, 58) confirmRect:CGRectMake(60, 0, 120, 40) clickBlock:clickBlock]`

-----
####三、新增。带镂空效果
镂空区域为maskRect，中心与maskView.center对齐，大小为maskImageRect.size
```
maskRect.size == maskImageRect.size  &&
maskRect.center == maskViewRect.center
```
方法:

`- (void)hollowWithGuideImageViewMaskType:(GuideImageViewMask)maskType cornerRadius:(CGFloat)cornerRadius maskView:(UIView *)maskView imageName:(NSString *)imageName imageSize:(CGSize)imageSize maskImageRect:(CGRect)maskImageRect confirmRect:(CGRect)confirmRect clickBlock:(GuideImageViewClickBlock)clickBlock;
`

demo:

`[maskGuidImageView hollowWithGuideImageViewMaskType:GuideImageViewMaskRoundRect cornerRadius:15 maskView:view imageName:@"Coin_Speed_BlackSecond6" imageSize:CGSizeMake(270, 185) maskImageRect:CGRectMake(80, -30, 80+30, 30) confirmRect:CGRectMake(0, 0, 270, 185) clickBlock:clickBlock];`

or

`    [maskGuidImageView hollowWithGuideImageViewMaskType:GuideImageViewMaskRoundRect cornerRadius:48/2.0];
`
