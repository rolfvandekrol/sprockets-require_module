require 'active_support'
require 'active_support/core_ext/string/inflections'

require 'sprockets'

Sprockets::DirectiveProcessor.class_eval do
  protected
    def process_require_module_directive name
      mod = name.camelize.constantize
      mod.assets.each do |path|
        context.require_asset(path)
      end
    end
end