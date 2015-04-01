//
//  OSRootViewController.m
//  oops
//
//  Created by sean on 15-3-25.
//  Copyright (c) 2015年 sean. All rights reserved.
//

#import "OSRootViewController.h"
#import "AppDelegate.h"
#import "City.h"
#import "OSCityShowViewController.h"

@interface OSRootViewController ()

@end

@implementation OSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Sean";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    cities = delegate.cities;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if( nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    if(indexPath.row < cities.count){
        City *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;
    } else {
        cell.textLabel.text = @"Add a city...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (NSInteger )tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = cities.count;
    if(self.editing){
        count = count + 1;
    }
    return count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    City *thisCity = [cities objectAtIndex:indexPath.row];
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle:thisCity.cityName
//                          message:thisCity.cityDescription
//                          delegate:nil
//                          cancelButtonTitle:nil
//                          otherButtonTitles:@"OK", nil];
//    [alert show];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    OSCityShowViewController *cityShow = [[OSCityShowViewController alloc] initWithIndexPath:indexPath];
    [delegate.navController pushViewController:cityShow animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void) setEditing:(BOOL)editing animated:(BOOL) animated{
    if (editing != self.editing) {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        NSArray *indexes = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:cities.count inSection:0]];
        if (editing == YES) {
            [self.tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            [self.tableView deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
//    [super setEditing:editing animated:animated];
//    [self.tableView setEditing:editing animated:animated];
//    [self.tableView reloadData];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tv
    editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < cities.count){
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

@end
