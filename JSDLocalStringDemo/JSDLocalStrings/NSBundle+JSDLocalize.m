//
//  NSBundle+JSDLocalize.m
//  JSDLocalStringDemo
//
//  Created by JoySeeDog on 31/03/2017.
//  Copyright © 2017 JoySeeDog. All rights reserved.
//

#import "NSBundle+JSDLocalize.h"
#import <objc/runtime.h>


static NSString * const kJSDBundleBaseLanguage = @"kJSDBundleBaseLanguage";
static NSString * const kJSDCurrentLanguage = @"kJSDCurrentLanguage";


@implementation NSBundle (JSDLocalize)

+ (void)load
{
    static dispatch_once_t NSBundleOnceToken;
    dispatch_once(&NSBundleOnceToken, ^{
        
         jsd_swizzleMethod([self class], @selector(localizedStringForKey:value:table:), @selector(jsd_localizedStringForKey:value:table:));
        
    });
}


- (void)setBaseLanguage:(NSString *)baseLanguage; {
    
    if (baseLanguage || [@"" isEqualToString:baseLanguage] ) {
          assert("default language not set");
    }
    
    objc_setAssociatedObject(self, &kJSDBundleBaseLanguage, [baseLanguage copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
   
}

- (void)setCurrentLanguage:(NSString *)currentLanguage {
    if (currentLanguage || [@"" isEqualToString:currentLanguage] ) {
        assert("currentLanguage  is invalid");
    }
    
    objc_setAssociatedObject(self, &kJSDCurrentLanguage, [currentLanguage copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}


- (NSString *)jsd_localizedStringForKey:(NSString *)key
                                 value:(nullable NSString *)value
                                 table:(nullable NSString *)tableName
{
    
    //1.Use Local language or user set language
    NSString *localLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    NSString *currentLanguage = objc_getAssociatedObject(self, &kJSDCurrentLanguage);

    //Traverse the path to check if local language's lproj exist
    if ([self lprojOfLangeuageExist:localLanguage] || [self lprojOfLangeuageExist:currentLanguage]) {
        
        return [self jsd_localizedStringForKey:key value:value table:tableName];
        
    }
    
    
    //2.Use Base Language language
    NSString *baseLanguage = objc_getAssociatedObject(self, &kJSDBundleBaseLanguage);
    
    if (!baseLanguage || [@"" isEqualToString:baseLanguage] ) {
        assert("default language not set");
    }
    
    
    ///check if Base Language's lproj exist
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:baseLanguage ofType:@"lproj"];
    if (!bundlePath || [@"" isEqualToString:bundlePath] ) {
    
        NSString *error = [NSString stringWithFormat:@"%@.lproj not found",baseLanguage];
        assert(error);
        
    }
    
    return [[NSBundle bundleWithPath:bundlePath] jsd_localizedStringForKey:key value:value table:tableName];
    
}


//Traverse the path to check local language's lproj exist

- (BOOL)lprojOfLangeuageExist:(NSString *)language {
    
    
    NSArray<NSString *> *paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"lproj" inDirectory:nil];
    
    for (NSString *path in paths) {
        
        NSError *error;
        NSString *regexString = @"[^/]*(?=.lproj$)";
        NSRegularExpression *regex = [NSRegularExpression
                                      regularExpressionWithPattern:regexString
                                      options:0
                                      error:&error];
        if (!error) {
            
            NSTextCheckingResult *match = [regex firstMatchInString:path
                                                            options:0
                                                              range:NSMakeRange(0, [path length])];
            if (match) {
                
                NSString *result = [path substringWithRange:match.range];
                //eg. zh-Hans-US   zh-Hans
                if ([language hasPrefix:result]) {
                    
                    return  YES;
                }
            }
        }
    }
    
    return NO;
    
}


void jsd_swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

