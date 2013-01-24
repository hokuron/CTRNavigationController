//
//  CTRNavigationController.h
//  CTRScrollViewExample
//
//  Created by hokuron on 2013/01/24.
//  Copyright (c) 2013年 Takuma Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTRNavigationController : UINavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController andScrollView:(UIScrollView *)scrollView;

- (void)layoutShadowWithScrollView:(UIScrollView *)scrollView;

@end
