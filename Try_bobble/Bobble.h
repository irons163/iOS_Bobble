//
//  Bobble.h
//  Try_bobble
//
//  Created by irons on 2015/12/3.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Bobble : SKSpriteNode

+(instancetype)initWithTexture:(SKTexture *)texture withType:(int)_type withPoint:(CGPoint)_point;

@end
