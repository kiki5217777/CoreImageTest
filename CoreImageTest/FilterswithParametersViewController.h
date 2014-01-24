//
//  FilterswithParametersViewController.h
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/21.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterswithParametersViewController : UIViewController{
    UIImage *originImage;
    UIImageView *imageView;
    NSString *filter_name;
}
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UISlider *slider2;
@property (strong, nonatomic) IBOutlet UISlider *slider3;
- (IBAction)changeValue:(id)sender;
- (IBAction)changeValue2:(id)sender;
- (IBAction)changeValue3:(id)sender;

@end
