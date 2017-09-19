module Kanban
  module Middleware
    def included(clazz)
      clazz.instance_eval do
        define_method(:bind_actions) do |name|
          require_relative File.expand_path(__FILE__, "../actions/#{name}_actions")
          @actions ||= []


          @actions << Object.const_get("#{name.capitalize}Actions").new
        end

        define_method(:actions) do

        end
      end
    end
  end
end
