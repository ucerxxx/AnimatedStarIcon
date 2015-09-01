//
//  StarView.m
//  AnimatedStar
//
//  Created by Andrew B on 28.08.15.
//  Copyright (c) 2015 Ucerxxx. All rights reserved.
//

#import "StarView.h"

@implementation StarView {
    
    CAShapeLayer *animationLayer;
    
    UIBezierPath *starPath;
    UIBezierPath *plusPath;
    UIBezierPath *minusPath;
    
    CGFloat bottomPathLineWidth;
    CGFloat topPathLineWidth;
}

- (void)setStarState:(int)starState {
    _starState = starState;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self configureSelf];
    
    return self;
}

- (void)configureSelf {
    // Prepare data for drawing
    CGFloat size = MIN(self.frame.size.width, self.frame.size.height) * 0.8;

    // Points for starPath (UIBezierPath)
    CGPoint p1 = CGPointMake(size * 0.49, size * 0.81);
    CGPoint p2 = CGPointMake(size * 0.22, size * 0.96);
    CGPoint p3 = CGPointMake(size * 0.30, size * 0.62);
    CGPoint p4 = CGPointMake(size * 0.04, size * 0.39);
    CGPoint p5 = CGPointMake(size * 0.38, size * 0.38);
    CGPoint p6 = CGPointMake(size * 0.52, size * 0.04);
    CGPoint p7 = CGPointMake(size * 0.65, size * 0.38);
    CGPoint p8 = CGPointMake(size * 1.00, size * 0.39);
    CGPoint p9 = CGPointMake(size * 0.81, size * 0.56);
    
    // Path for drawing star
    starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint:p1];
    [starPath addLineToPoint:p2];
    [starPath addLineToPoint:p3];
    [starPath addLineToPoint:p4];
    [starPath addLineToPoint:p5];
    [starPath addLineToPoint:p6];
    [starPath addLineToPoint:p7];
    [starPath addLineToPoint:p8];
    [starPath addLineToPoint:p9];
    
    // Path properties
    starPath.lineCapStyle = kCGLineCapRound;
    starPath.lineJoinStyle = kCGLineJoinRound;
    
    // Points for plus
    CGPoint p11 = CGPointMake(size * 0.73, size * 0.61);
    CGPoint p12 = CGPointMake(size * 0.89, size * 0.77);
    CGPoint p13 = CGPointMake(size * 0.73, size * 0.93);
    CGPoint p14 = CGPointMake(size * 0.57, size * 0.77);
    
    // Path for drawing plus
    plusPath = [UIBezierPath bezierPath];
    [plusPath moveToPoint:p11];
    [plusPath addLineToPoint:p13];
    [plusPath moveToPoint:p12];
    [plusPath addLineToPoint:p14];
    
    plusPath.lineCapStyle = kCGLineCapRound;
    plusPath.lineJoinStyle = kCGLineJoinRound;
    
    // Points for drawing minus
    CGPoint p21 = CGPointMake(size * 0.91, size * 0.72);
    CGPoint p22 = CGPointMake(size * 0.59, size * 0.72);
    
    // Minus path
    minusPath = [UIBezierPath bezierPath];
    [minusPath moveToPoint:p21];
    [minusPath addLineToPoint:p22];
    
    minusPath.lineCapStyle = kCGLineCapRound;
    minusPath.lineJoinStyle = kCGLineJoinRound;
    
    bottomPathLineWidth = size * BOTTOM_PATH_LINE_WIDTH_RATIO;
    topPathLineWidth = size * TOP_PATH_LINE_WIDTH_RATIO;
}


- (void) drawRect: (CGRect)rect {
    
    if (!starPath) {
        [self configureSelf];
    }
    
    if (animationLayer) {
        [animationLayer removeFromSuperlayer];
    }
    
    _starState = _starState % 3;
    
    switch (_starState) {
        case kStarUnselected:
            [self drawUnselected: rect];
            break;
        
        case kStarSelected:
            [self drawSelected: rect];
            break;
            
        case kStarAnimated:
            [self drawAnimated: rect];
            break;
            
        default:
            NSLog(@"Unknown state setted to [StarView starState]");
            break;
    }
    
}

