//
//  FakeNavigationBar.m
//  K1999
//
//  Created by 林義翔 on 12/11/10.
//  Copyright (c) 2012年 Stark Info Co., Ltd. All rights reserved.
//

#import "FakeNavigationBar.h"

@interface FakeNavigationBar()
@property NSArray* titleImageArray;
@end

@implementation FakeNavigationBar

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setAlpha:0];
        [self setupTitleImageArray];
    }
    return self;
}

- (void)setupTitleImageArray
{
    self.titleImageArray = [NSArray arrayWithObjects:
                            @"iphone_title_mail.png", @"iphone_title_report.png", @"iphone_title_news.png",
                            @"iphone_title_faq.png", @"iphone_title_towaway.png", @"iphone_title_disaster.png",
                            @"iphone_title_map.png", @"iphone_title_mailtomayor.png", @"iphone_title_mailreply.png",
                            @"iphone_title_workingreport.png", @"iphone_title_parkinginfo.png", @"iphone_title_parking_fee.png",
                            @"iphone_title_rule.png", @"iphone_title_towed.png", @"iphone_title_traffic",
                            @"iphone_title_krt", @"iphone_title_busstation", @"iphone_title_busrouteinfo",
                            @"iphone_title_bike", @"iphone_title_bikelist", @"iphone_title_event", nil];
}

-(void) setBarHidden
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:0];
    }];
}

-(void) setBarVisiable
{
    [UIView animateWithDuration:0.3 animations:^{
        [self setAlpha:1];
    }];
}

- (IBAction)homePressed:(id)sender{
    if (self.fDelegate && [self.fDelegate respondsToSelector:@selector(backToMainMenu:tag:)]) {
        [self.fDelegate backToMainMenu:self tag:self.tag];
    }
}

- (IBAction)backPressed:(id)sender{
    if (self.fDelegate && [self.fDelegate respondsToSelector:@selector(backPreView:tag:)]) {
        [self.fDelegate backPreView:self tag:self.tag];
    }
}

-(void)changeTitle:(int)tag
{
    if (tag > 0) {
        self.titleImage.image = [UIImage imageNamed:[self.titleImageArray objectAtIndex:tag-1]];
    }
}

@end
