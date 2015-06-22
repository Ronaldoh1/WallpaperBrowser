//
//  ViewController.m
//  WallpaperBrowser
//
//  Created by Main Account on 1/29/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "ViewController.h"
#import "PaperViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

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


- (IBAction)sliderValueChanged:(id)sender {
  self.sliderLabel.text = [NSString stringWithFormat:@"%d", (int)self.slider.value];
}

- (IBAction)goTapped:(id)sender {
  //[self performSegueWithIdentifier:@"GoToPaper" sender:self];
  PaperViewController *paperViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PaperViewController"];
  paperViewController.monthToShow = self.sliderLabel.text.intValue;
    [self.navigationController pushViewController:paperViewController animated:YES];
  //[self presentViewController:paperViewController animated:YES completion:nil];
}

- (IBAction)close:(UIStoryboardSegue *)segue {
  NSLog(@"closed!");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

  if ([segue.identifier isEqualToString:@"GoToPaper"]) {
    PaperViewController *paperViewController = (PaperViewController *) segue.destinationViewController;
    paperViewController.monthToShow = self.sliderLabel.text.intValue;
  }

}

@end
