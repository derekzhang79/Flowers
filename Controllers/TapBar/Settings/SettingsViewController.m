//
//  SettingsViewController.m
//  Flowers
//
//  Created by admin on 02.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (nonatomic, retain) UITableViewCell *defaultAdress;
@property (nonatomic, retain) UITableViewCell *autoExit;
@end


@implementation SettingsViewController

@synthesize defaultAdress, autoExit;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Настройки";
    defaultAdress = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    defaultAdress.textLabel.text = @"Адрес по-умолчанию";
    UISwitch *defAdressSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    defaultAdress.accessoryView = defAdressSwitch;
    [defAdressSwitch release];
    
    
    autoExit = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    autoExit.textLabel.text = @"Автовыход";
    UISwitch *autoExitSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    autoExit.accessoryView = autoExitSwitch;
    [autoExitSwitch release];
}

- (void)dealloc
{
    defaultAdress = nil;
    autoExit = nil;
    [super dealloc];
} 

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return defaultAdress;
    else 
        return autoExit;
}

@end
