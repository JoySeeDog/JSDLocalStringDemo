# JSDLocalStringDemo

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/JoySeeDog/JSDDevelopDemo/blob/master/LICENSEf)&nbsp;[![Build Passing](https://img.shields.io/badge/build-passing-brightgreen.svg)]()&nbsp; 

## Description
使用本项目可以快速构建类似微信和微博根据系统语言进行国际化以及在应用内进行语言切换等功能，同时无需使用 `Base.lporj` 文件即可指定Base语言。
 
![](https://github.com/JoySeeDog/JSDLocalStringDemo/blob/master/local.gif)


## Usage
- 在PCH中 `#import "JSDLocalize.h"`,因为在整个工程中我们都会使用到国际化的宏。

- 然后在 `application:didFinishLaunchingWithOptions`里面指定系统的Base语言以及添加语言更改后需要刷新UI的通知

```Objective-C

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    JSDLocalizationSetBaseLanguage(JSDLanguageEnglish);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveedShouldResetRootViewController) name:JSDAppDelegateShouldUpdateUINotification object:nil];
 
    return YES;
}

```
- 在需要改变语言的地方改变语言即可

```Objective-c
 JSDLocalizationChangeLanguage(self.languagesCode[indexPath.row]);

```

- 改变语言后重置根控制器

```Objective-c
- (void)didReceiveedShouldResetRootViewController
{

    JSDTabBarController *rootViewController = [[JSDTabBarController alloc] init];
    rootViewController.selectedIndex = 1;
    
    UINavigationController *settingViewController = rootViewController.childViewControllers[1];
    
    [settingViewController pushViewController:[JSDLanguageViewController new] animated:YES];
    
    
    self.window.rootViewController = rootViewController;
    
    
}

```

**具体用法参考Demo**


## Contributions
Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub.

# Author

Contact me on my email: joyseedog@gmail.com








