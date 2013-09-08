Rconsole
========

Rconsole is a plugin which allows you to output debug messages from ruby code to the
browser console.

## Installation

First add the following lines to your application `Gemfile`:

``` ruby
group :development
  gem 'rconsole', '~> 0.1.0'
end
```

Then run `bundle install` to update your's gems bundle.

Now you need include rconsole.js asset file by adding the following lines to
your layout view (slim syntax used):

``` ruby
javascript_include_tag(:rconsole) if Rails.env.development?
```

## Usage

Just use `rconsole.log` anywhere you need, e.g:

``` ruby
class SomeController < ActionController::Base
  def some_action
    rconsole.log 'Hello from Ruby!'
  end
end
```

Then you will see the message on your browser console. Just like this:

![Hello from Ruby!](https://dl.dropboxusercontent.com/u/11845683/hello_from_ruby.png)

Enjoy!

## Contributors

+ [Sergey Rezvanov](http://github.com/rezwyi)

## Copyright

See LICENSE file.