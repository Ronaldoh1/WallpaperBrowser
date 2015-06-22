//
//  PaperViewController.m
//  WallpaperBrowser
//
//  Created by Main Account on 1/29/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "PaperViewController.h"
@import Social;
@interface PaperViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PaperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Share" style:UIBarButtonItemStyleBordered target:self action:@selector(sharedTapped:)];
}

//in this case we are using the Social framework and it allow us to share a picture on twitter.
-(void)sharedTapped:(id)sender{

    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [composeVC addImage:self.imageView.image];
    [composeVC setInitialText:@"Check this out!"];
    [self presentViewController:composeVC animated:YES completion:nil];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

  NSString *imageName = [NSString stringWithFormat:@"%02d.jpg", self.monthToShow];
  self.imageView.image = [UIImage imageNamed:imageName];

}

@end
