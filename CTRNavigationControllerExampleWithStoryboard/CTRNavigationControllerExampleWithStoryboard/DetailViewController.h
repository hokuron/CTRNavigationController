//
//  DetailViewController.h
//  CTRNavigationControllerExampleWithStoryboard
//
//  Created by hokuron on 2013/01/24.
//  Copyright (c) 2013年 Takuma Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
