//
//  JSDLocalize.h
//  JSDLocalStringDemo
//
//  Created by JoySeeDog on 31/03/2017.
//  Copyright © 2017 JoySeeDog. All rights reserved.
//

#import <Foundation/Foundation.h>


FOUNDATION_EXPORT NSString * const JSDAppDelegateShouldUpdateUINotification;

FOUNDATION_EXPORT NSString * const JSDLanguageArabic; 
FOUNDATION_EXPORT NSString * const JSDLanguageArmenian;
FOUNDATION_EXPORT NSString * const JSDLanguageBasque;
FOUNDATION_EXPORT NSString * const JSDLanguageChineseSimplified;
FOUNDATION_EXPORT NSString * const JSDLanguageChineseTraditional;
FOUNDATION_EXPORT NSString * const JSDLanguageCroatian;
FOUNDATION_EXPORT NSString * const JSDLanguageDanish;
FOUNDATION_EXPORT NSString * const JSDLanguageDutch;
FOUNDATION_EXPORT NSString * const JSDLanguageEnglish;
FOUNDATION_EXPORT NSString * const JSDLanguageEstonian;
FOUNDATION_EXPORT NSString * const JSDLanguageFinnish;
FOUNDATION_EXPORT NSString * const JSDLanguageFrench;
FOUNDATION_EXPORT NSString * const JSDLanguageGerman;
FOUNDATION_EXPORT NSString * const JSDLanguageGreek;
FOUNDATION_EXPORT NSString * const JSDLanguageHebrew;
FOUNDATION_EXPORT NSString * const JSDLanguageHungarian;
FOUNDATION_EXPORT NSString * const JSDLanguageIndonesian;
FOUNDATION_EXPORT NSString * const JSDLanguageItalian;
FOUNDATION_EXPORT NSString * const JSDLanguageJapanese;
FOUNDATION_EXPORT NSString * const JSDLanguageKorean;
FOUNDATION_EXPORT NSString * const JSDLanguageLatvian;
FOUNDATION_EXPORT NSString * const JSDLanguageLithuanian;
FOUNDATION_EXPORT NSString * const JSDLanguageMalay;
FOUNDATION_EXPORT NSString * const JSDLanguagePolish;
FOUNDATION_EXPORT NSString * const JSDLanguagePortugueseBrazil;
FOUNDATION_EXPORT NSString * const JSDLanguagePortuguesePortugal;
FOUNDATION_EXPORT NSString * const JSDLanguageRussian;
FOUNDATION_EXPORT NSString * const JSDLanguageSerbianCyrillic;
FOUNDATION_EXPORT NSString * const JSDLanguageSerbianLatin;
FOUNDATION_EXPORT NSString * const JSDLanguageSlovenian;
FOUNDATION_EXPORT NSString * const JSDLanguageSwedish;
FOUNDATION_EXPORT NSString * const JSDLanguageSpanish;
FOUNDATION_EXPORT NSString * const JSDLanguageThai;
FOUNDATION_EXPORT NSString * const JSDLanguageTurkish;
FOUNDATION_EXPORT NSString * const JSDLanguageVietnamese;



@interface JSDLocalize : NSObject

#define JSDLocalizedString(key, nil) [[JSDLocalize shareJSDLocalize] jsd_localizedStringForKey:(key)]

#define JSDLocalizationChangeLanguage(language) [[JSDLocalize shareJSDLocalize] changeLanguage:(language)]

#define JSDLocalizationSetBaseLanguage(language) [[JSDLocalize shareJSDLocalize] setBaseLanguage:(language)]



+ (instancetype)shareJSDLocalize;


- (NSString*)jsd_localizedStringForKey:(NSString*) key;

- (void)changeLanguage:(NSString*) language;

//Macro 'JSDLocalizationSetBaseLanguage' 
- (void)setBaseLanguage:(NSString *)baseLanguage;








@end
