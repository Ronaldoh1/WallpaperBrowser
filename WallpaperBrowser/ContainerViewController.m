//
//  ContainerViewController.m
//  WallpaperBrowser
//
//  Created by Ronald Hernandez on 6/22/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import "ContainerViewController.h"
#import "PaperViewController.h"

@interface ContainerViewController ()
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    PaperViewController *paperViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PaperViewController"];
    paperViewController.monthToShow = 5;

    [self addChildViewController:paperViewController];

    [self.container addSubview:paperViewController.view];

    [paperViewController didMoveToParentViewController:self];  

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"paperSegue"]) {
        PaperViewController *paperVC = (PaperViewController *)segue.destinationViewController;
        paperVC .monthToShow = 5;


    }
}

@end
