//
//  WKCEditBaseView.m
//  ABC
//
//  Created by wkcloveYang on 2019/8/22.
//  Copyright © 2019 wkcloveYang. All rights reserved.
//

#import "WKCEditBaseView.h"
#import "WKCStickerGestureRecognizer.h"

@interface WKCEditBaseView()
<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView * resizeControl;
@property (nonatomic, strong) UIImageView * leftTopControl;
@property (nonatomic, strong) UIImageView * leftBottomControl;
@property (nonatomic, strong) UIImageView * rightTopControl;
@property (nonatomic, strong) CAShapeLayer * shapeLayer;

@property (nonatomic, strong) UIRotationGestureRecognizer *rotateGesture;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinGesture;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer1;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer2;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer3;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer4;
@property (nonatomic, strong) WKCStickerGestureRecognizer * stickerGesture;

@end


@implementation WKCEditBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    _contentFrame = frame;
    _limitWidth = frame.size.width;
    if (self = [super initWithFrame:[self resetFrameWithOrigin:frame]]) {
        
        _borderColor = UIColor.whiteColor;
        _borderWidth = 2;
        _controlSize = CGSizeMake(20, 20);
        self.exclusiveTouch = YES;
        self.userInteractionEnabled = YES;
        self.resizeControl.userInteractionEnabled = YES;
        self.leftTopControl.userInteractionEnabled = YES;
        self.rightTopControl.userInteractionEnabled = YES;
        self.leftBottomControl.userInteractionEnabled = YES;
        
        _isActivity = YES;
        _shouldAnimation = YES;
        _notTapBringToFront = NO;
        _shouldShowBorder = YES;
        _shouldBorderAntialias = YES;
        
        _minScale = 0.5;
        _maxScale = 2.0;
        
        [self setUpSubviewsFrames];
        [self setUpSubviews];
        [self setupGestures];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!CGRectEqualToRect(_contentFrame, CGRectZero)) return;
    _contentFrame = self.frame;
    self.frame = [self resetFrameWithOrigin:_contentFrame];
    [self setUpSubviewsFrames];
}

- (UIImageView *)resizeControl
{
    if (!_resizeControl) {
        _resizeControl = [[UIImageView alloc] init];
        _resizeControl.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _resizeControl;
}

- (UIImageView *)leftTopControl
{
    if (!_leftTopControl) {
        _leftTopControl = [[UIImageView alloc] init];
        _leftTopControl.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _leftTopControl;
}

- (UIImageView *)rightTopControl
{
    if (!_rightTopControl) {
        _rightTopControl = [[UIImageView alloc] init];
        _rightTopControl.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _rightTopControl;
}

- (UIImageView *)leftBottomControl
{
    if (!_leftBottomControl) {
        _leftBottomControl = [[UIImageView alloc] init];
        _leftBottomControl.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _leftBottomControl;
}

- (CAShapeLayer *)shapeLayer
{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = UIColor.clearColor.CGColor;
        _shapeLayer.lineJoin = kCALineJoinBevel;
        _shapeLayer.strokeColor = _borderColor.CGColor;
        _shapeLayer.lineWidth = _borderWidth;
        
        // 锯齿效果
        _shapeLayer.allowsEdgeAntialiasing = YES;
        _shapeLayer.lineDashPattern = @[@(5),@(3)];
    }
    
    return _shapeLayer;
}

- (UIRotationGestureRecognizer *)rotateGesture
{
    if (!_rotateGesture) {
        _rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRotation:)];
        _rotateGesture.delegate = self;
    }
    
    return _rotateGesture;
}

- (UIPinchGestureRecognizer *)pinGesture
{
    if (!_pinGesture) {
        _pinGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePin:)];
        _pinGesture.delegate = self;
    }
    
    return _pinGesture;
}

- (UIPanGestureRecognizer *)panGesture
{
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gesturePan:)];
        _panGesture.minimumNumberOfTouches = 1;
        _panGesture.maximumNumberOfTouches = 2;
        _panGesture.delegate = self;
    }
    
    return _panGesture;
}

- (UITapGestureRecognizer *)tapRecognizer1
{
    if (!_tapRecognizer1) {
        _tapRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap:)];
        _tapRecognizer1.numberOfTapsRequired = 1;
        _tapRecognizer1.delegate = self;
    }
    
    return _tapRecognizer1;
}

- (UITapGestureRecognizer *)tapRecognizer2
{
    if (!_tapRecognizer2) {
        _tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap:)];
        _tapRecognizer2.numberOfTapsRequired = 1;
        _tapRecognizer2.delegate = self;
    }
    
    return _tapRecognizer2;
}

- (UITapGestureRecognizer *)tapRecognizer3
{
    if (!_tapRecognizer3) {
        _tapRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap:)];
        _tapRecognizer3.numberOfTapsRequired = 1;
        _tapRecognizer3.delegate = self;
    }
    
    return _tapRecognizer3;
}

- (UITapGestureRecognizer *)tapRecognizer4
{
    if (!_tapRecognizer4) {
        _tapRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap:)];
        _tapRecognizer4.numberOfTapsRequired = 1;
        _tapRecognizer4.delegate = self;
    }
    
    return _tapRecognizer4;
}


