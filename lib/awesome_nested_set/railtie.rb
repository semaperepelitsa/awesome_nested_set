require "rails/railtie"

module CollectiveIdea
  module Acts
    module NestedSet
      class Railtie < Rails::Railtie
        initializer "awesome_nested_set.active_record" do
          ActiveSupport.on_load(:active_record) {
            require 'awesome_nested_set/awesome_nested_set'
            extend CollectiveIdea::Acts::NestedSet
          }
        end

        initializer "awesome_nested_set.action_view" do
          ActiveSupport.on_load(:action_view) {
            require 'awesome_nested_set/helper'
            include CollectiveIdea::Acts::NestedSet::Helper
          }
        end
      end
    end
  end
end
