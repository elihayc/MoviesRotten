//
//  MVMovie.m
//  MoviesRotten
//
//  Created by Elihay Cohen Zedek on 1/8/14.
//  Copyright (c) 2014 Elihay Cohen Zedek. All rights reserved.
//

#import "MVMovie.h"

@implementation MVMovie

NSString * const KEY_ID = @"id";
NSString * const KEY_TITLE = @"title";
NSString * const KEY_YEAR = @"year";
NSString * const KEY_SYNOPSIS = @"synopsis";

- (BOOL)isEqualToMVMovie:(MVMovie *)movie
{
    if (!movie)
    {
        return NO;
    }
    
    BOOL haveEqualIDs = (!self.id && !movie.id) || [self.id isEqualToString:movie.id];

    return haveEqualIDs;
}

#pragma mark - NSObject
- (BOOL)isEqual:(id)object {
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[MVMovie class]])
    {
        return NO;
    }
    
    return [self isEqualToMVMovie:(MVMovie *)object];
}

- (NSUInteger)hash {
    return [self.id hash];// should return xor of other properties hash if we compare more than one property
                        //for example return [self.id hash] ^ [self.title hash];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if(self)
    {
        self.id = [decoder decodeObjectForKey:KEY_ID];
        self.title = [decoder decodeObjectForKey:KEY_TITLE];
        self.year = [decoder decodeIntForKey:KEY_YEAR];
        self.synopsis = [decoder decodeObjectForKey:KEY_SYNOPSIS];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.id forKey:KEY_ID];
    [encoder encodeObject:self.title forKey:KEY_TITLE];
    [encoder encodeInteger:self.year forKey:KEY_YEAR];
    [encoder encodeObject:self.synopsis forKey:KEY_SYNOPSIS];
}
@end
