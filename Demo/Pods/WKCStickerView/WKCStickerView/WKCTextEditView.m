//
//  WKCTextEditView.m
//  ABC
//
//  Created by wkcloveYang on 2019/8/23.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCTextEditView.h"

@implementation WKCTextEditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self.contentView = [[UILabel alloc] init];
    self.contentView.backgroundColor = UIColor.clearColor;
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

- (void)gestureTap:(UITapGestureRecognizer *)sender
{
    [super gestureTap:sender];
    
    if (sender.view == self.contentView) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(textEditViewDidTapContent:)]) {
            [self.delegate textEditViewDidTapContent:self];
        }
    } else if (sender.view == self.deleteControl) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(textEditViewDidTapDelete:)]) {
            [self.delegate textEditViewDidTapDelete:self];
        }
    } else if (sender.view == self.rightTopControl) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(textEditViewDidTapRightTop:)]) {
            [self.delegate textEditViewDidTapRightTop:self];
        }
    } else if (sender.view == self.leftBottomControl) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(textEditViewDidTapLeftBottom:)]) {
            [self.delegate textEditViewDidTapLeftBottom:self];
        }
    }
}

#pragma mark - Setter
- (void)setContentText:(NSString *)contentText
{
    _contentText = contentText;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.text = contentText;
}

- (void)setContentFont:(UIFont *)contentFont
{
    _contentFont = contentFont;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.font = contentFont;
}

- (void)setContentColor:(UIColor *)contentColor
{
    _contentColor = contentColor;
    
    UILabel * contentLabel = (UILabel *)self.contentView;
    contentLabel.textColor = contentColor;
}

@end
