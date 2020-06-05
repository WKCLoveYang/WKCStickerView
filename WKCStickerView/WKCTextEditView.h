//
//  WKCTextEditView.h
//  ABC
//
//  Created by wkcloveYang on 2019/8/23.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCEditBaseView.h"

@class WKCTextEditView;

@protocol WKCTextEditViewDelegate <NSObject>

@optional

/// 点击content
/// @param textEditView 当前对象
- (void)textEditViewDidTapContent:(WKCTextEditView *)textEditView;

/// 左上按钮
/// @param textEditView 当前对象
- (void)textEditViewDidTapLeftTop:(WKCTextEditView *)textEditView;

/// 左下按钮
/// @param textEditView 当前对象
- (void)textEditViewDidTapLeftBottom:(WKCTextEditView *)textEditView;

/// 右上按钮
/// @param textEditView 当前对象
- (void)textEditViewDidTapRightTop:(WKCTextEditView *)textEditView;

@end

@interface WKCTextEditView : WKCEditBaseView

/// 代理
@property (nonatomic, weak) id <WKCTextEditViewDelegate> delegate;

/// 内容文案
@property (nonatomic, strong) NSString * contentText;

/// 内容字体
@property (nonatomic, strong) UIFont * contentFont;

/// 字体颜色
@property (nonatomic, strong) UIColor * contentColor;


@end

