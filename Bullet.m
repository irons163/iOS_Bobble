//
//  Bullet.m
//  Try_bobble
//
//  Created by irons on 2015/12/2.
//  Copyright (c) 2015年 irons. All rights reserved.
//

#import "Bullet.h"
#import "CommonUtil.h"
#import "BitmapUtil.h"
#import "Shooter.h"

typedef enum {
    RED_BULLET, GREEN_BULLET, BLUE_BULLET, YELLOW_BULLET, BLACK_BULLET, WHITE_BULLET, ORANGE_BULLET, PURPLE_BULLET
}BulletType;

typedef enum {
    DIRECTION_LEFT, DIRECTION_RIGHT, DIRECTION_UP, DIRECTION_STOP, DIRECTION_PREPARE
} DirectionType;

@implementation Bullet{
//    BitmapUtil* bitmapUtil;
    DirectionType direction;
    NSMutableArray* bullets;
    int speed;
    int type;
    double y2;
}
//public Bitmap bitmap_bullet;
//public double x;
//public double y;
//public static double x1;
//public static double y1;
//public static double x2;
//public static double y2;
//private int speed;
//private int type;

// 螢幕邊界
static int GAME_AREA_TOP;
static int GAME_AREA_LEFT;
static int GAME_AREA_RIGHT;
//	public static final int GAME_AREA_BOTTOM = GameView.position[GameView.position.length - 2][0][1] + 48;
static float angel;
static bool isshoot = false;
static bool isCollsion = false;
//	private int[] spid = new int[9];

+(instancetype)initWithTextture:(SKTexture*)texture withType:(int)type{
    Bullet* bullet = [Bullet spriteNodeWithTexture:texture];
    if(bullet){
        BitmapUtil* bitmapUtil = [BitmapUtil sharedInstance];
        GAME_AREA_TOP = CommonUtil.screenHeight / 14;
        GAME_AREA_LEFT = CommonUtil.screenWidth / 13;
        GAME_AREA_RIGHT = CommonUtil.screenWidth - 2
        * bitmapUtil.bobble.size.width;
        bullet->direction = DIRECTION_STOP;
        bullet->bullets = [NSMutableArray array];
        
        bullet->type = type;
        bullet->speed = bitmapUtil.bobble.size.width /10*2;
        bullet.position = CGPointMake(CommonUtil.screenWidth / 2 - bitmapUtil.bobble.size.width / 2, CommonUtil.screenHeight - Shooter.shooterH / 2 - bitmapUtil.bobble.size.height);
        bullet->y2 = CommonUtil.screenHeight - Shooter.shooterH / 2 + 10;
        
        
//        bullets = GameView.bullets;
    }
    return bullet;
}

//    public Bullet(Bitmap bitmap_bullet, int type) {
//        // TODO Auto-generated constructor stub
//        this.type = type;
//        this.bitmap_bullet = bitmap_bullet;
//        speed = BitmapUtil.bobble.getWidth() / 10 * 2;
//        x = CommonUtil.screenWidth / 2 - BitmapUtil.bobble.getWidth() / 2;
//        y = CommonUtil.screenHeight - Shooter.shooterH / 2
//                    - BitmapUtil.bobble.getHeight();
//        x1 = x;
//        y1 = y;
//        x2 = x;
//        y2 = CommonUtil.screenHeight - Shooter.shooterH / 2 + 10;
//        bullets = GameView.bullets;
//        //		spid = GameView.spid;
//    }



//public void onDraw(Canvas canvas) {
//    Paint paint = null;
//    if (isshoot == true) {
//        canvas.drawBitmap(bullets.get(0).bitmap_bullet, (int) x, (int) y,
//                          paint);
//        canvas.drawBitmap(bullets.get(1).bitmap_bullet, (int) x1, (int) y1,
//                          paint);
//        canvas.drawBitmap(bullets.get(2).bitmap_bullet, (int) x2, (int) y2,
//                          paint);
//    } else if (isshoot == false) {
//        canvas.drawBitmap(bullets.get(0).bitmap_bullet, (int) x1, (int) y1,
//                          paint);
//        canvas.drawBitmap(bullets.get(1).bitmap_bullet, (int) x2, (int) y2,
//                          paint);
//    }
//}

-(void) onShoot{
    if (isshoot == false) {
        angel = fabsf(Shooter.angel);
        // System.out.println("angel = "+angel);
        if (Shooter.angel >= 0) {
            direction = DIRECTION_RIGHT;
        } else if (Shooter.angel < 0) {
            direction = DIRECTION_LEFT;
        } else {
            direction = DIRECTION_UP;
        }
        isshoot = true;
//        AudioUtil.playSound(R.raw.stick);
    }
}

