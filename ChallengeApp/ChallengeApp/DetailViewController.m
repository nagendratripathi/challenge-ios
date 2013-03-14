//
//  DetailViewController.m
//  ChallengeApp
//
//  Created by Tony on 3/10/13.
//  Copyright (c) 2013 Subfuzion. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

- (IBAction)actionClick:(id)sender;

- (IBAction)bookmarkAdd:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionClick:(id)sender {
    
   // NSString *message = @"I want to share this challenge.gov posting with you";

    
    NSArray *postItems = @[_detailItem];
    
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                            initWithActivityItems:postItems
                                            applicationActivities:nil];
    
    activityVC.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact];
    
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

- (IBAction)bookmarkAdd:(UIButton *)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *testArray= [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"favoriteArray"]];
    
    //see if already added before
    if(![testArray containsObject:_detailItem])
    {
        [testArray addObject:_detailItem];
    }
    
    [defaults setObject:testArray forKey:@"favoriteArray"];
    
    [defaults synchronize];

    
}

@end
