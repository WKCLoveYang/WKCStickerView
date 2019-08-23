//
//  WKCStickerView.m
//  ABC
//
//  Created by wkcloveYang on 2019/8/22.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCStickerView.h"
#import "WKCStickerGestureRecognizer.h"

@interface WKCStickerView()


@end

@implementation WKCStickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self.contentView = [[UIImageView alloc] init];
    self.contentView.contentMode = UIViewContentModeScaleAspectFit;
    self.contentView.layer.masksToBounds = YES;
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

- (void)gestureTap:(UITapGestureRecognizer *)sender
{
    [super gestureTap:sender];
    
    if (sender.view == self.contentView) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(stickerViewDidTapContent:)]) {
            [self.delegate stickerViewDidTapContent:self];
        }
    } else if (sender.view == self.deleteControl) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(stickerViewDidTapDelete:)]) {
            [self.delegate stickerViewDidTapDelete:self];
        }
    } else if (sender.view == self.rightTopControl) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(stickerViewDidTapRightTop:)]) {
            [self.delegate stickerViewDidTapRightTop:self];
        }
    } else if (sender.view == self.leftBottomControl) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(stickerViewDidTapLeftBottom:)]) {
            [self.delegate stickerViewDidTapLeftBottom:self];
        }
    }
}

#pragma mark -Setter
- (void)setContentImage:(UIImage *)contentImage
{
    _contentImage = contentImage;
    UIImageView * imageView = (UIImageView *)self.contentView;
    imageView.image = contentImage;
    [self resetFramesWithImage:contentImage];
}

- (void)resetFramesWithImage:(UIImage *)image
{
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    CGPoint center = self.center;
    CGFloat newWidth = self.limitWidth;
    CGFloat newHeight = newWidth * imageHeight / imageWidth;
    self.frame = [self resetFrameWithOrigin:CGRectMake(0, 0, newWidth - self.controlSize.width, newHeight - self.controlSize.height)];
    self.center = center; //保持中心位置不变
    [self setUpSubviewsFrames];
    self.contentFrame = self.frame;
}

@end
