//
//  MVRottenLoadData.h
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/12/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MVRottenLoadData <NSObject>
@required
- (void)operation:(RKObjectRequestOperation*)operation didCompleteWithData:(RKMappingResult*)data;

@optional
- (void)operation:(RKObjectRequestOperation*)operation didFailWithError:(NSError*)error;
@end

