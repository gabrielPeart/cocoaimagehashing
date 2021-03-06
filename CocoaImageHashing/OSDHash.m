//
//  OSDHash.m
//  CocoaImageHashing
//
//  Created by Andreas Meingast on 10/10/15.
//  Copyright © 2015 Andreas Meingast. All rights reserved.
//

#import "OSCategories.h"
#import "OSFastGraphics.h"
#import "OSDHash.h"

static const NSUInteger OSDHashImageWidthInPixels = 9;
static const NSUInteger OSDHashImageHeightInPixels = 9;
static const OSHashDistanceType OSDHashDistanceThreshold = 9;

@implementation OSDHash

#pragma mark - OSImageHashing Protocol

- (OSHashType)hashImageData:(NSData *)imageData
{
    NSAssert(imageData, @"Image data must not be null");
    unsigned char *pixels = [imageData RGBABitmapDataForResizedImageWithWidth:OSDHashImageWidthInPixels
                                                                    andHeight:OSDHashImageHeightInPixels];
    OSHashType result = dhash_rgba_9_9(pixels);
    return result;
}

- (OSHashDistanceType)hashDistanceSimilarityThreshold
{
    return OSDHashDistanceThreshold;
}

@end
