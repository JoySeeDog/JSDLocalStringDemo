//
//  JSDRootViewController.m
//  JSDLocalStringDemo
//
//  Created by JoySeeDog on 01/04/2017.
//  Copyright © 2017 JoySeeDog. All rights reserved.
//

#import "JSDLanguageViewController.h"
#import "JSDLocalize.h"


@interface JSDLanguageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *languages;
@property (nonatomic, strong) NSArray *languagesCode;

@end

@implementation JSDLanguageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:JSDLocalizedString(@"返回",nil) style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:JSDLocalizedString(@"保存",nil) style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.languages.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JSDLocalizationChangeLanguage(self.languagesCode[indexPath.row]);
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.textLabel.text =  JSDLocalizedString(self.languages[indexPath.row],nil);
    
    return cell;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
    }
    
    return _tableView;
}

- (NSArray *)languages {
    if (!_languages) {
        _languages = [NSArray arrayWithObjects:@"中文",@"英文",@"日文",@"德文", nil];
    }
    
    return _languages;
    
}

- (NSArray *)languagesCode {
    
    if (!_languagesCode) {
        _languagesCode = [NSArray arrayWithObjects:JSDLanguageChineseSimplified,JSDLanguageEnglish,JSDLanguageJapanese,JSDLanguageGerman, nil];
    }
    
    return _languagesCode;
    
}



@end
