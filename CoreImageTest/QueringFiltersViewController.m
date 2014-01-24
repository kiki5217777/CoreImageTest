//
//  QueringFiltersViewController.m
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/20.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import "QueringFiltersViewController.h"

@interface QueringFiltersViewController ()

@end

@implementation QueringFiltersViewController

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
    // Do any additional setup after loading the view from its nib.
//    if (queringFiltersManager ==nil) {
//        queringFiltersManager = [ImageFilters sharedInstance];
//    }
    originImage = [UIImage imageNamed:@"images1.jpeg"];
    ImageView = [[UIImageView alloc]initWithImage:originImage];
//    [ImageView setFrame:CGRectMake(0, 0, originImage.size.width *0.6, originImage.size.height *0.6)];
    if (originImage.size.width>[[UIScreen mainScreen] bounds].size.width || originImage.size.height > [[UIScreen mainScreen]bounds].size.height/2 -35) {
        [ImageView setFrame:CGRectMake(0, 0, originImage.size.width *0.5, originImage.size.height *0.5)];
    }
    [self.view addSubview:ImageView];
    outImageView = [[UIImageView alloc]init];
    [outImageView setFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height/2-80, originImage.size.width, originImage.size.height)];
//    [outImageView setFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2, 0, originImage.size.width *0.6, originImage.size.height *0.6)];
//    [self.view addSubview:outImageView];
    
//    NSMutableArray *filterNames = [NSMutableArray array];
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryGeometryAdjustment]];
//    [[ImageFilters sharedInstance] buildFilterDictionary:filterNames];
    
    NSLog(@"details%@\n",[[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIHighlightShadowAdjust"]);
    NSLog(@"details%@\n",[[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIGammaAdjust"]);
    NSLog(@"details%@\n",[[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIExposureAdjust"]);
    NSLog(@"details%@\n",[[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIColorControls"]);
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIColorInvert"];
    
    NSLog(@"details%@\n", [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIColorPosterize"]);
    NSLog(@"details%@\n", [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIFalseColor"]);
    
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectChrome"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectFade"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectInstant"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectMono"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectNoir"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectProcess"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectTonal"];
    [[ImageFilters sharedInstance] buildFilterAttributesInputKey:@"CIPhotoEffectTransfer"];
    
    
    filterNames = [NSArray arrayWithObjects:@"CIHighlightShadowAdjust",@"CIGammaAdjust",@"CIExposureAdjust",@"CIColorControls",@"CIColorInvert",@"CIColorPosterize",@"CIFalseColor",@"CIPhotoEffectChrome",@"CIPhotoEffectFade",@"CIPhotoEffectInstant",@"CIPhotoEffectMono",@"CIPhotoEffectNoir",@"CIPhotoEffectProcess",@"CIPhotoEffectTonal",@"CIPhotoEffectTransfer", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)filterTest:(id)sender {

    [self creatActionSheet];
}

- (IBAction)sliderValue3:(id)sender {
}


- (IBAction)sliderValue2:(id)sender {
}

- (IBAction)sliderValue:(id)sender {
}

-(void)creatActionSheet{
    actionSheet = [[UIActionSheet alloc]initWithTitle:@"Filters" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    [actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    actionSheet.backgroundColor = [UIColor blackColor];
    
    UIPickerView *picker =[[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, 320, 100)];
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    [picker setBackgroundColor:[UIColor clearColor]];
    
    [actionSheet addSubview:picker];
    
    UISegmentedControl *closeButton = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObject:NSLocalizedString(@"ok", @"") ]];
    closeButton.momentary = YES;
    closeButton.frame = CGRectMake(260, 7, 50, 30);
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismissCurrentActionSheet:) forControlEvents:UIControlEventValueChanged];
    [actionSheet addSubview:closeButton];
    
    UISegmentedControl *cancelButton = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObject:NSLocalizedString(@"cancel", @"")]];
    cancelButton.momentary = YES;
    cancelButton.frame = CGRectMake(200, 7, 50, 30);
    cancelButton.tintColor = [UIColor blackColor];
    [cancelButton addTarget:self action:@selector(cancelCurrentActionSheet:) forControlEvents:UIControlEventValueChanged];
//    [actionSheet addSubview:cancelButton];
    
    [actionSheet showInView:self.navigationController.view];
    [actionSheet setBounds:CGRectMake(0, 0, 320, 400)];
}
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return filterNames.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [filterNames objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    select_tag = row;
}

-(void)dismissCurrentActionSheet:(id)sender{
    [actionSheet dismissWithClickedButtonIndex:((UISegmentedControl*)sender).selectedSegmentIndex animated:YES];
    actionSheet =nil;
//    NSLog(@"queringFiltersManager QueringFiltersName %@",[[queringFiltersManager QueringFiltersName] objectAtIndex:select_tag]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *outImage = nil;
//        queringFiltersManager = nil;
        outImage = [[ImageFilters sharedInstance]  QueringFilters:originImage filtername:[[[ImageFilters sharedInstance] QueringFiltersName] objectAtIndex:select_tag]];
        dispatch_async(dispatch_get_main_queue(), ^{
//            [outImageView removeFromSuperview];
//            [self.view addSubview:outImageView];
            ImageView.image=nil;
            [ImageView setImage:outImage];
            
                    });
    });
}
-(void)cancelCurrentActionSheet:(id)sender{
    [actionSheet dismissWithClickedButtonIndex:((UISegmentedControl*)sender).selectedSegmentIndex animated:YES];
    actionSheet =nil;
    [outImageView removeFromSuperview];
    outImageView = nil;
}

-(void)imagefilter:(NSString*)filterName inputKey:(NSString*)key slidermin:(float)min slidermax:(float)max sliderValue:(float)value
{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:originImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:value] forKey:key];
    
    // 得到过滤后的图片
    CIImage *outputImage = [filter outputImage];
    
    // 转换图片
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];
    // 显示图片
    [ImageView setImage:newImg];
    // 释放C对象
    CGImageRelease(cgimg);
}

@end
