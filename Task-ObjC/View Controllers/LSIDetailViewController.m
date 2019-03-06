//
//  LSIDetailViewController.m
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSIDetailViewController.h"
#import "LSITask.h"
#import "LSITaskController.h"

@interface LSIDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation LSIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
    
}

-(void) updateViews
{
    if (!self.isViewLoaded || !self.task) {return;}
    self.title = self.task.name ?: @"Create Task";
    self.nameTextField.text = self.task.name;
    self.noteTextView.text = self.task.notes;
    self.datePicker.date = self.task.dueDate;
    
}

- (IBAction)save:(id)sender {
    BOOL isEditing = self.task != nil;
    LSITask *task = self.task ?: [[LSITask alloc] init];
    task.name = self.nameTextField.text;
    task.notes = self.noteTextView.text;
    task.dueDate = self.datePicker.date;
    if (!isEditing) {
        [self.tasksController addTask:task];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTask:(LSITask *)task
{
    _task = task;
    [self updateViews];
}


@end
