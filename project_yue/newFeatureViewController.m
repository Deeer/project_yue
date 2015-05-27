//
//  newFeatureViewController.m
//  project_yue
//
//  Created by Dee on 15/5/27.
//  Copyright (c) 2015年 zjsruxxxy7. All rights reserved.
//

#import "newFeatureViewController.h"
#import "FirstViewController.h"
#import "MainNavigationController.h"
#define centerw self.view.frame.size.width*.5
@interface newFeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIPageControl *pagescroll;
@end

@implementation newFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scroll =[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    
//    int imageX =
    CGFloat imageW = scroll.frame.size.width;
    CGFloat imageH = scroll.frame.size.height;
    
    for (int i =0; i<3; i++) {
        
        UIImageView *imageView =[[UIImageView alloc]init];
        NSString *imagename =[NSString stringWithFormat:@"%d",i+1];
        imageView.image =[UIImage imageNamed:imagename];
        CGFloat imageX =i*imageW;
        imageView.frame =CGRectMake(imageX , 0, imageW, imageH);
       
        [scroll addSubview:imageView];
        if (i==2) {
            [self addBtn:imageView];
        }
        
        
    }
    scroll.contentSize =CGSizeMake(imageW*3, 0);
    scroll.showsHorizontalScrollIndicator =NO;
    scroll.pagingEnabled = YES;
    scroll.backgroundColor =[UIColor whiteColor];
    scroll.bounces= NO;
    scroll.delegate= self;
    
    
    
    
    UIPageControl *pageCon =[[UIPageControl alloc]init];
    pageCon.numberOfPages=3;
    CGFloat centerX =self.view.frame.size.width*0.5;
    CGFloat centerY =self.view.frame.size.height;
    pageCon.center =CGPointMake(centerX, centerY-20);
    pageCon.bounds =CGRectMake(0, 0, 100, 30);
    pageCon.userInteractionEnabled= NO;
    pageCon.currentPageIndicatorTintColor =[UIColor blackColor];
    pageCon.pageIndicatorTintColor =[UIColor grayColor];
    self.pagescroll= pageCon;
    [self.view addSubview:pageCon];

    
}
-(void)addBtn:(UIImageView*)imageView
{
    imageView.userInteractionEnabled =YES;
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    
    btn.center =CGPointMake(centerw, self.view.frame.size.height-90);
    
    [btn addTarget:self action:@selector(changeCon) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:btn];
    
    
}
-(void)changeCon
{
//    self.view.window.rootViewController = [[UIViewController alloc]initWithNibName:@"dee" bundle:[NSBundle mainBundle]];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController *viewController = [storyBoard instantiateInitialViewController];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = viewController;
        
    
    
//    [self removeFromParentViewController];
//    self.view.alpha =0;
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offset = scrollView.contentOffset.x;
    
    double page =offset/scrollView.frame.size.width;
   
       int intpage =(int)(page +0.5);
    
    self.pagescroll.currentPage = intpage;

}

-(BOOL)prefersStatusBarHidden
{
    return  YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
