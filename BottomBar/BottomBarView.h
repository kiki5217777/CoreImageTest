//
//  BottomBarView.h
//  K1999
//
//  Created by 林義翔 on 12/11/1.
//  Copyright (c) 2012年 林義翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomBarDelegate <NSObject>
-(void) readytoDial:(id)object;
//-(void) checkCameraPressed:(id)object;
//-(void) checkCameraAlubmPressed:(id)object;
- (void)checkTakePhotoPressed:(id)object;
-(void) checkSettingPressed:(id)object;
-(void) checkMapPressed:(id)object;
@end

@interface BottomBarView : UIView <UIActionSheetDelegate>

@property (unsafe_unretained) id<BottomBarDelegate>bDelegate;

- (IBAction)openCall:(id)sender;
- (IBAction)openCamera:(id)sender;
- (IBAction)openSetting:(id)sender;
- (IBAction)openMap:(id)sender;
@end
