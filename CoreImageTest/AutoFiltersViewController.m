//
//  AutoFiltersViewController.m
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/19.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import "AutoFiltersViewController.h"

@interface AutoFiltersViewController ()

@end

@implementation AutoFiltersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        self.extendedLayoutIncludesOpaqueBars = YES;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (autoenhancemanager ==nil) {
        autoenhancemanager = [ImageFilters sharedInstance];
    }
   originImage = [UIImage imageNamed:@"RedEye.jpg"];

    ImageView = [[UIImageView alloc]initWithImage:originImage];
    if (originImage.size.width>[[UIScreen mainScreen] bounds].size.width || originImage.size.height > [[UIScreen mainScreen]bounds].size.height/2 -35) {
        [ImageView setFrame:CGRectMake(0, 0, originImage.size.width *0.5, originImage.size.height *0.5)];
    }
    [self.view addSubview:ImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)autofiltersBtn:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        outImage = [autoenhancemanager AutoEnhancementFilters:originImage filterTag:1];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *outImageView = [[UIImageView alloc]initWithImage:outImage];
            [outImageView setFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/2-40, outImage.size.width, outImage.size.height)];
            [self.view addSubview:outImageView];
        });
    });
    
    
}

- (IBAction)changeAutoFilters:(id)sender {
    int filter_tag = 0;
    switch ([sender selectedSegmentIndex])
	{
		case 0:
			filter_tag = 0;
			break;
		case 1:
			filter_tag = 1;
			break;
		case 2:
			filter_tag = 2;
			break;
        case 3:
			filter_tag = 3;
			break;
        case 4:
			filter_tag = 4;
			break;
        default:
            break;
	}
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        outImage = [autoenhancemanager AutoEnhancementFilters:originImage filterTag:filter_tag];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *outImageView = [[UIImageView alloc]initWithImage:outImage];
            [outImageView setFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/2-35, outImage.size.width, outImage.size.height)];
            [self.view addSubview:outImageView];
            outImageView = nil;
        });
    });
}

@end