//public void onShoot() {
//    if (isshoot == false) {
//        angel = Math.abs(Shooter.angel);
//        // System.out.println("angel = "+angel);
//        if (Shooter.angel >= 0) {
//            direction = DirectionType.DIRECTION_RIGHT;
//        } else if (Shooter.angel < 0) {
//            direction = DirectionType.DIRECTION_LEFT;
//        } else {
//            direction = DirectionType.DIRECTION_UP;
//        }
//        isshoot = true;
//        AudioUtil.playSound(R.raw.stick);
//    }
//}

-(SKTexture*) getBitmap_bullet {
    return self.texture;
}


-(void)setType:(int) type{
    self->type = type;
}

-(void) onMove {
    if (isshoot == true) {
        // System.out.println("Bullet direction = "+direction);
        float x = self.position.x;
        float y = self.position.y;
        switch (direction) {
                
            case DIRECTION_UP:
                if (y > GAME_AREA_TOP) {
                    y -= (int) speed * cosf(angel * M_PI / 180);
                    
                    
                } else
                    y = GAME_AREA_TOP;
                break;
            case DIRECTION_RIGHT:
                
                if (y > GAME_AREA_TOP) {
                    x += (int) speed * sinf(angel * M_PI / 180);
                    y -= (int) speed * cosf(angel * M_PI / 180);
                } else
                    y = GAME_AREA_TOP;
                
//                Log.e("x", "x"+x);
                break;
                
            case DIRECTION_LEFT:
                
                if (y > GAME_AREA_TOP) {
                    x -= speed * sinf(angel * M_PI / 180);
                    y -= speed * cosf(angel * M_PI / 180);
                } else
                    y = GAME_AREA_TOP;
                
//                Log.e("x", "x"+x);
                break;
            default:
                break;
                
        }
        if (x > GAME_AREA_RIGHT) {
            direction = DIRECTION_LEFT;
            
//            AudioUtil.playSound(R.raw.rebound);
            
        } else if (x < GAME_AREA_LEFT) {
            //				x = GAME_AREA_LEFT;
//            Log.e("x", "x"+x);
            direction = DIRECTION_RIGHT;
            
//            AudioUtil.playSound(R.raw.rebound);
            
        }
        
        if (y == 38) {
            isshoot = false;
        }
        
        self.position = CGPointMake(x, y);
    }
}

//public void onMove() {
//    if (isshoot == true) {
//        // System.out.println("Bullet direction = "+direction);
//        switch (direction) {
//                
//            case DIRECTION_UP:
//                if (y > GAME_AREA_TOP) {
//                    y -= (int) speed * Math.cos(angel * Math.PI / 180);
//                } else
//                    y = GAME_AREA_TOP;
//                break;
//            case DIRECTION_RIGHT:
//                
//                if (y > GAME_AREA_TOP) {
//                    x += (int) speed * Math.sin(angel * Math.PI / 180);
//                    y -= (int) speed * Math.cos(angel * Math.PI / 180);
//                } else
//                    y = GAME_AREA_TOP;
//                
//                Log.e("x", "x"+x);
//                break;
//                
//            case DIRECTION_LEFT:
//                
//                if (y > GAME_AREA_TOP) {
//                    x -= speed * Math.sin(angel * Math.PI / 180);
//                    y -= speed * Math.cos(angel * Math.PI / 180);
//                } else
//                    y = GAME_AREA_TOP;
//                
//                Log.e("x", "x"+x);
//                break;
//            default:
//                break;
//                
//        }
//        if (x > GAME_AREA_RIGHT) {
//            direction = DirectionType.DIRECTION_LEFT;
//            
//            AudioUtil.playSound(R.raw.rebound);
//            
//        } else if (x < GAME_AREA_LEFT) {
//            //				x = GAME_AREA_LEFT;
//            Log.e("x", "x"+x);
//            direction = DirectionType.DIRECTION_RIGHT;
//            
//            AudioUtil.playSound(R.raw.rebound);
//            
//        }
//        
//        if (y == 38) {
//            isshoot = false;
//        }
//    }
//}

+(float)GAME_AREA_TOP{
    return GAME_AREA_TOP;
}

+(float)GAME_AREA_LEFT{
    return GAME_AREA_LEFT;
}

+(float)GAME_AREA_RIGHT{
    return GAME_AREA_RIGHT;
}

@end
