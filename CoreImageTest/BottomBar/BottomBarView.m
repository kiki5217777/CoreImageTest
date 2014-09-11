//
//  BottomBarView.m
//  K1999
//
//  Created by 林義翔 on 12/11/1.
//  Copyright (c) 2012年 林義翔. All rights reserved.
//

#import "BottomBarView.h"

@implementation BottomBarView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (IBAction)openCall:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    UIAlertView *alert = nil;
    if ([device.model isEqualToString:@"iPhone"]) {
        if (self.bDelegate && [self.bDelegate respondsToSelector:@selector(readytoDial:)]) {
            [self.bDelegate readytoDial:self];
        }
    }else{
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"無法撥號" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)openCamera:(id)sender {
//    UIActionSheet *modeSheet = [[UIActionSheet alloc] initWithTitle:@"選擇相片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍攝相片", @"從相簿選擇", nil];
//    [modeSheet showInView:self];
    if (self.bDelegate && [self.bDelegate respondsToSelector:@selector(checkTakePhotoPressed:)]) {
        [self.bDelegate checkTakePhotoPressed:sender];
    }
}

- (IBAction)openSetting:(id)sender {
    if (self.bDelegate && [self.bDelegate respondsToSelector:@selector(checkSettingPressed:)]) {
        [self.bDelegate checkSettingPressed:self];
    }
}

- (IBAction)openMap:(id)sender {
    if (self.bDelegate && [self.bDelegate respondsToSelector:@selector(checkMapPressed:)]) {
        [self.bDelegate checkMapPressed:sender];
    }
}

//-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0) {
//        if (self.bDelegate && [self.bDelegate respondsToSelector:@selector(checkCameraPressed:)]) {
//            [self.bDelegate checkCameraPressed:self];
//        }
//    }else if(buttonIndex == 1){
//        if (self.bDelegate && [self.bDelegate respondsToSelector:@selector(checkCameraAlubmPressed:)]) {
//            [self.bDelegate checkCameraAlubmPressed:self];
//        }
//    }
//}

@end
