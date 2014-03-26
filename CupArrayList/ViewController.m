//
//  ViewController.m
//  CupArrayList
//
//  Created by Xchobo on 2014/3/26.
//  Copyright (c) 2014年 Xchobo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int waterTotal; // 計算總水量
    int drinkTotal; //計算總飲料量
    UIView *waterView;
}

@property (strong, nonatomic) IBOutlet UILabel *labelShow;
@property (strong, nonatomic) IBOutlet UISlider *sliderValue;

- (IBAction)slideAction:(id)sender;

@end

@implementation ViewController

- (IBAction)slideAction:(id)sender {
    
     //水量
    waterTotal = [_sliderValue value]*1000;
    [_labelShow setText:[NSString stringWithFormat:@"%i", (int) waterTotal]];
    
    //--- water cup ---------
    //total：
//    waterTotal = 5472; //假設用的變數
    if ( waterView == nil ) {
        
    }else{
        [waterView removeFromSuperview];
        waterView =nil;
    }
    waterView = [[UIView alloc] initWithFrame:CGRectMake(20, 190, 280, 340)];
    [waterView setBackgroundColor:[UIColor colorWithRed:0.910 green:0.891 blue:0.518 alpha:0.4]];
    [self.view addSubview:waterView];

    //計算總杯數
    int waterTotalcup = waterTotal/1000;
    
    int i, j, cups=0 ;
    
    //計算列數
    int waterTotalcupRow = (waterTotalcup-1) /4 + 1;
    
    [[waterView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //    [waterView removeFromSuperview];
    // 建立杯子
    for (i=0; i<waterTotalcupRow; i++) {
        for (j=0; j<4; j++) {
            //利用cups判斷是否要建立下一個杯子
            if (waterTotalcup > cups) {
                UIImageView *waterImageView = [[UIImageView alloc] init];
                // X, Y 圖片加間隔為 46, 46
                [waterImageView setFrame:CGRectMake(j*70, i*70, 60, 60)];
                [waterImageView setImage:[UIImage imageNamed:@"cap.png"]];
                [waterView addSubview:waterImageView];
                cups ++;
            }
        }
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


