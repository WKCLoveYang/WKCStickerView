//
//  WKCEditBaseView.h
//  ABC
//
//  Created by wkcloveYang on 2019/8/22.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WKCEditBaseView : UIView

@property (nonatomic, strong, readonly) UIImageView * deleteControl;
@property (nonatomic, strong, readonly) UIImageView * resizeControl;
@property (nonatomic, strong, readonly) UIImageView * leftBottomControl;
@property (nonatomic, strong, readonly) UIImageView * rightTopControl;

/**
  内容视图
 */
@property (nonatomic, strong) UIView * contentView;

/**
  记录content坐标
 */
@property (nonatomic, assign) CGRect contentFrame;;

/**
 控件是否处于活跃状态 默认YES
 */
@property (nonatomic, assign) BOOL isActivity;

/**
 选中时是是否要动画 默认YES
 */
@property (nonatomic, assign) BOOL shouldAnimation;

/**
 点击时,不移动到最上层 默认NO
 */
@property (nonatomic, assign) BOOL notTapBringToFront;

/**
旋转视图
*/
@property (nonatomic, strong) UIImage * rorationImage;

/**
 删除视图
 */
@property (nonatomic, strong) UIImage * deleteImage;

/**
 左下角视图
 */
@property (nonatomic, strong) UIImage * leftBottomImage;

/**
 右上角视图
 */
@property (nonatomic, strong) UIImage * rightTopImage;

/**
 是否要边框线(默认YES)
 */
@property (nonatomic, assign) BOOL shouldShowBorder;

/**
 边框是否是锯齿效果(默认YES)
 */
@property (nonatomic, assign) BOOL shouldBorderAntialias;

/**
 边框宽度
 */
@property (nonatomic, assign) CGFloat borderWidth;

/**
 边框颜色
 */
@property (nonatomic, strong) UIColor * borderColor;

/**
 最小比例, 默认0.5
 */
@property (nonatomic, assign) CGFloat minScale;

/**
 最大比例, 默认2.0
 */
@property (nonatomic, assign) CGFloat maxScale;

/**
 按钮大小
 */
@property (nonatomic, assign) CGSize controlSize;

/**
 限制宽度
 */
@property (nonatomic, assign) CGFloat limitWidth;




/**
  重置大小
  @param origin 原坐标
 */
- (CGRect)resetFrameWithOrigin:(CGRect)origin;

/**
  重置子视图的坐标
 */
- (void)setUpSubviewsFrames;

/**
  点击手势
 */
- (void)gestureTap:(UITapGestureRecognizer *)sender;

@end
