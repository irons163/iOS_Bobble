//
//  BitmapUtil.m
//  Try_downStage
//
//  Created by irons on 2015/5/20.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "BitmapUtil.h"
#import "CommonUtil.h"

@implementation BitmapUtil{
    SKTexture * time01, *time02, *time03, *time04, *time05, *time06, *time07, *time08, *time09, *time00, *timeQ;
    NSArray * timeScores;
}

-(id)init{
    if(self = [super init]){
        self.shooter=[SKTexture textureWithImageNamed:@"shooter"];
        self.gameBg=[SKTexture textureWithImageNamed:@"background"];
        self.bobble=[SKTexture textureWithImageNamed:@"bubble_1"];
        self.bobble2 = [SKTexture textureWithImageNamed:@"bubble_2"];
        self.bobble3 = [SKTexture textureWithImageNamed:@"bubble_3"];
        self.bobble4 = [SKTexture textureWithImageNamed:@"bubble_4"];
        self.bobble5 = [SKTexture textureWithImageNamed:@"bubble_5"];
        self.bobble6 = [SKTexture textureWithImageNamed:@"bubble_6"];
        self.bobble7 = [SKTexture textureWithImageNamed:@"bubble_7"];
        self.bobble8 = [SKTexture textureWithImageNamed:@"bubble_8"];
        
        self.frozenBobble = [SKTexture textureWithImageNamed:@"frozen_1"];
        self.frozenBobble2 = [SKTexture textureWithImageNamed:@"frozen_2"];
        self.frozenBobble3 = [SKTexture textureWithImageNamed:@"frozen_3"];
        self.frozenBobble4 = [SKTexture textureWithImageNamed:@"frozen_4"];
        self.frozenBobble5 = [SKTexture textureWithImageNamed:@"frozen_5"];
        self.frozenBobble6 = [SKTexture textureWithImageNamed:@"frozen_6"];
        self.frozenBobble7 = [SKTexture textureWithImageNamed:@"frozen_7"];
        self.frozenBobble8 = [SKTexture textureWithImageNamed:@"frozen_8"];
        
        self.blindBobble = [SKTexture textureWithImageNamed:@"blind_1"];
        self.blindBobble2 = [SKTexture textureWithImageNamed:@"blind_2"];
        self.blindBobble3 = [SKTexture textureWithImageNamed:@"blind_3"];
        self.blindBobble4 = [SKTexture textureWithImageNamed:@"blind_4"];
        self.blindBobble5 = [SKTexture textureWithImageNamed:@"blind_5"];
        self.blindBobble6 = [SKTexture textureWithImageNamed:@"blind_6"];
        self.blindBobble7 = [SKTexture textureWithImageNamed:@"blind_7"];
        self.blindBobble8 = [SKTexture textureWithImageNamed:@"blind_8"];
        
        self.bitmap_loss = [SKTexture textureWithImageNamed:@"lose_panel"];
        self.bitmap_win = [SKTexture textureWithImageNamed:@"win_panel"];
        
        int bobbleWidth = (int) ((CommonUtil.screenWidth - CommonUtil.screenWidth / 10.0)/9);
        int frozenBobbleHeight = (int) ((float)self.frozenBobble.size.height
                                        / self.frozenBobble.size.width * bobbleWidth);
        
        self.bobbleSize = CGSizeMake(bobbleWidth, bobbleWidth);
        self.frozenBobbleSize = CGSizeMake(frozenBobbleHeight, frozenBobbleHeight);
        
        time01  = [SKTexture textureWithImageNamed:@"s1"];
        time02  = [SKTexture textureWithImageNamed:@"s2"];
        time03  = [SKTexture textureWithImageNamed:@"s3"];
        time04  = [SKTexture textureWithImageNamed:@"s4"];
        time05  = [SKTexture textureWithImageNamed:@"s5"];
        time06  = [SKTexture textureWithImageNamed:@"s6"];
        time07  = [SKTexture textureWithImageNamed:@"s7"];
        time08  = [SKTexture textureWithImageNamed:@"s8"];
        time09  = [SKTexture textureWithImageNamed:@"s9"];
        time00  = [SKTexture textureWithImageNamed:@"s0"];
        timeQ  = [SKTexture textureWithImageNamed:@"dot"];
        
        timeScores = @[time00, time01, time02, time03, time04, time05,time06, time07, time08, time09, timeQ];
    }
    return self;
}

-(NSArray *)timeTextures{
    return timeScores;
}

+ (id)sharedInstance {
    static BitmapUtil* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}



@end
