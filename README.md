# Scrubba: Clean your strings!

[![Build Status](https://travis-ci.org/jmdeldin/scrubba.svg)](https://travis-ci.org/jmdeldin/scrubba) [![Code Climate](https://codeclimate.com/github/jmdeldin/scrubba/badges/gpa.svg)](https://codeclimate.com/github/jmdeldin/scrubba)

Scrubba is a tiny gem to strip and normalize whitespace. It provides a few convenient methods for working with ActiveRecord/ActiveModel/ActiveAttr/ActiveNode attributes too.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scrubba'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scrubba

## Usage

Standalone:

```ruby
require "scrubba"

some_str = " foo \t bar "
Scrubba.strip(some_str) #=> "foo \t bar"
Scrubba.collapse(some_str) #=> " foo bar "
```

In an ActiveRecord model:

```ruby
require "scrubba"

class Post < ActiveRecord::Base
  include Scrubba::ActiveMethods

  scrub :title, :slug, strip: true
  scrub :body, collapse: true
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmdeldin/scrubba.

Protip: If you use Emacs, insert a Unicode space in your test data with <kbd>M-x insert-char</kbd> and verify it with <kbd>M-x describe-char</kbd>.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Author

[Jon-Michael Deldin](http://www.jmdeldin.com), [@jmdeldin](http://twitter.com/jmdeldin)
