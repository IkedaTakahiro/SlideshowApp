//
//  ViewController.m
//  SlideshowApp
//
//  Created by 池田享浩 on 2015/12/05.
//  Copyright (c) 2015年 takahiro ikeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
 UIImageView *imageView;
 NSInteger count;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    count = 0;
    [self background];
    [self nextButton];
    [self backButton];
}

-(void)background{
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)];
    imageView.image = [UIImage imageNamed:@"gazou0.png"];
    [self.view addSubview:imageView];
}

-(void)nextButton{
    UIButton *nbutton = [UIButton buttonWithType:UIButtonTypeCustom];//defaultのボタン
    [nbutton setImage:[UIImage imageNamed:@"button3.png"] forState:UIControlStateNormal];
    nbutton.frame = CGRectMake(0,0,50,20);
    nbutton.center = CGPointMake(240,50);
    //[nbutton setTitle:@"→" forState:UIControlStateNormal];
    [nbutton addTarget:self action:@selector(nextSlide:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nbutton];
}

-(void)backButton{
    UIButton *bbutton = [UIButton buttonWithType:UIButtonTypeCustom];//defaultのボタン
    [bbutton setImage:[UIImage imageNamed:@"button4.png"] forState:UIControlStateNormal];
    bbutton.frame = CGRectMake(0,0,50,20);
    bbutton.center = CGPointMake(80,50);
    //[bbutton setTitle:@"←" forState:UIControlStateNormal];
    [bbutton addTarget:self action:@selector(backSlide:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bbutton];
}


-(void)nextSlide:(id)sender{
    count++;
    if (count > 5) {
        count = 0;
    }
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gazou%ld.png",(long)count]];
}

-(void)backSlide:(id)sender{
    count--;
    if ( 0 <= count  && count <= 4){
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gazou%ld.png",(long)count]];
    } else if(count == -1){
        count = 5;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gazou%ld.png",(long)count]];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
