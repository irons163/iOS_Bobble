//
//  GameMap.m
//  Try_bobble
//
//  Created by irons on 2015/12/3.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "GameMap.h"

@implementation GameMap

//+ (id)sharedInstance {
//    static GameMap* instance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [self new];
//    });
//    return instance;
//}

+(NSArray *)map{
    static NSArray* map;
    if(!map)
        map = @[
               @[@6,@6,@4,@4,@2,@2,@3,@3],
               @[@0,@6,@6,@4,@4,@2,@2,@3],
               @[@2,@2,@3,@3,@6,@6,@4,@4],
               @[@2,@3,@3,@6,@6,@4,@4,@0]
               ];
    return map;
}

@end
