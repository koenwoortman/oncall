# 🤙 Oncall

[![Gem Version](https://badge.fury.io/rb/oncall.svg)](https://badge.fury.io/rb/oncall)

> Oncall is a DSL for testing JSON API's.

#### Install
```
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
```
$ oncall --init
```

Add tests
```
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
```
$ oncall
```

## Usage


## Configuration


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


## Acknowledgments

*  Inspired by [RSpec](https://github.com/rspec/rspec).
*  Uses [Ruby JSON Schema Validator](https://github.com/ruby-json-schema/json-schema).
