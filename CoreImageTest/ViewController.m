//
//  ViewController.m
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/19.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facedetectBtn:(id)sender {
    fdVC = [[FaceDetectionViewController alloc]init];
    [fdVC setTitle:@"Face Detection"];
    [self.navigationController pushViewController:fdVC animated:YES];
    
    fdVC =nil;
}

- (IBAction)autofiltersBtn:(id)sender {
    afVC = [[AutoFiltersViewController alloc]initWithNibName:@"AutoFiltersViewController" bundle:nil];
    [afVC setTitle:@"Auto Enhancement Filters"];
    
    UINavigationController *nav = [[UINavigationController alloc]
                                   initWithRootViewController:afVC];
    [self presentViewController:nav animated:YES completion:NULL];
//    [self.navigationController presentViewController:afVC animated:YES completion:nil];
//    [self.navigationController pushViewController:afVC animated:YES];
    
    afVC = nil;
}

- (IBAction)queringfiltersBtn:(id)sender {
    qfVC=[[QueringFiltersViewController alloc]initWithNibName:@"QueringFiltersViewController" bundle:nil];
    [qfVC setTitle:@"Quering System Filters"];
    [self.navigationController pushViewController:qfVC animated:YES];
    
    qfVC = nil;
}

- (IBAction)filterswithparametersBtn:(id)sender {
    fparamVC = [[FilterswithParametersViewController alloc]initWithNibName:@"FilterswithParametersViewController" bundle:nil];
    [fparamVC setTitle:@"Filters with Parameters"];
    [self.navigationController pushViewController:fparamVC animated:YES];
    fparamVC =nil;
}
@end
