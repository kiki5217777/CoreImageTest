//
//  ViewController.h
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/19.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceDetectionViewController.h"
#import "AutoFiltersViewController.h"
#import "QueringFiltersViewController.h"
#import "FilterswithParametersViewController.h"

@interface ViewController : UIViewController{
    FaceDetectionViewController *fdVC;
    AutoFiltersViewController *afVC;
    QueringFiltersViewController *qfVC;
    FilterswithParametersViewController *fparamVC;
}

- (IBAction)facedetectBtn:(id)sender;
- (IBAction)autofiltersBtn:(id)sender;
- (IBAction)queringfiltersBtn:(id)sender;
- (IBAction)filterswithparametersBtn:(id)sender;
@end
