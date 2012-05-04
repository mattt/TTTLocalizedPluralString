// TTTLocalizedPluralString.h
//
// Copyright (c) 2011 Mattt Thompson (http://mattt.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "TTTLocalizedPluralString.h"

// Source: Unicode Common Locale Data Repository Plural Rules
// http://unicode.org/repos/cldr-tmp/trunk/diff/supplemental/language_plural_rules.html

static NSString * const kTTTZeroPluralRule = @"zero";
static NSString * const kTTTOnePluralRule = @"one";
static NSString * const kTTTTwoPluralRule = @"two";
static NSString * const kTTTFewPluralRule = @"few";
static NSString * const kTTTManyPluralRule = @"many";
static NSString * const kTTTOtherPluralRule = @"other";

static NSString * TTTArabicPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 0:
            return kTTTZeroPluralRule;
        case 1:
            return kTTTOnePluralRule;
        case 2:
            return kTTTTwoPluralRule;
        default: {
            NSUInteger mod10 = count % 10;
            if (mod10 >= 3 && mod10 <= 10) {
                return kTTTFewPluralRule;
            } else if (mod10 >= 11) {
                return kTTTManyPluralRule;
            } else {
                return kTTTOtherPluralRule;
            }
        }
    }
}

static NSString * TTTSimplifiedChinesePluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTCzechPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        case 2:
        case 3:
        case 4:
            return kTTTFewPluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTEnglishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTFrenchPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTGermanPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTItalianPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTJapanesePluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTKoreanPluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTPortuguesePluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTSpanishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTThaiPluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTRussianPluralRuleForCount(NSUInteger count) {
    
    NSUInteger n10 = count % 10;
    NSUInteger n100 = count % 100;    
    
    switch (n10)
    {
        case 1:
            if (n100 != 11)
                return kTTTOnePluralRule;
            break;
            
        case 2:
        case 3:
        case 4:
            if (n100 != 12 && n100 != 13 && n100 != 14)
                return kTTTFewPluralRule;
            break;

        default:    
            break;
    }

    return kTTTManyPluralRule; 
}

NSString * TTTLocalizedPluralStringKeyForCountAndSingularNoun(NSUInteger count, NSString *singular) {
    NSString *languageCode = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];

    NSString *pluralRule = nil;
    if ([languageCode isEqualToString:@"ar"]) {
        pluralRule = TTTArabicPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"zh-hans"]) {
        pluralRule = TTTSimplifiedChinesePluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"cs"]) {
        pluralRule = TTTCzechPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"en"]) {
        pluralRule = TTTEnglishPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"fr"]) {
        pluralRule = TTTFrenchPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"de"]) {
        pluralRule = TTTGermanPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"it"]) {
        pluralRule = TTTItalianPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"ja"]) {
        pluralRule = TTTJapanesePluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"ko"]) {
        pluralRule = TTTKoreanPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"pt"]) {
        pluralRule = TTTPortuguesePluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"es"]) {
        pluralRule = TTTSpanishPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"th"]) {
        pluralRule = TTTThaiPluralRuleForCount(count);
    } else if ([languageCode isEqualToString:@"ru"]) {
        pluralRule = TTTRussianPluralRuleForCount(count);            
    } else {
        NSLog(@"Unsupported language: %@", languageCode);
        return nil;
    }

    return [NSString stringWithFormat:@"%%d %@ (plural rule: %@)", singular, pluralRule];
}
