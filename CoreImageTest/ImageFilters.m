//
//  ImageFilters.m
//  CoreImageTest
//
//  Created by kiki Huang on 13/11/20.
//  Copyright (c) 2013年 kiki Huang. All rights reserved.
//

#import "ImageFilters.h"

static ImageFilters *manager =nil;

@implementation ImageFilters

+(ImageFilters *)sharedInstance{
    
    if (manager == nil) {
        manager = [[self alloc]init];
    }
    return manager;
}

-(NSArray *)FacesDetect:(NSString *)imagename
{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",imagename]];
    CIImage *coreImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
    NSArray *features = [detector featuresInImage:coreImage];
    
    return features;
}

-(UIImage *)AutoEnhancementFilters:(UIImage*)image filterTag:(int)tag
{
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:image.CGImage];
//    NSArray *filters = [ciImage autoAdjustmentFiltersWithOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:kCIImageAutoAdjustFeatures]];
    NSArray *filters = [ciImage autoAdjustmentFilters];
//    NSLog(@"enchance filters%@",filters);
//    for (CIFilter *filter in filters) {
//        NSLog(@"filter%@",filter.name);
//        [filter setValue:ciImage forKey:kCIInputImageKey];
//        ciImage = filter.outputImage;
//    }
//    for (int i=0; i<filters.count; i++) {
    CIFilter *filter = [filters objectAtIndex:tag];
//    NSLog(@"filter name %@",filter.name);
    [filter setValue:ciImage forKey:kCIInputImageKey];
    ciImage = filter.outputImage;
//    }
    CIContext *ctx = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [ctx createCGImage:ciImage fromRect:[ciImage extent]];
    UIImage *result = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return result;
    
}
-(NSArray *)QueringFiltersName{
    
//    NSMutableDictionary *filtersByCategory = [NSMutableDictionary dictionary];
    NSMutableArray *filterNames = [NSMutableArray array];
    
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryDistortionEffect]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryGeometryAdjustment]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryCompositeOperation]];
//
    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryHalftoneEffect]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryColorAdjustment]];
//
    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryColorEffect]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryTransition]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryTileEffect]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryGenerator]];
//
//    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryGradient]];
//
    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryStylize]];
    
//    filtersByCategory[@"Distortion"] = [self buildFilterDictionary: filterNames];
    
//    [filterNames removeAllObjects];
    
    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategorySharpen]];
//
    [filterNames addObjectsFromArray:[CIFilter filterNamesInCategory:kCICategoryBlur]];
    
//    NSLog(@"%@",[self buildFilterDictionary: filterNames]);
    
//    filtersByCategory[@"Focus"] = [self buildFilterDictionary: filterNames];
    
//    NSLog(@"filters name \n%lu",(unsigned long)filterNames.count);
//    NSLog(@"filters name \n%@",filterNames);
//    NSArray *filternames;
//    filternames = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
//    NSLog(@"%@", filternames);
    
//    NSLog(@"%lu",(unsigned long)[filternames count]);
    return filterNames;
    
}

-(NSMutableDictionary *)buildFilterDictionary:(NSArray *)filterClassNames{
   
    NSMutableDictionary *filters = [NSMutableDictionary dictionary];
    for (NSString *className in filterClassNames) {
        CIFilter *filter = [CIFilter filterWithName:className];
        
        if (filter) {
//            NSLog(@"quering filtername %@",filter.name);
            filters[className] = [filter attributes];
        } else {
            NSLog(@"could not create '%@' filter", className);
        }
    }
    return filters;
}

-(NSMutableDictionary *)buildFilterAttributesInputKey:(NSString *)filterNames{
    CIFilter *filter = [CIFilter filterWithName:filterNames];
    NSLog(@"filter name:%@",filter.name);
    for( NSString* inputKey in filter.inputKeys )
    {
        NSDictionary *attribute = filter.attributes[inputKey];
        NSString *inputKeyClassName = attribute[kCIAttributeClass];
        NSLog(@"%@: %@", inputKey, inputKeyClassName);
    }
    
    NSMutableDictionary *filters = [NSMutableDictionary dictionary];
    if (filter) {
        //            NSLog(@"quering filtername %@",filter.name);
        filters[filterNames] = [filter attributes];
    } else {
        NSLog(@"could not create '%@' filter", filterNames);
    }
    return filters;

}

-(UIImage *)QueringFilters :(UIImage*)image filtername:(NSString*)name
{
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:name];
    
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setDefaults];
//    [filter setValue:[NSNumber numberWithFloat:0] forKey:@"inputRadius"];
//    [filter setValue:[NSNumber numberWithFloat:3.0] forKey:@"inputScale"];
    ciImage = filter.outputImage;

    CIContext *ctx = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [ctx createCGImage:ciImage fromRect:[ciImage extent]];
    UIImage *result = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    ciImage = nil;
    filter = nil;
    return result;
    
}

@end
