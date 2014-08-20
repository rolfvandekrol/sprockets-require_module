# Sprockets Require Module

[![Gem Version](https://badge.fury.io/rb/sprockets-require_module.svg)](http://badge.fury.io/rb/sprockets-require_module) [![Code Climate](https://codeclimate.com/github/rolfvandekrol/sprockets-require_module/badges/gpa.svg)](https://codeclimate.com/github/rolfvandekrol/sprockets-require_module) [![Dependency Status](https://gemnasium.com/rolfvandekrol/sprockets-require_module.svg)](https://gemnasium.com/rolfvandekrol/sprockets-require_module)

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

The `assets` method should return an `Enumerable`.

### Asset caching

Sprockets caches all asset files, also on development, to prevent unnecessary asset compilation. This behavior conflicts a bit with this gem. Luckily Sprockets allows us to register files that are dependencies of the assets. When these dependencies change, the assets that depend on them, are recompiled.

By default Sprockets Require Module registers the file that defines the `assets` method as a dependency. That means that in the example `MyProject::Assets` module, you can change the list of returned asset paths and it will all update perfectly well, because Sprockets will detect that the file where the module is defined has been altered and will invalidate the relevant cache parts.

If you create a more complicated implementation, you might need to spend a little more effort to make sure Sprockets cache does not prevent asset recompilation. If you for example create a class that receives it's paths from another part of the application, you will need to mark those other parts as dependencies.

If the constant that you mention in your `require_module` directive has an `asset_dependencies` method, the return value of this method is used as the list of dependencies, instead of the default behavior. 
