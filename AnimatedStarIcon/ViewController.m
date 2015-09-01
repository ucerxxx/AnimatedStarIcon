//
//  ViewController.m
//  AnimatedStarIcon
//
//  Created by Andrew B on 01.09.15.
//  Copyright (c) 2015 Andrew B. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    StarView *starView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstView.starState = kStarUnselected;
    
    _secondView.starState = kStarAnimated;
    
    _thirdView.starState = kStarSelected;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onemoreButtonPressed:(id)sender {
    if (!starView) {
        starView = [[StarView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 50, 300, 100, 100)];
        starView.starState = kStarUnselected;
        [self.view addSubview:starView];
    }
    else {
        starView.starState = starView.starState + 1;
        [starView setNeedsDisplay];
    }
    
}

@end
