//
//  CommonUtil.m
//  Try_downStage
//
//  Created by irons on 2015/6/23.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "CommonUtil.h"

static CommonUtil* instance;

static float screenHeight;
static float screenWidth;
static bool isBlind;

@implementation CommonUtil


+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

+(void)setScreenHeight:(float)h{
    screenHeight = h;
};

+(float)screenHeight{
    return screenHeight;
}

+(void)setScreenWidth:(float)w{
    screenWidth = w;
}

+(float)screenWidth{
    return screenWidth;
}

+(void)setIsBlind:(BOOL)_isBlind{
    isBlind = _isBlind;
}

+(float)isBlind{
    return isBlind;
}

@end