- (WKCStickerGestureRecognizer *)stickerGesture
{
    if (!_stickerGesture) {
        _stickerGesture = [[WKCStickerGestureRecognizer alloc] initWithTarget:self action:@selector(gestureSingleHandAction:) anchorView:self.contentView];
    }

    return _stickerGesture;
}


- (CGRect)resetFrameWithOrigin:(CGRect)origin
{
    return CGRectMake(origin.origin.x - _controlSize.width / 2.0,
                      origin.origin.y - _controlSize.height / 2.0,
                      origin.size.width + _controlSize.width,
                      origin.size.height + _controlSize.height);
}

- (void)setUpSubviewsFrames
{
    self.contentView.frame = CGRectMake(self.controlSize.width / 2.0, self.controlSize.height / 2.0, self.frame.size.width, self.frame.size.height);
    self.resizeControl.frame = CGRectMake(CGRectGetMaxX(self.contentView.frame) - self.controlSize.width / 2.0, CGRectGetMaxY(self.contentView.frame) - self.controlSize.height / 2.0, self.controlSize.width, self.controlSize.height);
    self.leftTopControl.frame = CGRectMake(0, 0, self.controlSize.width, self.controlSize.height);
    self.rightTopControl.frame = CGRectMake(CGRectGetMaxX(self.contentView.frame) - self.controlSize.width / 2.0, 0, self.controlSize.width, self.controlSize.height);
    self.leftBottomControl.frame = CGRectMake(0, CGRectGetMaxY(self.contentView.frame) - self.controlSize.height / 2.0, self.controlSize.width, self.controlSize.height);
    
    [self drawShapeLayerAtFrame:self.contentView.bounds];
}

- (void)setUpSubviews
{
    [self addSubview:self.contentView];
    [self.contentView.layer addSublayer:self.shapeLayer];
    [self addSubview:self.resizeControl];
    [self addSubview:self.leftTopControl];
    [self addSubview:self.rightTopControl];
    [self addSubview:self.leftBottomControl];
}

- (void)setupGestures
{
    [self.leftTopControl addGestureRecognizer:self.tapRecognizer1];
    [self.rightTopControl addGestureRecognizer:self.tapRecognizer2];
    [self.leftBottomControl addGestureRecognizer:self.tapRecognizer3];
    [self.contentView addGestureRecognizer:self.rotateGesture];
    [self.contentView addGestureRecognizer:self.pinGesture];
    [self.contentView addGestureRecognizer:self.panGesture];
    [self.contentView addGestureRecognizer:self.tapRecognizer4];
    [self.resizeControl addGestureRecognizer:self.stickerGesture];
}

- (void)drawShapeLayerAtFrame:(CGRect)frame
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, frame);
    [self.shapeLayer setPath:path];
    CGPathRelease(path);
}

- (void)handleTapContentView
{
    if (!self.notTapBringToFront) {
        [self.superview bringSubviewToFront:self];
    }
    
    self.isActivity = YES;
    
    if (self.shouldAnimation) {
        [self performShakeAnimation:self];
    }
}

- (void)performShakeAnimation:(UIView *)targetView
{
    [targetView.layer removeAnimationForKey:@"anim"];
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5f;
    animation.values = @[[NSValue valueWithCATransform3D:targetView.layer.transform],
                         [NSValue valueWithCATransform3D:CATransform3DScale(targetView.layer.transform, 1.05, 1.05, 1.0)],
                         [NSValue valueWithCATransform3D:CATransform3DScale(targetView.layer.transform, 0.95, 0.95, 1.0)],
                         [NSValue valueWithCATransform3D:targetView.layer.transform]
                         ];
    animation.removedOnCompletion = YES;
    [targetView.layer addAnimation:animation forKey:@"anim"];
}

- (void)relocalControlView
{
    CGPoint originalCenter = CGPointApplyAffineTransform(self.contentView.center, CGAffineTransformInvert(self.contentView.transform));
    
    CGFloat maxX = originalCenter.x + self.contentView.bounds.size.width / 2.0;
    CGFloat maxY = originalCenter.y + self.contentView.bounds.size.height / 2.0;
    CGFloat minX = originalCenter.x - self.contentView.bounds.size.width / 2.0;
    CGFloat minY = originalCenter.y - self.contentView.bounds.size.height / 2.0;
    
    self.resizeControl.center = CGPointApplyAffineTransform(CGPointMake(maxX, maxY), self.contentView.transform);
    self.leftTopControl.center = CGPointApplyAffineTransform(CGPointMake(minX, minY), self.contentView.transform);
    self.rightTopControl.center = CGPointApplyAffineTransform(CGPointMake(maxX, minY), self.contentView.transform);
    self.leftBottomControl.center = CGPointApplyAffineTransform(CGPointMake(minX, maxY), self.contentView.transform);
}

- (void)scaleLimit:(CGFloat)scale
{
    CGFloat currentScale = [[self.contentView.layer valueForKeyPath:@"transform.scale"] floatValue];
    
    if (scale * currentScale <= self.minScale) {
        scale = self.minScale / currentScale;
    } else if (scale * currentScale >= self.maxScale) {
        scale = self.maxScale / currentScale;
    }
}

