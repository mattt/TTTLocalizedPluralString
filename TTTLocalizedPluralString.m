// TTTLocalizedPluralString.m
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
            NSUInteger mod100 = count % 100;
            if (mod100 >= 3 && mod100 <= 10) {
                return kTTTFewPluralRule;
            } else if (mod100 >= 11) {
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

static NSString * TTTTraditionalChinesePluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTCatalanPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTCroatianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;

    switch (mod10) {
        case 1:
            switch (mod100) {
                case 11:
                    break;
                default:
                    return kTTTOnePluralRule;
            }
        case 2:
        case 3:
        case 4:
            switch (mod100) {
                case 12:
                case 13:
                case 14:
                    break;
                default:
                    return kTTTFewPluralRule;
            }

            break;
        default:
            break;
    }

    return kTTTManyPluralRule;
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
        case 0:
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

static NSString * TTTDanishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTDutchPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTFinnishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTGreekPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTHebrewPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;

    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        case 2:
            return kTTTTwoPluralRule;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
            break;
        default:
            switch (mod10) {
                case 0:
                    return kTTTManyPluralRule;
                default:
                    break;
            }
    }

    return kTTTOtherPluralRule;
}

static NSString * TTTHungarianPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTIndonesianPluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
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

static NSString * TTTLatvianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;

    if (count == 0) {
        return kTTTZeroPluralRule;
    }

    if (count == 1) {
        return kTTTOnePluralRule;
    }

    switch (mod10) {
        case 1:
            if (mod100 != 11) {
                return kTTTOnePluralRule;
            }
            break;
        default:
            break;
    }

    return kTTTManyPluralRule;
}

static NSString * TTTMalayPluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTNorwegianBokmalPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTNorwegianNynorskPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTPolishPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;

    if (count == 1) {
        return kTTTOnePluralRule;
    }

    switch (mod10) {
        case 2:
        case 3:
        case 4:
            switch (mod100) {
                case 12:
                case 13:
                case 14:
                    break;
                default:
                    return kTTTFewPluralRule;
            }

            break;
        default:
            break;
    }

    return kTTTManyPluralRule;
}

static NSString * TTTPortuguesePluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTRomanianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod100 = count % 100;

    switch (count) {
        case 0:
            return kTTTFewPluralRule;
        case 1:
            return kTTTOnePluralRule;
        default:
            if (mod100 > 1 && mod100 <= 19) {
                return kTTTFewPluralRule;
            }
            break;
    }

    return kTTTOtherPluralRule;
}

static NSString * TTTRussianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;

    switch (mod100) {
        case 11:
        case 12:
        case 13:
        case 14:
            break;
            
        default:
            switch (mod10) {
                case 1:
                    return kTTTOnePluralRule;
                case 2:
                case 3:
                case 4:
                    return kTTTFewPluralRule;
                default:
                    break;
            }
			
    }

    return kTTTManyPluralRule;
}

static NSString * TTTSlovakPluralRuleForCount(NSUInteger count) {
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

static NSString * TTTSpanishPluralRuleForCount(NSUInteger count) {
    switch (count) {
        case 1:
            return kTTTOnePluralRule;
        default:
            return kTTTOtherPluralRule;
    }
}

static NSString * TTTSwedishPluralRuleForCount(NSUInteger count) {
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

static NSString * TTTTurkishPluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

static NSString * TTTUkrainianPluralRuleForCount(NSUInteger count) {
    NSUInteger mod10 = count % 10;
    NSUInteger mod100 = count % 100;

    switch (mod100) {
        case 11:
        case 12:
        case 13:
        case 14:
            break;
            
        default:
            switch (mod10) {
                case 1:
                    return kTTTOnePluralRule;
                case 2:
                case 3:
                case 4:
                    return kTTTFewPluralRule;
                default:
                    break;
            }
			
    }

    return kTTTManyPluralRule;
}

static NSString * TTTVietnamesePluralRuleForCount(NSUInteger count) {
    return kTTTOtherPluralRule;
}

NSString * TTTLocalizedPluralStringKeyForCountAndSingularNoun(NSUInteger count, NSString *singular) {
    NSString *languageCode = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
    return TTTLocalizedPluralStringKeyForCountAndSingularNounForLanguage(count, singular, languageCode);
}

NSString * TTTLocalizedPluralStringKeyForCountAndSingularNounForLanguage(NSUInteger count, NSString *singular, NSString *languageCode) {
    NSString *pluralRule = nil;

    // Because -hasPrefix is being used here, any three-letter ISO 639-2/3 codes must come before two-letter ISO 639-1 codes in order to prevent, for instance, Konkani (kok) from having Korean (ko) pluralization applied
    if ([languageCode hasPrefix:@"ar"]) {
        pluralRule = TTTArabicPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ca"]) {
        pluralRule = TTTCatalanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"zh-Hans"]) {
        pluralRule = TTTSimplifiedChinesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"zh-Hant"]) {
        pluralRule = TTTTraditionalChinesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"cr"]) {
        pluralRule = TTTCroatianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"cs"]) {
        pluralRule = TTTCzechPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"da"]) {
        pluralRule = TTTDanishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nl"]) {
        pluralRule = TTTDutchPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"en"]) {
        pluralRule = TTTEnglishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"fr"]) {
        pluralRule = TTTFrenchPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"de"]) {
        pluralRule = TTTGermanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"fi"]) {
        pluralRule = TTTFinnishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"el"]) {
        pluralRule = TTTGreekPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"he"]) {
        pluralRule = TTTHebrewPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"hu"]) {
        pluralRule = TTTHungarianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"id"]) {
        pluralRule = TTTIndonesianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"it"]) {
        pluralRule = TTTItalianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ja"]) {
        pluralRule = TTTJapanesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ko"]) {
        pluralRule = TTTKoreanPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"lv"]) {
        pluralRule = TTTLatvianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ms"]) {
        pluralRule = TTTMalayPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nb"]) {
        pluralRule = TTTNorwegianBokmalPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"nn"]) {
        pluralRule = TTTNorwegianNynorskPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"pl"]) {
        pluralRule = TTTPolishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"pt"]) {
        pluralRule = TTTPortuguesePluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ro"]) {
        pluralRule = TTTRomanianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"ru"]) {
        pluralRule = TTTRussianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"es"]) {
        pluralRule = TTTSpanishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"sk"]) {
        pluralRule = TTTSlovakPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"sv"]) {
        pluralRule = TTTSwedishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"th"]) {
        pluralRule = TTTThaiPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"tr"]) {
        pluralRule = TTTTurkishPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"uk"]) {
        pluralRule = TTTUkrainianPluralRuleForCount(count);
    } else if ([languageCode hasPrefix:@"vi"]) {
        pluralRule = TTTVietnamesePluralRuleForCount(count);
    } else {
        NSLog(@"Unsupported language: %@", languageCode);
        return nil;
    }

    return [NSString stringWithFormat:@"%%d %@ (plural rule: %@)", singular, pluralRule];
}
