require 'lucio/operators/function'

module Lucio
  module Operator
    class Equality < Function
      def execute(current, expected)
        current == expected
      end
    end
  end
end
