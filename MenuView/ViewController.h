//
//  ViewController.h
//  MenuView
//
//  Created by Giorgi Gogishvili on 7/30/15.
//  Copyright (c) 2015 Giorgi Gogishvili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIView *contentView;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *menuViewLeadingConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *contentViewTrailingConstraint;

@end

