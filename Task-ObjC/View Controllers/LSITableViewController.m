//
//  LSITableViewController.m
//  Task-ObjC
//
//  Created by Iyin Raphael on 3/6/19.
//  Copyright © 2019 Iyin Raphael. All rights reserved.
//

#import "LSITableViewController.h"
#import "LSITaskController.h"
#import "LSITask.h"
#import "LSIDetailViewController.h"

@interface LSITableViewController ()

@property (nonatomic, readonly) LSITaskController *tasksController;
@property (nonatomic, readonly) NSDateFormatter *dateFormatter;

@end

@implementation LSITableViewController

//MARK: - Properties

@synthesize tasksController = _tasksController;
- (LSITaskController *)tasksController
{
    if (_tasksController == nil) {
        _tasksController = [[LSITaskController alloc] init];
    }
    return _tasksController;
}


@synthesize dateFormatter = _dateFormatter;
-(NSDateFormatter *) dateFormatter
{
    if (_dateFormatter == nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateStyle = NSDateFormatterShortStyle;
        _dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    return _dateFormatter;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasksController.tasks.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell" forIndexPath:indexPath];
    LSITask *task = self.tasksController.tasks[indexPath.row];
    cell.textLabel.text = task.name;
    cell.detailTextLabel.text = [self.dateFormatter stringFromDate:task.dueDate];
    

    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        LSITask *task = self.tasksController.tasks[indexPath.row];
        [self.tasksController removeTask:task];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        if ([segue.identifier isEqualToString:@"ShowTaskDetail"]) {
            NSIndexPath *indexPathe = [self.tableView indexPathForSelectedRow];
            LSIDetailViewController *detailVc = segue.destinationViewController;
            detailVc.tasksController = self.tasksController;
            detailVc.task = self.tasksController.tasks[indexPathe.row];
            
        }
        if ([segue.identifier isEqualToString:@"ShowCreateTask"]) {
            LSIDetailViewController *detailVc = segue.destinationViewController;
            detailVc.tasksController = self.tasksController;
        }
}


@end