- (void)deleteFromSuperView
{
    [self removeFromSuperview];
}

#pragma marl -Gestures
- (void)gestureRotation:(UIRotationGestureRecognizer *)sender
{
    self.contentView.transform = CGAffineTransformRotate(self.contentView.transform, sender.rotation);
    sender.rotation = 0;
    
    [self relocalControlView];
}

- (void)gesturePin:(UIPinchGestureRecognizer *)sender
{
    [self scaleLimit:sender.scale];
    
    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, sender.scale, sender.scale);
    sender.scale = 1;
    
    [self relocalControlView];
}

- (void)gesturePan:(UIPanGestureRecognizer *)sender
{
    CGPoint translation = [sender translationInView:[self superview]];
    
    CGPoint targetPoint = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
    targetPoint.x = MAX(0, targetPoint.x);
    targetPoint.y = MAX(0, targetPoint.y);
    targetPoint.x = MIN(self.superview.bounds.size.width, targetPoint.x);
    targetPoint.y = MIN(self.superview.bounds.size.height, targetPoint.y);
    
    [self setCenter:targetPoint];
    [sender setTranslation:CGPointZero inView:[self superview]];
}

- (void)gestureTap:(UITapGestureRecognizer *)sender
{
    
    if (sender.view == self.contentView) {
        
        [self handleTapContentView];
        
    } else if (sender.view == self.leftTopControl) {

    } else if (sender.view == self.rightTopControl) {
        
    } else if (sender.view == self.leftBottomControl) {
        
    }
}

- (void)gestureSingleHandAction:(WKCStickerGestureRecognizer *)sender
{
    [self scaleLimit:sender.scale];
    
    self.contentView.transform = CGAffineTransformScale(self.contentView.transform, sender.scale, sender.scale);
    self.contentView.transform = CGAffineTransformRotate(self.contentView.transform, sender.rotation);
    [sender reset];
    
    [self relocalControlView];
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) ? NO : YES;
}

#pragma mark - HitTest
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden || !self.userInteractionEnabled || self.alpha < 0.01) {
        return nil;
    }
    
    if (self.isActivity) {
        if ([self.resizeControl pointInside:[self convertPoint:point toView:self.resizeControl] withEvent:event]) {
            return self.resizeControl;
        }
        
        if ([self.leftTopControl pointInside:[self convertPoint:point toView:self.leftTopControl] withEvent:event]) {
            return self.leftTopControl;
        }
        
        if ([self.rightTopControl pointInside:[self convertPoint:point toView:self.rightTopControl] withEvent:event]) {
            return self.rightTopControl;
        }
        
        if ([self.leftBottomControl pointInside:[self convertPoint:point toView:self.leftBottomControl] withEvent:event]) {
            return self.leftBottomControl;
        }
    }
    
    if ([_contentView pointInside:[self convertPoint:point toView:_contentView] withEvent:event]) {
        return _contentView;
    }
    
    return nil;
}

#pragma mark -Setter
- (void)setRorationImage:(UIImage *)rorationImage
{
    _rorationImage = rorationImage;
    _resizeControl.image = rorationImage;
}

- (void)setLeftTopImage:(UIImage *)leftTopImage
{
    _leftTopImage = leftTopImage;
    _leftTopControl.image = leftTopImage;
}

- (void)setLeftBottomImage:(UIImage *)leftBottomImage
{
    _leftBottomImage = leftBottomImage;
    _leftBottomControl.image = leftBottomImage;
}

- (void)setRightTopImage:(UIImage *)rightTopImage
{
    _rightTopImage = rightTopImage;
    _rightTopControl.image = rightTopImage;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    _shapeLayer.strokeColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    _shapeLayer.lineWidth = borderWidth;
}

- (void)setShouldShowBorder:(BOOL)shouldShowBorder
{
    _shouldShowBorder = shouldShowBorder;
    _shapeLayer.hidden = !shouldShowBorder;
}

- (void)setShouldBorderAntialias:(BOOL)shouldBorderAntialias
{
    _shouldBorderAntialias = shouldBorderAntialias;
    
    if (shouldBorderAntialias) {
        self.shapeLayer.allowsEdgeAntialiasing = YES;
        self.shapeLayer.lineDashPattern = @[@(5),@(3)];
    } else {
        self.shapeLayer.allowsEdgeAntialiasing = NO;
        self.shapeLayer.lineDashPattern = nil;
    }
}

- (void)setIsActivity:(BOOL)isActivity
{
    _isActivity = isActivity;
    
    _leftTopControl.hidden = !isActivity;
    _resizeControl.hidden = !isActivity;
    _rightTopControl.hidden = !isActivity;
    _leftBottomControl.hidden = !isActivity;
    if (_shouldShowBorder) {
        _shapeLayer.hidden = !isActivity;
    }
}

- (void)setControlSize:(CGSize)controlSize
{
    _controlSize = controlSize;
    self.frame = [self resetFrameWithOrigin:_contentFrame];
    [self setUpSubviewsFrames];
}





@end
