//
//  StarView.h
//  AnimatedStar
//
//  Created by Andrew B on 28.08.15.
//  Copyright (c) 2015 Ucerxxx. All rights reserved.
//

#import <UIKit/UIKit.h>

// Define colors here:
#define STAR_SELECTED_COLOR [UIColor colorWithRed: 1 green: 0.831 blue: 0 alpha: 1];
#define STAR_UNSELECTED_COLOR [UIColor lightGrayColor];
#define STAR_UNDERLAYER_COLOR [UIColor blackColor];
#define SHADOW_COLOR [UIColor colorWithRed: 0 green: 0.1 blue: 0.412 alpha: 0.4]
#define MINUS_COLOR  [UIColor colorWithRed: 0.7 green: 0.05 blue: 0.02 alpha: 1];

// Define behavior
#define ANIMATION_DURATION 2;
#define ANIMATION_REPEAT_COUNT 15;

// Define star lines width
#define BOTTOM_PATH_LINE_WIDTH_RATIO 0.08;
#define TOP_PATH_LINE_WIDTH_RATIO 0.07;

// Define views state constants
typedef enum StarState {
    kStarUnselected,
    kStarSelected,
    kStarAnimated
} StarState;

@interface StarView : UIView

@property (nonatomic) int starState;

@end
