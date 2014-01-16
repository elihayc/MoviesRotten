//
//  MVRottenTomatoManager.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVRottenTomatoManager.h"
#import "MVMovie.h"
#import "MVMovieReview.h"
#import "MVMovieClip.h"

@implementation MVRottenTomatoManager
NSString * const ROTTEN_KEY = @"quw9qe488qdhak3dcf64vwkn";
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setupRestKit];
    }
    
    return self;
}

// private methods

- (void)setupRestKit
{
    //configure "text/javascript" as json, because Rotter Tomato return Json in Mime Type : "text/javascript"
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/javascript"];

//FOR DEBUG //Elihay? do we have log level such as debug, warning, error, etc...
//    RKLogConfigureByName("RestKit", RKLogLevelWarning);
//    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
}

// call callRottenGetRequest without extra url argument
- (void)callRottenGetRequest:(NSString *)getRequest responseDescriptor:(RKResponseDescriptor *)responseDescriptor delegate:(id<MVRottenLoadData>)delegate
{
    [self callRottenGetRequest:getRequest responseDescriptor:responseDescriptor delegate:delegate extraParams:@""];
}

// call to Rotten Tomato api get call, the return value invoke by the delegate
- (void)callRottenGetRequest:(NSString *)getRequest responseDescriptor:(RKResponseDescriptor *)responseDescriptor delegate:(id<MVRottenLoadData>)delegate extraParams:(NSString *)extraParams
{
    extraParams = [extraParams stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/%@?apikey=%@%@",getRequest, ROTTEN_KEY, extraParams]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        NSLog(@"load %@ success", getRequest);
        [delegate operation:operation didCompleteWithData:result];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Operation %@ failed with error: %@", getRequest, error);
        if ([delegate respondsToSelector:@selector(operation:didFailWithError:)]) {
            [delegate operation:operation didFailWithError:error];
        }
        
    }];
    
    [operation start];
}

-(RKObjectMapping *)getMovieMapping
{
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[MVMovie class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"id": @"id",
                                                  @"title": @"title",
                                                  @"synopsis":@"synopsis",
                                                  @"year":  @"year",
                                                  @"links" : @"links"
                                                  }];
    return mapping;
}

-(RKObjectMapping *)getReviewMapping
{
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[MVMovieReview class]];
    [mapping addAttributeMappingsFromArray:@[@"critic",
                                              @"date",
                                              @"freshness",
                                              @"publication",
                                              @"quote",
                                              @"links"]];
    return mapping;
}

-(RKObjectMapping *)getClipMapping
{
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:[MVMovieClip class]];
    [mapping addAttributeMappingsFromArray:@[@"title",
                                             @"duration",
                                             @"thumbnail",
                                             @"links"]];
    return mapping;
}

//Public methods

- (void)searchMovie:(NSString*)searchText delegate:(id<MVRottenLoadData>)delegate
{
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self getMovieMapping] method:RKRequestMethodAny pathPattern:nil keyPath:@"movies" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    NSString * getRequest = @"movies.json";
    NSString * params = [NSString stringWithFormat:@"&q=%@&page_limit=40", searchText];
    
    [self callRottenGetRequest:getRequest responseDescriptor:responseDescriptor delegate:delegate extraParams:params];

}

- (void)loadTheatersMovies:(id<MVRottenLoadData>)delegate
{
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self getMovieMapping] method:RKRequestMethodAny pathPattern:nil keyPath:@"movies" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    NSString * getRequest = @"lists/movies/in_theaters.json";
    
    [self callRottenGetRequest:getRequest responseDescriptor:responseDescriptor delegate:delegate];
}

- (void)getMovieReviewsByID:(NSString*)movieID delegate:(id<MVRottenLoadData>)delegate
{
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self getReviewMapping] method:RKRequestMethodAny pathPattern:nil keyPath:@"reviews" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    NSString * getRequest = [NSString stringWithFormat:@"movies/%@/reviews.json", movieID];
    
    [self callRottenGetRequest:getRequest responseDescriptor:responseDescriptor delegate:delegate];
    
}

- (void)getMovieClipsByID:(NSString*)movieID delegate:(id<MVRottenLoadData>)delegate
{
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[self getClipMapping] method:RKRequestMethodAny pathPattern:nil keyPath:@"clips" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    NSString * getRequest = [NSString stringWithFormat:@"movies/%@/clips.json", movieID];
    
    [self callRottenGetRequest:getRequest responseDescriptor:responseDescriptor delegate:delegate];
}

@end
