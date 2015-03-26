//
//  OSRootViewController.m
//  oops
//
//  Created by sean on 15-3-25.
//  Copyright (c) 2015年 sean. All rights reserved.
//

#import "OSRootViewController.h"

@interface OSRootViewController ()

@end

@implementation OSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    return cell;
}

- (NSInteger *)tableView:
    (UITableView *) tv numberOfRowsInSection:(NSInteger)section{
    return 3;
}

@end
