module Tire
  module Search

    class Sort
      def initialize(&block)
        @value = []
        block.arity < 1 ? self.instance_eval(&block) : block.call(self) if block_given?
      end

      def by(name, options = nil)
        direction = options unless options.is_a?(Hash)
        @value << ( direction ? { name => direction } : { name => options } )
        self
      end

      def to_ary
        @value
      end

      def to_json(options={})
        @value.to_json
      end
    end

  end
end
