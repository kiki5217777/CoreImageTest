//
//  FakeNavigationBar.h
//  K1999
//
//  Created by 林義翔 on 12/11/10.
//  Copyright (c) 2012年 Stark Info Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FakeBarDelegate <NSObject>
-(void) backPreView:(id)object tag:(int)tag;
-(void) backToMainMenu:(id)object tag:(int)tag;
@end

@interface FakeNavigationBar : UIView

@property (assign, nonatomic) id <FakeBarDelegate> fDelegate;
@property (strong, nonatomic) IBOutlet UIButton *backBTN;
@property (strong, nonatomic) IBOutlet UIButton *homeBTN;
@property (strong, nonatomic) IBOutlet UIImageView *titleImage;
@property (strong, nonatomic) IBOutlet UIButton *kindBTN;

- (IBAction)homePressed:(id)sender;
- (IBAction)backPressed:(id)sender;

-(void) setBarHidden;
-(void) setBarVisiable;
-(void) changeTitle:(int)tag;
@end
