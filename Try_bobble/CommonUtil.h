//
//  CommonUtil.h
//  Try_downStage
//
//  Created by irons on 2015/6/23.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CommonUtil : SKSpriteNode

//@property float screenHeight;

+ (id)sharedInstance;

+(void)setScreenHeight:(float)h;
+(float)screenHeight;
+(void)setScreenWidth:(float)w;
+(float)screenWidth;
+(void)setIsBlind:(BOOL)_isBlind;
+(float)isBlind;

@end
