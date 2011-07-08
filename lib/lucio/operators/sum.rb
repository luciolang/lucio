require 'lucio/operators/function'

module Lucio
  module Operator
    class Sum < Function
      def execute(addend, augend)
        addend + augend
      end
    end
  end
end
