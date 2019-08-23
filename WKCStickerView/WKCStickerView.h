//
//  WKCStickerView.h
//  ABC
//
//  Created by wkcloveYang on 2019/8/22.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCEditBaseView.h"

@class WKCStickerView;

@protocol WKCStickerViewDelegate <NSObject>

@optional

/**
  点击了内容视图
  @param stickerView 当前对象
 */
- (void)stickerViewDidTapContent:(WKCStickerView *)stickerView;

/**
 删除
 @param stickerView 当前对象
 */
- (void)stickerViewDidTapDelete:(WKCStickerView *)stickerView;

/**
 左下按钮
 @param stickerView 当前对象
 */
- (void)stickerViewDidTapLeftBottom:(WKCStickerView *)stickerView;

/**
 右上按钮
 @param stickerView 当前对象
 */
- (void)stickerViewDidTapRightTop:(WKCStickerView *)stickerView;


@end


@interface WKCStickerView : WKCEditBaseView

/**
  代理
 */
@property (nonatomic, weak) id <WKCStickerViewDelegate> delegate;

/**
  贴纸
 */
@property (nonatomic, strong) UIImage * contentImage;


@end

