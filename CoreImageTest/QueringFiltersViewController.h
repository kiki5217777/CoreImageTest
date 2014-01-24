//
//  QueringFiltersViewController.h
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/20.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFilters.h"

@interface QueringFiltersViewController : UIViewController<UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{
    ImageFilters *queringFiltersManager;
    UIImageView *ImageView, *outImageView;;
    UIImage *originImage;
    
    UIActionSheet *actionSheet;
    NSInteger select_tag;
    NSArray *filterNames;
}
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
- (IBAction)filterTest:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *inputKey1;
@property (strong, nonatomic) IBOutlet UILabel *inputKey2;
@property (strong, nonatomic) IBOutlet UILabel *inputKey3;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UISlider *slider2;
@property (strong, nonatomic) IBOutlet UISlider *slider3;
@property (strong, nonatomic) IBOutlet UILabel *redColorLabel;
@property (strong, nonatomic) IBOutlet UILabel *greenColorLabel;
@property (strong, nonatomic) IBOutlet UILabel *blueColorLabel;
@property (strong, nonatomic) IBOutlet UILabel *alphaLabel;

- (IBAction)sliderValue:(id)sender;
@end
