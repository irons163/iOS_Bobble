//
//  Bullet.h
//  Try_bobble
//
//  Created by irons on 2015/12/2.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Bullet : SKSpriteNode

+(instancetype)initWithTextture:(SKTexture*)texture withType:(int)type;

+(float)GAME_AREA_TOP;

+(float)GAME_AREA_LEFT;

+(float)GAME_AREA_RIGHT;

@end
