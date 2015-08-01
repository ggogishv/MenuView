//
//  ViewController.m
//  MenuView
//
//  Created by Giorgi Gogishvili on 7/30/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint startLocation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.contentViewTrailingConstraint) {
        [self.view removeConstraint:self.contentViewTrailingConstraint];
        self.contentViewTrailingConstraint = nil;
        
        float width = self.view.frame.size.width;
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *curTouch = [touches anyObject];
    startLocation = [curTouch locationInView:self.view];
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *curTouch = [touches anyObject];
    CGPoint prevLocation = [curTouch previousLocationInView:self.view];
    CGPoint curLocation = [curTouch locationInView:self.view];
    
    float diffX = curLocation.x - prevLocation.x;
    float diffY = curLocation.y - prevLocation.y;
    
    if ( fabs(startLocation.x - curLocation.x) > 5 && fabs(diffX) > fabs(diffY)) {
        
        float newConstant = self.menuViewLeadingConstraint.constant + diffX;
        
        if (newConstant < -280.0f) {
            newConstant = -280;
        }
        
        if (newConstant > 0) {
            newConstant = 0;
        }
        
        self.menuViewLeadingConstraint.constant = newConstant;
    }
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.menuViewLeadingConstraint.constant < -140) {
        self.menuViewLeadingConstraint.constant = -280;
    }
    else {
        self.menuViewLeadingConstraint.constant = 0;
    }
    
    [UIView animateWithDuration:0.3 animations:^ {
        [self.view layoutIfNeeded];
    }];
    
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

    [self touchesEnded:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
