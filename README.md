# 🤙 Oncall

[![Build Status](https://travis-ci.org/koenwoortman/oncall.svg?branch=master)](https://travis-ci.org/koenwoortman/oncall)
[![Gem Version](https://badge.fury.io/rb/oncall.svg)](https://badge.fury.io/rb/oncall)

> Oncall is a DSL for testing JSON API's.

#### Install
```sh
$ gem install oncall
```


#### Table of content

* [Get started](#get-started)
* [Usage](#usage)
* [Configuration](#configuration)
* [License](#license)
* [Acknowledgments](#acknowledgments)


## Get started

Initialize
```sh
$ oncall --init
```

Add tests
```ruby
group :user do
  header 'Content-Type' => 'application/json'

  schema = {
    'type' => 'object',
    'required' => ['foo'],
    'properties' => {
      'foo' => { 'type' => 'string' }
    }
  }

  param id: 1

  get '/users/:id' do
    status 200
    validate schema
  end
end
```

Run them
```sh
$ oncall
```

## Usage

```
Usage: oncall [options]
        --env ENV                    Specify the environment to test against
        --path PATH                  Set the path for finding tests
        --pattern PATTERN            Load files matching pattern
        --exclude PATTERN            Exclude files matching pattern
        --group GROUP                Filter tests by group
        --persist PATH               Write output to a file instead of $stdout
        --config PATH                Path to the config file
        --init                       Initialize your project with Oncall
        --verbose                    Increases the verbosity level for a more detailed output
        --version                    Display the version
        --help                       This help message
```


## Configuration


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Acknowledgments

*  Inspired by [RSpec](https://github.com/rspec/rspec).
*  Uses [Ruby JSON Schema Validator](https://github.com/ruby-json-schema/json-schema).
