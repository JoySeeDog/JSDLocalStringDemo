//
//  JSDTabBarController.m
//  JSDLocalStringDemo
//
//  Created by iseedog on 04/04/2017.
//  Copyright © 2017 JoySeeDog. All rights reserved.
//

#import "JSDTabBarController.h"
#import "JSDSettingViewController.h"
#import "JSDLocalize.h"


@interface JSDTabBarController ()

@end

@implementation JSDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    homeNavigationController.title = JSDLocalizedString(@"首页", nil);
    homeNavigationController.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *settingNavigationController = [[UINavigationController alloc] initWithRootViewController:[[JSDSettingViewController alloc] init]];
    settingNavigationController.title = JSDLocalizedString(@"设置", nil);
    settingNavigationController.view.backgroundColor = [UIColor whiteColor];

    NSArray *controllers = [NSArray arrayWithObjects:homeNavigationController,settingNavigationController, nil];
    
    self.viewControllers =  controllers;
    
    

    
    
    // Do any additional setup after loading the view.
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

@end
