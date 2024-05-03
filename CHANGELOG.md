# Changelog

## [v1.40](https://github.com/translation/rails/releases/tag/v1.40) (2024-02-09)

#### Fixes (bugs & defects):

 * Fix *more* bugs when YAML file is commented and the language key is still present.

## [v1.39](https://github.com/translation/rails/releases/tag/v1.39) (2024-02-09)

#### Fixes (bugs & defects):

 * Fix bug when YAML file is commented and the language key is still present.

## [v1.38](https://github.com/translation/rails/releases/tag/v1.38) (2023-10-23)

#### Fixes (bugs & defects):

 * Bump GetText dependency to 3.4.9 (fix `\r` escape and other improvements)
 
## [v1.37](https://github.com/translation/rails/releases/tag/v1.37) (2023-06-27)

#### Fixes (bugs & defects):

 * Prepare compatibility with Ruby 3.3 by bumping GetText dependency
 
## [v1.36](https://github.com/translation/rails/releases/tag/v1.36) (2023-05-03)

#### Fixes (bugs & defects):

 * Keep YAML files and keys from locales that are not in the configuration file (#54)

## [v1.35](https://github.com/translation/rails/releases/tag/v1.35) (2023-01-12)

#### Fixes (bugs & defects):

 * Compatibility with Ruby 3.2 (Fix `File.exists?` to `File.exist?`)

## [v1.34](https://github.com/translation/rails/releases/tag/v1.34) (2022-11-16)

#### Fixes (bugs & defects):

 * Fix plural rule in source PO file by manually adding it (for GetText >= 3.3.9)

## [v1.33](https://github.com/translation/rails/releases/tag/v1.33) (2022-11-07)

#### New features:

 * Match I18n fallbacks in GetText (cf. [#48](https://github.com/translation/rails/issues/48) and [#50](https://github.com/translation/rails/pull/50)). Thanks @ryanb!
 
**Important information:** a new directory with PO/MO files for the source language will be created in your `locales/gettext` directory. 
Don't worry, it's expected: the purpose is to unify fallback management.

## [v1.32](https://github.com/translation/rails/releases/tag/v1.32) (2022-05-20)

#### Fixes (bugs & defects):

 * Fix bad `html.erb` parsing when there is a `case` in it, using new gettext 3.4.3 Erubi parser. (cf. [ruby-gettext/gettext PR #91](https://github.com/ruby-gettext/gettext/pull/91)).

## [v1.31](https://github.com/translation/rails/releases/tag/v1.31) (2022-04-04)

#### Fixes (bugs & defects):

 * Fix Psych 4 breaking change when loading YAML files with aliases. See [issue #47](https://github.com/translation/rails/issues/47).

## [v1.30](https://github.com/translation/rails/releases/tag/v1.30) (2022-03-23)

#### New features:

 * Don't raise an issue for a conflicted `.translation_io` file anymore, but fix it directly.

## [v1.29](https://github.com/translation/rails/releases/tag/v1.29) (2022-02-01)

#### Fixes (bugs & defects):

 * Use `source_locale` as last fallback for GetText (instead of default "en").

## [v1.28](https://github.com/translation/rails/releases/tag/v1.28) (2022-01-17)

#### New features:

 * Bump GetText dependency to 3.4.2 to support:
   * Automatic locale fallbacks `fr_BE_Foo` -> `fr_BE` -> `fr` (cf. [ruby-gettext/gettext#89](https://github.com/ruby-gettext/gettext/issues/89))
   * Ruby 3.1 (cf. [ruby-gettext/gettext#92](https://github.com/ruby-gettext/gettext/issues/92))

## [v1.27](https://github.com/translation/rails/releases/tag/v1.27) (2021-10-06)

#### Fixes (bugs & defects):

 * Improve symbol/string consistency of `source_locale` and `target_locales`.

## [v1.26](https://github.com/translation/rails/releases/tag/v1.26) (2021-07-14)

#### Fixes (bugs & defects):

 * Fix syntax issue with Ruby 3.0 and release v1.25 (that is now yanked!)

## [v1.25](https://github.com/translation/rails/releases/tag/v1.25) (2021-07-14)

#### Fixes (bugs & defects):

 * Don't remove empty keys in `localization.xx.yml` files when `config.yaml_remove_empty_keys = true`, they may be useful for delimiters, etc.

## [v1.24](https://github.com/translation/rails/releases/tag/v1.24) (2021-06-15)

#### Fixes (bugs & defects):

 * Force max version of GetText (3.3.7) to avoid dependency to external online request (see [here](https://github.com/ruby-gettext/gettext/issues/85#issuecomment-861462382) for discussion).

#### New features:

 * Warnings when trying to init/sync with duplicate or empty `target_locales` in the configuration file.

## [v1.23](https://github.com/translation/rails/releases/tag/v1.23) (2021-01-17)

#### Fixes (bugs & defects):

 * Fix `ArgumentError: comparison of Pathname with String failed` if `I18n.load_path` contains a Pathname instead of a String ([#41](https://github.com/translation/rails/issues/41)). Thanks @11mdlow!

## [v1.22](https://github.com/translation/rails/releases/tag/v1.22) (2020-07-27)

#### Fixes (bugs & defects):

 * Fix deprecation warnings on Rails 6 ([#38](https://github.com/translation/rails/issues/38)).

#### New features:

 * Add `config.yaml_remove_empty_keys` option ([#37](https://github.com/translation/rails/pull/37)). Thanks @Uepsilon!

## [v1.21](https://github.com/translation/rails/releases/tag/v1.21) (2019-12-30)

#### Fixes (bugs & defects):

 * Refactor YAML source editions service ([#35](https://github.com/translation/rails/pull/35)).
   * Faster when many source editions are applied.
   * Better behavior when overriding the same key from a gem multiple times in a single sync.
   * Better paths normalization.

## [v1.20](https://github.com/translation/rails/releases/tag/v1.20) (2019-10-10)

#### Fixes (bugs & defects):

 * Improved `config.ignored_key_prefixes` to escape prefix from Regexp (prevent `.` to be any char).

## [v1.19](https://github.com/translation/rails/releases/tag/v1.19) (2019-09-13)

#### New features:

 * Add `config.yaml_line_width` option to wrap YAML files ([#19](https://github.com/translation/rails/issues/19)).
 * Add `config.gettext_object_delegate` option to avoid monkey-patching of Object ([#30](https://github.com/translation/rails/issues/30)).
 * Remove extra-whitespace in YAML files (issue with libYAML) ([#13](https://github.com/translation/rails/issues/13)).
 * Only write localization.xx.yml files if they are not empty.
 * Faster GetText parsing by ignoring paths using `Pathname#find` API instead of `Dir[].reject`. Big speed up if lots of files in the project (`node_modules` etc.)!
 * `translation:init`: won't rewrite source YAML files if that's not needed.

#### Fixes (bugs & defects):

 * Improved `config.ignored_key_prefixes` so `errors.message` would not ignore `errors.messageandstuff` key.

## [v1.18](https://github.com/translation/rails/releases/tag/v1.18) (2019-04-05)

#### New features:

 * Parse GetText strings from specified gems ([#28](https://github.com/translation/rails/pull/28)). Cf. https://github.com/translation/rails#gems-with-gettext-strings
 * Add `config.disable_yaml` option ([#26](https://github.com/translation/rails/issues/26))
 * Add `config.text_domain` and `config.binded_text_domains` options for GetText fine-tuning.

#### Fixes (bugs & defects):

 * Deprecation warning for #has_rdoc (Rubygems) ([#29](https://github.com/translation/rails/issues/29))

## [v1.17](https://github.com/translation/rails/releases/tag/v1.17) (2018-11-12)

#### New features:

 * New 'rake translation:sync_readonly' task for concurrent syncing (CI). See README.
 * Increase timeout for HTTP requests.

## [v1.16](https://github.com/translation/rails/releases/tag/v1.16) (2018-10-10)

#### New features:

 * Make the parsing compatible with .inky extension files (like erb templating) + add custom "erb-like" extensions in configuration.

## [v1.15](https://github.com/translation/rails/releases/tag/v1.15) (2018-09-27)

#### Fixes (bugs & defects):

 * Debug error and more specs for inconsistent YAML.

## [v1.14](https://github.com/translation/rails/releases/tag/v1.14) (2018-03-23)

#### New features:

 * Add params to each request to specify the version and the client (`gem_version` become `version` and `client` is always `rails`). Needed because now there are also Laravel projects on Translation.io (cf. https://github.com/translation/laravel).

## [v1.13](https://github.com/translation/rails/releases/tag/v1.13) (2018-02-19)

#### New features:

 * `rake translation:sync_and_show_purgeable` specifies the languages of the to-be-removed segments (because sometimes it will only delete a segment related to a removed language).

## [v1.12](https://github.com/translation/rails/releases/tag/v1.12) (2018-02-06)

#### Fixes (bugs & defects):

 * Exit with failure status code as opposed to implicit success in rescue blocks ([#22](https://github.com/translation/rails/pull/22)). Thanks @Dombo!

## [v1.11](https://github.com/translation/rails/releases/tag/v1.11) (2017-12-14)

#### Fixes (bugs & defects):

 * Update GetText dependency to >= 3.2.5 because of [That issue that evaluate strings of whole code](https://github.com/ruby-gettext/gettext/issues/56)
 * Call `send(:include)` to make it compatible with Ruby < 2.1

## [v1.10](https://github.com/translation/rails/releases/tag/v1.10) (2017-10-18)

#### New features:

 * Add `rake translation:sync_and_show_purgeable` task to see all unused keys/strings from Translation.io, using the current branch as reference ([#20](https://github.com/translation/rails/issues/20)).
 * Better file formats configuration in configuration file ([#14](https://github.com/translation/rails/pull/14)).
 * Better wording

#### Fixes (bugs & defects):

 * Debug error and more specs for inconsistent YAML.

## [v1.9](https://github.com/translation/rails/releases/tag/v1.9) (2017-02-16)

#### New features:

 * Messages with project URL on init/sync.
 * Check if no git conflicts in .translation_io hidden file.
 * Check syntax of generated ruby files for HAML/SLIM parsing.

## [v1.8.4](https://github.com/translation/rails/releases/tag/v1.8.4) (2016-12-02)

#### Fixes (bugs & defects):

 * Debug FlatHash.to_hash in a very specific case. This issue should not happen in consistent YAML files.

## [v1.8.3](https://github.com/translation/rails/releases/tag/v1.8.3) (2016-09-06)

#### Fixes (bugs & defects):

 * Don't set LC_TYPE to avoid warnings on Linux ([#7](https://github.com/translation/rails/pull/7))

## [v1.8.2](https://github.com/translation/rails/releases/tag/v1.8.2) (2016-07-20)

#### Fixes (bugs & defects):

 * Add missing wee and wen locales to Locale (Upper Sorbian and Lower Sorbian)

## [v1.8.1](https://github.com/translation/rails/releases/tag/v1.8.1) (2016-07-08)

#### Fixes (bugs & defects):

 * Removed clutter (lost puts)

## [v1.8](https://github.com/translation/rails/releases/tag/v1.8) (2016-07-06)

#### New features:

 * When `disable_gettext` is set to `true`, only load GetText libraries where needed to consume less memory.

## [v1.7](https://github.com/translation/rails/releases/tag/v1.7) (2016-04-19)

#### New features:

 * Force use of Gettext 3.2.2 because of bad Chinese (traditional/simplified) language management for previous versions of Gettext: [ruby-gettext/gettext#45](https://github.com/ruby-gettext/gettext/pull/45)

## [v1.6](https://github.com/translation/rails/releases/tag/v1.6) (2016-02-03)

#### Fixes (bugs & defects):

 * Debug check of source locale during init.

## [v1.5](https://github.com/translation/rails/releases/tag/v1.5) (2016-01-08)

#### New features:

 * Warning when source YAML text was changed in local project and in Translation.io.
 * Better warning messages for source and target locale consistencies during init.

## [v1.4](https://github.com/translation/rails/releases/tag/v1.4) (2015-12-11)

#### New features:

 * New configuration option : `disable_gettext` (gettext folder will not appear, and code will not be parsed for Gettext keys)
 * Better HAML and SLIM management for situations where `_` is used without parenthesis.

## [v1.3](https://github.com/translation/rails/releases/tag/v1.3) (2015-11-13)

#### New features:

 * Description text on top of localization files (YML).
 * New error message if languages of project and languages of configuration don't match.
 * New config option `config.ignored_source_files` to ignore some files for gettext parsing.

#### Fixes (bugs & defects):

 * Rescue Gettext parsing errors when this case happens `_ | %w()`. It will not fail and will raise a error message with the line of the issue.

## [v1.2](https://github.com/translation/rails/releases/tag/v1.2) (2015-07-03)

#### New features:

 * Ensure the correct locale can be set only for the current thread.

## [v1.1.3](https://github.com/translation/rails/releases/tag/v1.1.3) (2015-03-31)

#### New features:

 * Ensure GetText.locale is in sync with I18n's default locale at boot

## [v1.1.2](https://github.com/translation/rails/releases/tag/v1.1.2) (2015-03-18)

#### New features:

 * Better specs

#### Fixes (bugs & defects):

 * Fix HAML and SLIM parsing and import.

## [v1.1.0](https://github.com/translation/rails/releases/tag/v1.1.0) (2015-03-17)

#### New features:

 * Allow users to edit source text of YAML keys in Translation.io interface.
 * `rake translation:sync` will now get the new sources into the app before synchronizing translations.

## [v1.0.1](https://github.com/translation/rails/releases/tag/v1.0.1) (2015-01-08)

#### Fixes (bugs & defects):

 * Development dependencies resolution in gemspec.

## [v1.0.0](https://github.com/translation/rails/releases/tag/v1.0.0) (2015-01-08)

#### New features:

 * Better set_locale
 * POT/PO headers improvement when syncing.

#### Fixes (bugs & defects):

 * Adding a new language in your Rails project before syncing no longer breaks the PO header.

## [v0.9.7](https://github.com/translation/rails/releases/tag/v0.9.7) (2014-12-12)

#### New features:

 * Better localization files management :
   * Don't copy empty keys from source locale anymore
   * Keep keys that are only in targets
   * Manage transliterations
 * `LOCALIZATION_KEY_PREFIXES` option in gem
 * `rake translation:sync_and_purge` instead of `rake translation:purge`

#### Fixes (bugs & defects):

 * Debug charset issues

## [v0.9.5](https://github.com/translation/rails/releases/tag/v0.9.5) (2014-10-10)

#### New features:

 * Deep merge of YAML files before flatten
 * Custom ignored key prefixes

## [v0.9.4](https://github.com/translation/rails/releases/tag/v0.9.4) (2014-09-26)

#### New features:

 * Use HTTPS to sync with translation.io
 * Can deal with .ruby and .rabl files containing GetText localization

## [v0.9.3](https://github.com/translation/rails/releases/tag/v0.9.3) (2014-09-11)

#### Fixes (bugs & defects):

 * Fix issue when there is absolutely no YAML keys on the init (happens when not-english source language)

## [v0.9.2](https://github.com/translation/rails/releases/tag/v0.9.2) (2014-09-09)

#### Fixes (bugs & defects):

 * Does not break on empty YAML files loading

## [v0.9.1](https://github.com/translation/rails/releases/tag/v0.9.1) (2014-09-05)

#### New features:

 * Better management of reserved keys in YAML (no, n, true, false, etc.)

## [v0.9](https://github.com/translation/rails/releases/tag/v0.9) (2014-09-05)

#### New features:

 * Better management of localization keys in YAML (delimiters, boolean values, integers, etc.)

