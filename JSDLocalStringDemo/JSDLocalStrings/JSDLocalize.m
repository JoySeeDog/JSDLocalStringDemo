//
//  JSDLocalize.m
//  JSDLocalStringDemo
//
//  Created by JoySeeDog on 31/03/2017.
//  Copyright © 2017 JoySeeDog. All rights reserved.
//


// Singleton

#import "JSDLocalize.h"
#import "NSBundle+JSDLocalize.h"


NSString * const JSDAppDelegateShouldUpdateUINotification =  @"JSDAppDelegateShouldUpdateUINotification";

NSString * const JSDLanguageArabic                = @"ar";
NSString * const JSDLanguageArmenian              = @"hy";
NSString * const JSDLanguageBasque                = @"eu";
NSString * const JSDLanguageChineseSimplified     = @"zh-Hans";
NSString * const JSDLanguageChineseTraditional    = @"zh-Hant";
NSString * const JSDLanguageCroatian              = @"hr";
NSString * const JSDLanguageDanish                = @"da";
NSString * const JSDLanguageDutch                 = @"nl";
NSString * const JSDLanguageEnglish               = @"en";
NSString * const JSDLanguageEstonian              = @"et";
NSString * const JSDLanguageFinnish               = @"fi";
NSString * const JSDLanguageFrench                = @"fr";
NSString * const JSDLanguageGerman                = @"de";
NSString * const JSDLanguageGreek                 = @"el";
NSString * const JSDLanguageHebrew                = @"he";
NSString * const JSDLanguageHungarian             = @"hu";
NSString * const JSDLanguageIndonesian            = @"id";
NSString * const JSDLanguageItalian               = @"it";
NSString * const JSDLanguageJapanese              = @"ja";
NSString * const JSDLanguageKorean                = @"ko";
NSString * const JSDLanguageLatvian               = @"lv";
NSString * const JSDLanguageLithuanian            = @"lt";
NSString * const JSDLanguageMalay                 = @"ms";
NSString * const JSDLanguagePolish                = @"pl";
NSString * const JSDLanguagePortugueseBrazil      = @"pt";
NSString * const JSDLanguagePortuguesePortugal    = @"pt-PT";
NSString * const JSDLanguageRussian               = @"ru";
NSString * const JSDLanguageSerbianCyrillic       = @"sr-Cyrl";
NSString * const JSDLanguageSerbianLatin          = @"sr-Latn";
NSString * const JSDLanguageSlovenian             = @"sl";
NSString * const JSDLanguageSwedish               = @"sv";
NSString * const JSDLanguageSpanish               = @"es";
NSString * const JSDLanguageThai                  = @"th";
NSString * const JSDLanguageTurkish               = @"tr";
NSString * const JSDLanguageVietnamese            = @"vi";


static NSBundle* currentBundle = nil;

@implementation JSDLocalize

- (id) init {
    
    self = [super init];
    if (self) {
        
        currentBundle = [NSBundle mainBundle];
    }
    return self;
}




+ (instancetype)shareJSDLocalize {
    
    static JSDLocalize* shareInstance = nil;
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        if (!shareInstance) {
            shareInstance = [[JSDLocalize alloc] init];
        }
        
    });
    
    return shareInstance;
    
}


- (NSString*)jsd_localizedStringForKey:(NSString*) key {
    
    return [currentBundle localizedStringForKey:key value:@"" table:nil];

}


- (void)changeLanguage:(NSString*)language {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    if (!path) {
        
        currentBundle = [NSBundle mainBundle];
    } else {
        
        currentBundle = [NSBundle bundleWithPath:path];
        
        if (!currentBundle) {
            currentBundle = [NSBundle mainBundle];
        }
        
        [currentBundle setCurrentLanguage:language];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[NSNotificationCenter defaultCenter] postNotificationName:JSDAppDelegateShouldUpdateUINotification object:nil];
            
        });
    }
    
}

- (void)setBaseLanguage:(NSString *)baseLanguage {
    
    [[NSBundle mainBundle] setBaseLanguage:baseLanguage];

}


@end
