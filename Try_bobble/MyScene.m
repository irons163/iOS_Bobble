//
//  MyScene.m
//  Try_bobble
//
//  Created by irons on 2015/5/6.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "MyScene.h"
#import "CommonUtil.h"
#import "BitmapUtil.h"
#import "Bullet.h"
#import "Bobble.h"
#import "GameMap.h"
#import "Shooter.h"

typedef enum {
    None, Lose, Win
}GameStateType;

@implementation MyScene{
    BitmapUtil* bitmapUtil;
    bool isGameRun;
    Shooter* shooter;
    int firstX, firstY;
    GameStateType gameStateType;
//    NSMutableArray
}

static const int BobbleRowsCount = 8; //8 row
static const int BobbleColsCount = 8; //8 col
static const int BobblePositionTypeCount = 2; //x y

bool isCanPressStartBtn = true;
SKTexture * s;
//static LinkedList<Bullet> bullets;
static Bullet* bullet;
static NSMutableArray * bullets;
static SKTexture * bitmap_onebullet;
static NSMutableArray * normal_bobble;
static NSMutableArray * frozen_bobble;
static NSMutableArray * blind_bobble;
static SKTexture * bitmap_win;
static SKTexture * bitmap_loss;
static Bobble * bobbles[BobbleRowsCount][BobbleColsCount];

//private Random random;
static bool soundFlag = true;

static int bobbleTotalLinesCount;
static int position[BobbleRowsCount][BobbleColsCount][BobblePositionTypeCount];
static const int CLEAR_BUBBLE_NUMBER = 3;
//GameStateType gameStateType = None;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        isGameRun = true;
        CommonUtil.screenWidth = self.size.width;
        CommonUtil.screenHeight = self.size.height;
        
//        AudioUtil.init(this);
        
        bitmapUtil = [BitmapUtil sharedInstance];
        bitmap_onebullet = bitmapUtil.bobble;
        
        gameStateType = None;
        
//        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
//        
//        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        
//        myLabel.text = @"Hello, World!";
//        myLabel.fontSize = 30;
//        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                       CGRectGetMidY(self.frame));
//        
//        [self addChild:myLabel];
        
//        bullets = new LinkedList<Bullet>();
        bullets = [NSMutableArray array];
        normal_bobble = [NSMutableArray array];
        frozen_bobble = [NSMutableArray array];
        blind_bobble = [NSMutableArray array];
        
        [self initBobbleBitmapArray];
        [self initBullet];
        
        bitmap_loss = bitmapUtil.bitmap_loss;
        bitmap_win = bitmapUtil.bitmap_win;
        
		double showBobblePanelPresent = 3 / 4.0;
		double showBobblePanelHeight = CommonUtil.screenHeight
        * showBobblePanelPresent;
        int bobbleDistanceX = bitmapUtil.bobbleSize.width;
        int bobbleDistanceY = bitmapUtil.bobbleSize.height * 5 / 6;
        int bobbleOffsetX = bobbleDistanceX / 2;
        
		for (int bobbleLine = 0;; bobbleLine++) {
			if (showBobblePanelHeight < Bullet.GAME_AREA_TOP + bobbleLine
                * bobbleDistanceY) {
				bobbleTotalLinesCount = bobbleLine - 1;
//				Log.e("bobbleTotalLinesCount", bobbleTotalLinesCount + "");
				break;
			}
		}
        
		firstX = CommonUtil.screenWidth / 16;
		firstY = Bullet.GAME_AREA_TOP;
//		position = int[bobbleTotalLinesCount][8][8];
		for (int i = 0; i < BobbleRowsCount; i++) {
			for (int j = 0; j < BobbleColsCount; j++) {
				if (i % 2 == 0) {
					position[i][j][0] = firstX + j * bobbleDistanceX;
					position[i][j][1] = firstY + i * bobbleDistanceY;
				} else if (i % 2 == 1) {
					position[i][j][0] = firstX + j * bobbleDistanceX
                    + bobbleOffsetX;
					position[i][j][1] = firstY + i * bobbleDistanceY;
				}
				// System.out.println("position["+i+"]["+j+"]"+position[i][j][0]+","+position[i][j][1]);
			}
		}
        
        
        
