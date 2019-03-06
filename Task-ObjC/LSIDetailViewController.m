//
//  LSIDetailViewController.m
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIDetailViewController.h"

@interface LSIDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation LSIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)save:(id)sender {
}


@end
