//
//  XMWSubRedditClient.h
//  RedditObjC
//
//  Created by Xavier on 9/20/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMWPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface XMWSubRedditClient : NSObject


//static function which mean we can call it off the class, returns void, take in a string and a block that returns nothing but takes in a uiimage
+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void (^)(NSArray<XMWPost *> *_Nullable posts))block;
+(void)fetchImageDataForUrl:(NSString *)imageUrlString withBlock: (void (^)(UIImage * _Nullable photo))block;

@end

NS_ASSUME_NONNULL_END