//		bobbles = new Bobble[position.length][position[0].length];
        
		for (int i = 0; i < GameMap.map.count; i++) {
			for (int j = 0; j < ((NSArray*)GameMap.map[i]).count; j++) {
				int type = [GameMap.map[i][j] intValue];
                Bobble* newBobble = [Bobble initWithTexture:[self newBobbleBitmap:type] withType:type withPoint:CGPointMake(position[i][j][0], position[i][j][1])];
                [self addChild:newBobble];
                bobbles[i][j] = newBobble;
//				bobbles[i][j] = new Bobble(newBobbleBitmap(type), type,
//                                           new Point(position[i][j][0], position[i][j][1]));
			}
		}
        
        
//        for(int i = 0; i < bobbles.count; i++){
//            NSArray * m = bobbles[i];
//            for(int j = 0; j < m.count; j++){
//                int type = m[i][j];
//                bobbles[i][j] = new
//            }
//        }
//        
        
		shooter = [Shooter initShooter];
//		surfaceHolder = getHolder();
//		surfaceHolder.addCallback(this);
    }
    return self;
}

-(void) initBobbleBitmapArray{
    normal_bobble[0] = bitmapUtil.bobble;
    normal_bobble[1] = bitmapUtil.bobble2;
    normal_bobble[2] = bitmapUtil.bobble3;
    normal_bobble[3] = bitmapUtil.bobble4;
    normal_bobble[4] = bitmapUtil.bobble5;
    normal_bobble[5] = bitmapUtil.bobble6;
    normal_bobble[6] = bitmapUtil.bobble7;
    normal_bobble[7] = bitmapUtil.bobble8;
    
    frozen_bobble[0] = bitmapUtil.frozenBobble;
    frozen_bobble[1] = bitmapUtil.frozenBobble2;
    frozen_bobble[2] = bitmapUtil.frozenBobble3;
    frozen_bobble[3] = bitmapUtil.frozenBobble4;
    frozen_bobble[4] = bitmapUtil.frozenBobble5;
    frozen_bobble[5] = bitmapUtil.frozenBobble6;
    frozen_bobble[6] = bitmapUtil.frozenBobble7;
    frozen_bobble[7] = bitmapUtil.frozenBobble8;
    
    blind_bobble[0] = bitmapUtil.blindBobble;
    blind_bobble[1] = bitmapUtil.blindBobble2;
    blind_bobble[2] = bitmapUtil.blindBobble3;
    blind_bobble[3] = bitmapUtil.blindBobble4;
    blind_bobble[4] = bitmapUtil.blindBobble5;
    blind_bobble[5] = bitmapUtil.blindBobble6;
    blind_bobble[6] = bitmapUtil.blindBobble7;
    blind_bobble[7] = bitmapUtil.blindBobble8;
}

-(void) initBullet{
    int type1 = arc4random_uniform(100) % 8;
    [bullets addObject:[self newBullet:type1]];
    int type2 = arc4random_uniform(100) % 8;
    [bullets addObject:[self newBullet:type2]];
    int type3 = arc4random_uniform(100) % 8;
    [bullets addObject:[self newBullet:type3]];
    
//    System.out.println("bullet = " + bullet.getType());
//    System.out.println(type1 + "---" + type2 + "---" + type3);
//    for (int i = 0; i < bullets.size(); i++) {
//        System.out
//        .println("bullets[" + i + "]=" + bullets.get(i).getType());
//    }
}

-(Bullet*) newBullet:(int) type {
    if (CommonUtil.isBlind == false) {
        bullet = [Bullet initWithTextture:[self newBobbleBitmap:type] withType:type];
    } else {
        bullet = [Bullet initWithTextture:[self newBobbleBitmap:type] withType:type];
    }
    [self addChild:bullet];
    return bullet;
}

-(SKTexture*)newBobbleBitmap:(int)type{
    SKTexture* newBobbleBitmap;
    if (CommonUtil.isBlind == false) {
        newBobbleBitmap = normal_bobble[type];
    } else {
        newBobbleBitmap = blind_bobble[type];
    }
    return newBobbleBitmap;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