- (void)drawUnselected: (CGRect)rect {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, rect);
    
    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: SHADOW_COLOR];
    [shadow setShadowOffset: CGSizeMake(3.1, 3.1)];
    [shadow setShadowBlurRadius: 5];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
    
    // Drawing black layer
    UIColor *underlayerColor = STAR_UNDERLAYER_COLOR;
    [underlayerColor setStroke];
    // star
    starPath.lineWidth = bottomPathLineWidth;
    [starPath stroke];
    // minus
    plusPath.lineWidth = bottomPathLineWidth;
    [plusPath stroke];
    
    // Drawing with selected-state color
    UIColor *starUnselectedColor = STAR_UNSELECTED_COLOR;
    [starUnselectedColor setStroke];
    starPath.lineWidth = topPathLineWidth;
    [starPath stroke];
    
    UIColor *starSelectedColor = STAR_SELECTED_COLOR;
    [starSelectedColor setStroke];
    plusPath.lineWidth = topPathLineWidth;
    [plusPath stroke];
    
    CGContextRestoreGState(context);
}

- (void)drawSelected: (CGRect)rect {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, rect);
    
    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: SHADOW_COLOR];
    [shadow setShadowOffset: CGSizeMake(3.1, 3.1)];
    [shadow setShadowBlurRadius: 5];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
    
    // Drawing black layer
    UIColor *underlayerColor = STAR_UNDERLAYER_COLOR;
    [underlayerColor setStroke];
    // star
    starPath.lineWidth = bottomPathLineWidth;
    [starPath stroke];
    // minus
    minusPath.lineWidth = bottomPathLineWidth;
    [minusPath stroke];
    
    // Drawing with selected-state color
    // Star
    UIColor *starSelectedColor = STAR_SELECTED_COLOR;
    [starSelectedColor setStroke];
    starPath.lineWidth = topPathLineWidth;
    [starPath stroke];
    // minus
    UIColor *minusColor = MINUS_COLOR;
    [minusColor setStroke];
    minusPath.lineWidth = topPathLineWidth;
    [minusPath stroke];
    
    CGContextRestoreGState(context);
}

- (void)drawAnimated: (CGRect)rect {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, rect);
    
    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: SHADOW_COLOR];
    [shadow setShadowOffset: CGSizeMake(3.1, 3.1)];
    [shadow setShadowBlurRadius: 5];
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
   
    // Drawing black layer
    UIColor *underlayerColor = STAR_UNDERLAYER_COLOR;
    [underlayerColor setStroke];
    // star
    starPath.lineWidth = bottomPathLineWidth;
    [starPath stroke];
    // minus
    minusPath.lineWidth = bottomPathLineWidth;
    [minusPath stroke];
    
    // Drawing with selected-state color
    // star
    UIColor *starUnselectedColor = STAR_UNSELECTED_COLOR;
    [starUnselectedColor setStroke];
    starPath.lineWidth = topPathLineWidth;
    [starPath stroke];
    // minus
    UIColor *minusColor = MINUS_COLOR;
    [minusColor setStroke];
    minusPath.lineWidth = topPathLineWidth;
    [minusPath stroke];
    
    // Star
    UIColor *starSelectedColor = STAR_SELECTED_COLOR;
    [starSelectedColor setStroke];
    starPath.lineWidth = topPathLineWidth;

    // performing animation
    animationLayer = [[CAShapeLayer alloc] init];
    animationLayer.fillColor = [UIColor clearColor].CGColor;
    animationLayer.strokeColor = starSelectedColor.CGColor;
    animationLayer.lineWidth = topPathLineWidth;
    animationLayer.path = starPath.CGPath;
    animationLayer.lineCap = @"round";
    animationLayer.lineJoin = @"round";
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:NSStringFromSelector(@selector(strokeEnd))];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = ANIMATION_DURATION;
    animation.repeatCount = ANIMATION_REPEAT_COUNT;
    [animationLayer addAnimation:animation forKey:NSStringFromSelector(@selector(strokeEnd))];
    
    [self.layer addSublayer:animationLayer];

    CGContextRestoreGState(context);
}


@end
