//
//  XMWPost.h
//  RedditObjC
//
//  Created by Xavier on 9/19/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface XMWPost : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, readonly) NSNumber *ups;
@property (nonatomic, readonly) NSString *imageUrl;

//like our memberwise Initializer
-(instancetype)initWithTitle:(NSString *)title commentCount: (NSNumber *)commentCount ups:(NSNumber *) ups imageUrl:(NSString *)imageUrl;

//we need a init for the JSON dictionary

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
