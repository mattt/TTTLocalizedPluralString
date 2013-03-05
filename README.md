# TTTLocalizedPluralString
## NSLocalizedString with a Count Argument

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

## Next Steps

`TTTLocalizedPluralString` is safe to use in production applications. However, there are a few features that are currently missing that make this a really great solution. Consider this a wish list / roadmap for this project:

* Command-line tool to generate the keys necessary for your project / integration with `genstrings`
* Proper documentation
* Example project with sample usage
* Plural rules for all localizations supported on iOS

---

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

TTTLocalizedPluralString is available under the MIT license. See the LICENSE file for more info.
