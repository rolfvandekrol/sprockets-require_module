# Sprockets Require Module
Sprockets Require Module provides a sprocket directive `require_module` that allows wrapping a number of assets in a module and requiring them at once.

## Installation

In order to install `sprockets-require_module` into your project, add 

```ruby
gem "sprockets-require_module"
```

to your `Gemfile`.

## Usage

Provide a module that has an `assets` method. For example:

```ruby
module MyProject
  module Assets
    extend self
    
    def assets
      ['myproject/core', 'myproject/something_else']
    end
  end
end
```

Make sure the module is either loaded or auto loadable.

In a sprockets manifest, add a reference to this module, like this:

```js
//= require_module my_project/assets
```

The module does not have to be an actual module. As long as it is a constant that has an `assets` method, it's fine. So it can be class too.