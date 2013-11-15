# TTTLocalizedPluralString
## NSLocalizedString with a Count Argument

> As of iOS 7 and Mac OS X 10.9 Mavericks, Foundation has the ability to specify localized strings according to pluralization and grammar rules. You can find more information about it in the [Localized Property List File](https://developer.apple.com/library/mac/releasenotes/Foundation/RN-Foundation/#//apple_ref/doc/uid/TP30000742-CH2-SW56) section of the Foundation release notes.

`NSLocalizedString` and its related macros are make localizing Mac and iOS applications relatively straight-forward and simple. It falls down, however, when having to deal with strings whose conjugations change based on a dynamic count value. In such cases, you may have seen code like this:

``` objective-c
if (count == 1) {
  return NSLocalizedString(@"1 Person", nil);
} else {
  return [NSString stringWithFormat:NSLocalizedString(@"%d People", nil), count];
}
```

While this works alright for English, you run into problems when targeting other locales. Consider some examples as described in the [Unicode Language Plural Rules](http://unicode.org/repos/cldr-tmp/trunk/diff/supplemental/language_plural_rules.html):

* Many Asian languages, like Japanese, Korean, Thai, and Simplified Chinese, do not have plural forms of nouns
* Arabic has several plural forms, including rules for zero, one, two, as well as few, many, and other, which are determined using a rather complicated base 10 divmod operation to determine the parity.

Fortunately, `TTTLocalizedPluralString` figures all of this out for you. You can use it just as you would `NSLocalizedString`, only in this case, you also have an argument for count. Here is the example from before, this time using `TTTLocalizedPluralString`. 

``` objective-c
return TTTLocalizedPluralString(count, @"Person", nil);
```

This macro points to a function that determines the plural rule for the current locale, and then does an `NSBundle` localized string lookup for the corresponding value. In this case, `en.lproj/Localizable.strings` would have two keys for this: `%d Person (plural rule: one)` and `%d Person (plural rule: other)`. Other localizations would only require the keys used by that language (e.g. 1 for Japanese, and 6 for Arabic).

Here is the full list of plural rules:

* `zero`
* `one`
* `two`
* `few`
* `many`
* `other`

---

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

TTTLocalizedPluralString is available under the MIT license. See the LICENSE file for more info.
