Rconsole
========

Rconsole is a Rails plugin which allows you to output debug messages from ruby code to the browser console.

## Installation

First add the following lines to your application `Gemfile`:

``` ruby
group :development do
  gem 'rconsole', '~> 0.1.1'
end
```

Then run `bundle install` to update your's gems bundle.

Now you need include `rconsole.js` asset file by adding the following lines to
your layout view (Rails only):

``` ruby
javascript_include_tag(:rconsole) if Rails.env.development?
```

or simply:

```ruby
javascript_include_rconsole_tag
```

Really easy!

## Usage

Just use `rconsole.log` anywhere you need, e.g:

``` ruby
class HomeController < ActionController::Base
  respond_to :html
  
  def index
    rconsole.log 'Hello from Ruby!'
    respond_with({})
  end
end
```

Then you will see the message on your browser console. Just like this:

![Hello from Ruby!](https://dl.dropboxusercontent.com/u/11845683/assets/hello-from-ruby.png)

Enjoy!


## Versioning

Rconsole uses RubyGems Rational Versioning Policy.

## Copyright

See LICENSE file.
