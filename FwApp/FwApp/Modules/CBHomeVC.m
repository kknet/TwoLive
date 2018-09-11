//
//  CBHomeVC.m
//  FwApp
//
//  Created by hxbjt on 2018/9/7.
//  Copyright © 2018年 fengwo. All rights reserved.
//

#import "CBHomeVC.h"
#import "CBHomeVCUI.h"

@interface CBHomeVC ()

@property (nonatomic, strong) CBHomeVCUI *ownerVCUI;

@end

@implementation CBHomeVC

- (CBHomeVCUI *)ownerVCUI {
    if (!_ownerVCUI) {
        _ownerVCUI = [CBHomeVCUI new];
    }
    return _ownerVCUI;
}

- (void)viewDidLoad {
    [super viewDidLoad];

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
