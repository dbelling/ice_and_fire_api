# IceAndFireApi

[![Gem Version](https://badge.fury.io/rb/ice_and_fire_api.svg)](https://badge.fury.io/rb/ice_and_fire_api)
[![Downloads](https://img.shields.io/gem/dt/ice_and_fire_api.svg)](https://rubygems.org/gems/ice_and_fire_api)
[![Build Status](https://travis-ci.org/dbelling/ice_and_fire_api.png?branch=master)](https://travis-ci.org/dbelling/ice_and_fire_api)

![Game of Thrones](http://www.cheatsheet.com/wp-content/uploads/2016/01/GoT-1024x512.jpg)

This gem provides an interface for the [Ice And Fire API](https://anapioficeandfire.com/). It was motivated by the current [lack of support](https://anapioficeandfire.com/Documentation#library-elixir) for a ruby library. More response fields and schema information for `House`, `Character`, and `Book` resources is available through the [documentation](https://anapioficeandfire.com/Documentation#root).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ice_and_fire_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ice_and_fire_api

## Usage

The [Ice and Fire API](https://anapioficeandfire.com/) contains endpoints for the following resources:

  * [`Root`](https://anapioficeandfire.com/Documentation#root)

    **Fetch information about all resources available in the API.**

    ```ruby
      IceAndFireApi::Root.fetch
    ```

  * [`Books`](https://anapioficeandfire.com/Documentation#books)

    **Find a book resource from its associated ID.**

    ```ruby
      IceAndFireApi::Book.find(5)
    ```

    or

    **Find a book resource through a [filter](https://github.com/joakimskoog/AnApiOfIceAndFire/blob/master/AnApiOfIceAndFire/Content/Documentation/Books.md#filtering-books).**

    ```ruby
      IceAndFireApi::Book.find_by({toReleaseDate: '2010-09-22T00:00:00', pageSize: 5})
    ```
  * [`Characters`](https://anapioficeandfire.com/Documentation#characters)

    **Find a character resource from its associated ID.**

    ```ruby
      IceAndFireApi::Character.find(88)
    ```

    or

    **Find a character resource through a [filter](https://github.com/joakimskoog/AnApiOfIceAndFire/blob/master/AnApiOfIceAndFire/Content/Documentation/Characters.md#filtering-characters).**

    ```ruby
      IceAndFireApi::Character.find_by(name: 'Eddard Stark')
    ```

  * [`Houses`](https://anapioficeandfire.com/Documentation#houses)

    **Find a house resource from its associated ID.**

    ```ruby
      IceAndFireApi::House.find(42)
    ```

    or

    **Find a house resource through a [filter](https://github.com/joakimskoog/AnApiOfIceAndFire/blob/master/AnApiOfIceAndFire/Content/Documentation/Houses.md#filtering-houses).**

    ```ruby
      IceAndFireApi::House.find_by({region: 'The North', pageSize: 15})
    ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dbelling/ice_and_fire_api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
