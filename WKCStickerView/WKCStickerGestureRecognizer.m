//
//  WKCStickerGestureRecognizer.m
//  ABC
//
//  Created by wkcloveYang on 2019/8/22.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCStickerGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface WKCStickerGestureRecognizer()

@property (nonatomic, strong) UIView * anchorView;

@end

@implementation WKCStickerGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action anchorView:(UIView *)anchorView
{
    if (self = [super initWithTarget:target action:action]) {
        _anchorView = anchorView;
    }
    return self;
}


#pragma mark GestureHandle
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([[event touchesForGestureRecognizer:self] count] > 1) {
        self.state = UIGestureRecognizerStateFailed;
    }
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.state == UIGestureRecognizerStatePossible) {
        self.state = UIGestureRecognizerStateBegan;
    } else {
        self.state = UIGestureRecognizerStateChanged;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint anchorViewCenter = _anchorView.center;
    CGPoint currentPoint = [touch locationInView:_anchorView.superview];
    CGPoint previousPoint = [touch previousLocationInView:_anchorView.superview];
    
    CGFloat currentRotation = atan2f((currentPoint.y - anchorViewCenter.y), (currentPoint.x - anchorViewCenter.x));
    CGFloat previousRotation = atan2f((previousPoint.y - anchorViewCenter.y), (previousPoint.x - anchorViewCenter.x));
    
    CGFloat currentRadius = [self distanceBetweenFirstPoint:currentPoint secondPoint:anchorViewCenter];
    CGFloat previousRadius = [self distanceBetweenFirstPoint:previousPoint secondPoint:anchorViewCenter];
    CGFloat scale = currentRadius / previousRadius;
    
    [self setRotation:(currentRotation - previousRotation)];
    [self setScale:scale];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.state == UIGestureRecognizerStateChanged) {
        self.state = UIGestureRecognizerStateEnded;
    } else {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.state = UIGestureRecognizerStateFailed;
}

- (CGFloat)distanceBetweenFirstPoint:(CGPoint)first
                         secondPoint:(CGPoint)second
{
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX * deltaX + deltaY * deltaY);
}

- (void)reset
{
    _rotation = 0;
    _scale = 1;
}

@end
