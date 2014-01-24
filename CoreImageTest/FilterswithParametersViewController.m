//
//  FilterswithParametersViewController.m
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/21.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import "FilterswithParametersViewController.h"

@interface FilterswithParametersViewController ()

@end

@implementation FilterswithParametersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    originImage = [UIImage imageNamed:@"images1.jpeg"];
    imageView = [[UIImageView alloc]initWithImage:originImage];
    if (originImage.size.width>[[UIScreen mainScreen] bounds].size.width || originImage.size.height > [[UIScreen mainScreen]bounds].size.height) {
        [imageView setFrame:CGRectMake(0, 0, originImage.size.width *0.9, originImage.size.height *0.9)];
    }
    [self.view addSubview:imageView];
    self.slider.value = 0.0;
    self.slider2.minimumValue = -3.14;
    self.slider2.maximumValue = 3.14;
    self.slider2.value = 0.0;
    self.slider3.minimumValue = -3.14;
    self.slider3.maximumValue = 3.14;
    self.slider3.value = 0.0;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeValue:(id)sender {
    float slideValue=self.slider.value;
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:originImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:slideValue] forKey:@"inputIntensity"];
    ciImage =[filter outputImage];
    CIContext *context=[CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:ciImage fromRect:[ciImage extent]];
    UIImage *result = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    [imageView setImage:result];
    ciImage = nil;
    filter =nil;
    
}

- (IBAction)changeValue2:(id)sender {
    float slideValue=self.slider2.value;
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:originImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIHueAdjust"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:slideValue] forKey:@"inputAngle"];
    ciImage =[filter outputImage];
    CIContext *context=[CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:ciImage fromRect:[ciImage extent]];
    UIImage *result = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    [imageView setImage:result];
    ciImage = nil;
    filter =nil;
}

- (IBAction)changeValue3:(id)sender {
    float slideValue=self.slider3.value;
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:originImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIStraightenFilter"];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:slideValue] forKey:@"inputAngle"];
    ciImage =[filter outputImage];
    CIContext *context=[CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:ciImage fromRect:[ciImage extent]];
    UIImage *result = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    [imageView setImage:result];
    ciImage = nil;
    filter =nil;
}
@end
