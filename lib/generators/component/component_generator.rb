module Rails
  module Components
    module Generators
      class ComponentGenerator < Rails::Generators::NamedBase
        namespace "component"
        desc "Generate a component with the given NAME on the current app"

        class_option :template,
          type: :string,
          default: 'default',
          desc: "The component template"
      end
    end
  end
end

