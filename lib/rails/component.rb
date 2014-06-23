Rails::Railtie::ABSTRACT_RAILTIES << 'Rails::Component'

module Rails
  # Rails::Component is an abstract Engine subclass
  class Component < Rails::Engine

    # Append component's migrations
    # Taken from: http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    class << self
      def inherited(base)
        super

        # Register subclass as an Engine
        Rails::Engine.subclasses << base

        # Fix called_from
        # Taken from Rails::Engine.inherited
        base.called_from = begin
          call_stack = if Kernel.respond_to?(:caller_locations)
            caller_locations.map(&:path)
          else
            # Remove the line number from backtraces making sure we don't leave anything behind
            caller.map { |p| p.sub(/:\d+.*/, '') }
          end

          File.dirname(call_stack.detect { |p| p !~ %r[railties[\w.-]*/lib/rails|rack[\w.-]*/lib/rack] })
        end
      end
    end
  end
end
