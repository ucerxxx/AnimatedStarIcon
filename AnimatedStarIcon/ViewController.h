//
//  ViewController.h
//  AnimatedStarIcon
//
//  Created by Andrew B on 01.09.15.
//  Copyright (c) 2015 Andrew B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet StarView *firstView;
@property (strong, nonatomic) IBOutlet StarView *secondView;
@property (strong, nonatomic) IBOutlet StarView *thirdView;

- (IBAction)onemoreButtonPressed:(id)sender;
@end

