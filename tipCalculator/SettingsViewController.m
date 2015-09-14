//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Dhanya R on 9/13/15.
//  Copyright (c) 2015 Dhanya R. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
- (IBAction)onDefaultTipControlTap:(id)sender;
- (void)updateDefaultTip: (int)defaultTipIndex;
- (void)updateDefaultTipIndex;
@end

@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDefaultTipControlTap:(id)sender {
 
    UISegmentedControl *segment=(UISegmentedControl*)sender;
    [self updateDefaultTip:(int)segment.selectedSegmentIndex];
    
}

- (void)updateDefaultTip: (int) defaultTipIndex {
    // Save the default tip percentage
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:defaultTipIndex forKey:@"default_tip_segment_index"];
    [defaults synchronize];
}

- (void)updateDefaultTipIndex{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSegmentIndex = [defaults integerForKey:@"default_tip_segment_index"];
    
    [self.defaultTipControl setSelectedSegmentIndex:2];

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"settings view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"settings view did appear");
    [self updateDefaultTipIndex];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"settings view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"settings view did disappear");
}
@end
