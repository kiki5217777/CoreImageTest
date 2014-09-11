//
//  FaceDetectionViewController.m
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/19.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import "FaceDetectionViewController.h"

@interface FaceDetectionViewController (){
    UIView *resultView;
}

@end

@implementation FaceDetectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor whiteColor]];
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (manager ==nil) {
        manager = [ImageFilters sharedInstance];
    }
   [self loadImagetoDetect];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadImagetoDetect
{
  
    UIImageView* image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"steves.jpg"]];
    resultView =[[UIView alloc]initWithFrame:image.frame];
    [resultView addSubview:image];
    
    [self.view addSubview:resultView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *features = [manager FacesDetect:@"steves.jpg"];
         dispatch_async(dispatch_get_main_queue(), ^{
             for(CIFaceFeature* faceFeature in features)
             {
                 
                 UIView* faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
                 faceView.layer.borderWidth = 1;
                 faceView.layer.borderColor = [[UIColor redColor] CGColor];
                 [resultView addSubview:faceView];
                 
             }
             [image setTransform:CGAffineTransformMakeScale(1, -1)];
             [resultView setTransform:CGAffineTransformMakeScale(1, -1)];
         });
    });
    
}

@end
