//
//  Bobble.m
//  Try_bobble
//
//  Created by irons on 2015/12/3.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "Bobble.h"
#import "BitmapUtil.h"

typedef enum {
    DIRECTION_NONE, DIRECTION_LEFT, DIRECTION_RIGHT, DIRECTION_DOWN
}ScatteredDirectionType;

@implementation Bobble{
    BitmapUtil* bitmapUtil;
    CGPoint point;
    int type;
    SKTexture* boobleBitmap;
    bool canBubblePop;
    bool isNeedClear;
    bool isCheckedForLeft;
    ScatteredDirectionType scatteredDirectionType;
    
}

+(instancetype)initWithTexture:(SKTexture *)texture withType:(int)_type withPoint:(CGPoint)_point{
//    BitmapUtil* bitmapUtil = [BitmapUtil sharedInstance];
    Bobble* bobble = [Bobble spriteNodeWithTexture:texture];
    if(bobble){
        bobble->bitmapUtil = [BitmapUtil sharedInstance];
        bobble->type = _type;
        bobble->point = _point;
        bobble->boobleBitmap = texture;
        bobble.size = bobble->bitmapUtil.bobbleSize;
        bobble.position = _point;
    }
    return bobble;
}

//@Override
//public String toString() {
//    return "Target [point=" + point + ", type=" + type + ", bitmap_target="
//				+ boobleBitmap + "]";
//}

-(CGPoint) getPoint {
    return point;
}

-(void) setPoint:(CGPoint)point {
    self->point = point;
}

-(int) getType {
    return type;
}

-(void)setType:(int) type {
    self->type = type;
}

-(void) setBobbleBitmap:(SKTexture*) boobleBitmap {
    self->boobleBitmap = boobleBitmap;
}

-(void) clear {
    isNeedClear = true;
}

-(bool) isNeedClear {
    return self->isNeedClear;
}

-(bool) isCheckedForLeft {
    return self->isCheckedForLeft;
}

-(void) setIsCheckedForLeft:(bool) isCheckedForLeft {
    self->isCheckedForLeft = isCheckedForLeft;
}

-(ScatteredDirectionType) getScatteredDirectionType {
    return scatteredDirectionType;
}

-(void) setScatteredDirectionType:(ScatteredDirectionType) scatteredDirectionType {
    self->scatteredDirectionType = scatteredDirectionType;
}

int count = 0;

-(void) scatteredMove {
    int speed = bitmapUtil.bobble.size.width / 10 * 2;
    switch (scatteredDirectionType) {
        case DIRECTION_NONE:
            
            break;
        case DIRECTION_LEFT:
            if (count < 20)
                point.y -= speed;
            else
                point.y += speed;
            point.x -= speed / 10;
            count++;
            break;
        case DIRECTION_RIGHT:
            if (count < 20)
                point.y -= speed;
            else
                point.y += speed;
            
            point.x += speed / 10;
            count++;
            break;
        case DIRECTION_DOWN:
            point.y += speed / 2;
            break;
    }
}

@end
