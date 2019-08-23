//
//  WKCStickerGestureRecognizer.h
//  ABC
//
//  Created by wkcloveYang on 2019/8/22.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WKCStickerGestureRecognizer : UIGestureRecognizer

/**
  比例
 */
@property (nonatomic, assign) CGFloat scale;

/**
  旋转角度
 */
@property (nonatomic, assign) CGFloat rotation;


/**
  初始化
  @param target target
  @param action action
  @param anchorView 锚点视图
 */
- (instancetype)initWithTarget:(id)target action:(SEL)action anchorView:(UIView *)anchorView;

/**
  重置
 */
- (void)reset;

@end

