//
//  BitmapUtil.h
//  Try_downStage
//
//  Created by irons on 2015/5/20.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface BitmapUtil : NSObject

@property SKTexture * shooter;
@property SKTexture * gameBg;
@property SKTexture * bobble;
@property SKTexture * bobble2;
@property SKTexture * bobble3;
@property SKTexture * bobble4;
@property SKTexture * bobble5;
@property SKTexture * bobble6;
@property SKTexture * bobble7;
@property SKTexture * bobble8;

@property SKTexture * frozenBobble;
@property SKTexture * frozenBobble2;
@property SKTexture * frozenBobble3;
@property SKTexture * frozenBobble4;
@property SKTexture * frozenBobble5;
@property SKTexture * frozenBobble6;
@property SKTexture * frozenBobble7;
@property SKTexture * frozenBobble8;

@property SKTexture * blindBobble;
@property SKTexture * blindBobble2;
@property SKTexture * blindBobble3;
@property SKTexture * blindBobble4;
@property SKTexture * blindBobble5;
@property SKTexture * blindBobble6;
@property SKTexture * blindBobble7;
@property SKTexture * blindBobble8;

@property SKTexture * bitmap_loss;
@property SKTexture * bitmap_win;

@property CGSize bobbleSize;
@property CGSize frozenBobbleSize;

-(NSArray *)timeTextures;

+(id)sharedInstance;

@end
