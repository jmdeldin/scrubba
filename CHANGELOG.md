# Unreleased

- *BREAKING CHANGE*: `scrub` and `normalize` have been renamed to
  `strip` and `collapse` based on usage and feedback
  ([#1](https://github.com/jmdeldin/scrubba/pull/1)). The new way to
  declare which attributes you want to strip/collapse whitespace from
  is:

      scrub :some_attr, strip: true, collapse: true

# 0.2.0 (2015-08-29)

- *BREAKING CHANGE*: Switched from `extend` to `include` for consistency
  with gems and DRY-er code

# 0.1.0 (2015-08-28)

Initial release
