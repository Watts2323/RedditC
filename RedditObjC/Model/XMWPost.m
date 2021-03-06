//
//  XMWPost.m
//  RedditObjC
//
//  Created by Xavier on 9/19/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XMWPost.h"

@implementation XMWPost

//this is for creating instance of POST
-(instancetype)initWithTitle:(NSString *)title commentCount:(NSNumber *)commentCount ups:(NSNumber *)ups
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _commentCount = commentCount;
        _ups = ups;
    }
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    //Every post lives inside a data node
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    NSString *title = dataDictionary[[XMWPost titleKey]];
    NSNumber *commentCount = dataDictionary[[XMWPost commentCountKey]];
    NSNumber *ups = dataDictionary[[XMWPost upsKey]];
    
    return [self initWithTitle:title commentCount:commentCount ups:ups];
    
}

//PRIVATE KEYS
+(NSString *)titleKey
{
    return @"title";
}


+(NSString *)commentCountKey
{
    return @"num_comments";
}

+(NSString *)upsKey;
{
    return @"ups";
}

@end











