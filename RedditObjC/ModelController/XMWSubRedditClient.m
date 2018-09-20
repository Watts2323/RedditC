//
//  XMWSubRedditClient.m
//  RedditObjC
//
//  Created by Xavier on 9/20/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

#import "XMWSubRedditClient.h"

@implementation XMWSubRedditClient

+(NSURL *)baseurl{
    return [NSURL URLWithString:@"https://www.reddit.com/r"];
}

+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<XMWPost *> *_Nullable posts))block{
    
    // Construct the URL(2 THINGS EVERYONE FETCH FUNC NEEDS
    // have the url whatever the user types in is what we are going to append to the title of w.e they type in. ext always will be json
    NSURL *url = [[[XMWSubRedditClient baseurl] URLByAppendingPathComponent:title] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"T%@", [url absoluteString]);
    
    // 2) DATATask, serialize data, complete, call resume
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            block(nil);
            return;
        }
        NSLog(@"%@", response);
        
        if(!data){
            NSLog(@"No DATA AVAILABLE");
            block(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        //if you're looking at the json you can see that data is a dictionary because of the brackets, you can call it w.e the Hell you want to dataDictionary, billy bob, will wonka etc in that jsonDictionary is the whole thing then we named our key exactly what it is in the Json
        NSDictionary * dataDictionary = jsonDictionary[@"data"];
        NSArray * childrenArray = dataDictionary[@"children"];
        
        NSMutableArray *postsArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary * postDictionary in childrenArray){
            XMWPost *post = [[XMWPost alloc]initWithDictionary:postDictionary];
            [postsArray addObject:post];
        }
        block(postsArray);
        
    }] resume];
}

+(void)fetchImageDateForUrl:(NSString *)imageUrlString withBlock:(void (^)(UIImage * _Nullable))block{
    
    //1) construct url
    NSURL *url = [NSURL URLWithString:imageUrlString];
    NSLog(@"%@",[url absoluteString]);
    
    //2) dataTask, searliazxe, complete resume
    [[[NSURLSession sharedSession]
dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
    
    if (error){
        NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
        block(nil);
        return;
    }
    NSLog(@"%@", response);
    
    if(!data){
        NSLog(@"No DATA AVAILABLE");
        block(nil);
        return;
    }
    UIImage *photo = [UIImage imageWithData:data];
    block(photo);
    
}] resume];
}

@end













