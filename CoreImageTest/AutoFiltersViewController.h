//
//  AutoFiltersViewController.h
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/19.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFilters.h"

@interface AutoFiltersViewController : UIViewController{
    UIImageView *ImageView;
    ImageFilters *autoenhancemanager;
    UIImage *originImage;
    UIImage *outImage;
}
- (IBAction)autofiltersBtn:(id)sender;
- (IBAction)changeAutoFilters:(id)sender;

@end
