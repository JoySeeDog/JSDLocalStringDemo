//
//  NSBundle+JSDLocalize.h
//  JSDLocalStringDemo
//
//  Created by JoySeeDog on 31/03/2017.
//  Copyright © 2017 JoySeeDog. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSBundle (JSDLocalize)

- (void)setBaseLanguage:(NSString *)baseLanguage;

- (void)setCurrentLanguage:(NSString *)currentLanguage;

@end
