//
//  ImageFilters.h
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/20.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFilters : NSObject
+(ImageFilters *)sharedInstance;
-(NSArray *)FacesDetect:(NSString *)imagename;
-(UIImage *)AutoEnhancementFilters:(UIImage*)image filterTag:(int)tag;
-(NSArray *)QueringFiltersName;
-(UIImage *)QueringFilters :(UIImage*)image filtername:(NSString*)name;
-(NSMutableDictionary *)buildFilterDictionary:(NSArray *)filterClassNames;
-(NSMutableDictionary *)buildFilterAttributesInputKey:(NSString *)filterNames;
@end
