//
//  Shooter.m
//  Try_bobble
//
//  Created by irons on 2015/12/2.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "Shooter.h"
#import "CommonUtil.h"
#import "BitmapUtil.h"

@implementation Shooter{
    BitmapUtil* bitmapUtil;
    int x, y;
    
}

+(instancetype)initShooter{
    Shooter* shooter = [Shooter spriteNodeWithTexture:nil];
    if(shooter){
        shooter->bitmapUtil = [BitmapUtil sharedInstance];
        shooterW = shooter->bitmapUtil.shooter.size.width;
        shooterH = shooter->bitmapUtil.shooter.size.height;
        shooter->x = CommonUtil.screenWidth / 2;
        shooter->y = CommonUtil.screenHeight - shooterH / 3 * 2;
        
        angel = 0;
        shooter.texture = shooter->bitmapUtil.shooter;
        shooter.position = CGPointMake(shooter->x, shooter->y);
    }
    return shooter;
}

//public Shooter() {
//    shooterW = BitmapUtil.shooter.getWidth();
//    shooterH = BitmapUtil.shooter.getHeight();
//    x = CommonUtil.screenWidth / 2;
//    y = CommonUtil.screenHeight - shooterH / 3 * 2;
//    
//    angel = 0;
//}

-(void)desginAngelByTouchX:(float) touchX Y:(float) touchY{
    angel = [self pointPairToBearingDegrees:CGPointMake(x, y) secondPoint:CGPointMake(touchX, touchY)];
}

- (CGFloat) pointPairToBearingDegrees:(CGPoint)startingPoint secondPoint:(CGPoint) endingPoint
{
    CGPoint originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y); // get origin point to origin by subtracting end from start
    float bearingRadians = atan2f(originPoint.y, originPoint.x); // get bearing in radians
    float bearingDegrees = bearingRadians * (180.0 / M_PI); // convert to degrees
    bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees)); // correct discontinuity
    return bearingDegrees;
}

//public void desginAngelByTouchXY(float touchX, float touchY) {
//    if (touchY < y) {
//        
//        // angel = (float) ((float)
//        // Math.atan((pressX-x)/(y-pressY))*(180/3.14));
//        angel = (float) (Math.atan2((touchX - x), (y - touchY)) * 180 / Math.PI);
//        // System.out.println(x+","+
//        // y+"   "+pressX+","+pressY+"   "+angel);
//        
//    }
//}

+(void)setShooterH:(float)h{
    shooterH = h;
}
+(float)shooterH{
    return shooterH;
}
+(void)setShooterW:(float)w{
    shooterW = w;
}
+(float)shooterW{
    return shooterW;
}
+(void)setAngel:(float)_angel{
    angel = _angel;
}
+(float)angel{
    return angel;
}

@end
