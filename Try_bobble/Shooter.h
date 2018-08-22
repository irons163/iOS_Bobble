//
//  Shooter.h
//  Try_bobble
//
//  Created by irons on 2015/12/2.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static int shooterH, shooterW;
static float angel;

@interface Shooter : SKSpriteNode

+(instancetype)initShooter;

+(void)setShooterH:(float)h;
+(float)shooterH;
+(void)setShooterW:(float)w;
+(float)shooterW;
+(void)setAngel:(float)_angel;
+(float)angel;

@end
