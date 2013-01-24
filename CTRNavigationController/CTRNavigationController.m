//
//  CTRNavigationController.m
//  CTRScrollViewExample
//
//  Created by hokuron on 2013/01/24.
//  Copyright (c) 2013年 Takuma Shimizu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CTRNavigationController.h"

@interface CTRNavigationController () <UIScrollViewDelegate> {
    CAGradientLayer *_shadowLayer;
}

@end

@implementation CTRNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController andScrollView:(UIScrollView *)scrollView
{
    self = [super initWithRootViewController:rootViewController];
    
    if ( ! self) return self;
    
    [self layoutShadowWithScrollView:scrollView];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)layoutShadowWithScrollView:(UIScrollView *)scrollView
{
    scrollView.delegate = self;
    [self layoutShadow];
}

- (void)layoutShadow
{
    UINavigationBar *navBar = self.navigationBar;
    
    CAGradientLayer *gradientLayer, *horizontalOverlay;
    gradientLayer = [CAGradientLayer layer];
    horizontalOverlay = [CAGradientLayer layer];
    
    // Shadow gradient from top to bottom.
    gradientLayer.frame  = CGRectMake(0, CGRectGetMaxY(navBar.frame), navBar.bounds.size.width, 4.0f);
    gradientLayer.colors = @[
        (id)[UIColor colorWithWhite:0.000 alpha:0.300].CGColor,
        (id)[UIColor colorWithWhite:0.000 alpha:0.150].CGColor,
        (id)[UIColor colorWithWhite:0.000 alpha:0.075].CGColor,
        (id)[UIColor clearColor].CGColor
    ];
    // Overlay gradient from left to right
    horizontalOverlay.frame  = CGRectMake(0, 0, gradientLayer.bounds.size.width, 4.0f);
    horizontalOverlay.colors = @[
        (id)[UIColor whiteColor].CGColor,
        (id)[UIColor colorWithWhite:1 alpha:0].CGColor,
        (id)[UIColor colorWithWhite:1 alpha:0].CGColor,
        (id)[UIColor whiteColor].CGColor
    ];
    horizontalOverlay.locations  = @[@0, @0.25, @0.75, @1.0];
    horizontalOverlay.startPoint = CGPointMake(0, 0.5f);
    horizontalOverlay.endPoint   = CGPointMake(1.0f, 0.5f);
    
    [gradientLayer addSublayer:horizontalOverlay];
    
    _shadowLayer = gradientLayer;
    _shadowLayer.opacity = 0;
    [navBar.layer.superlayer addSublayer:_shadowLayer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // if "< 5.0f", assign ABS() value.
    CGFloat offsetY = ABS(scrollView.contentOffset.y) < 5.0f ? : 5.0f;
    _shadowLayer.opacity = 1.0f / 5.0f * offsetY;
}

@end
