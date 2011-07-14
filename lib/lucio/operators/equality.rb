require 'lucio/operators/function'

module Lucio
  module Operator
    class Equality < Function
      def execute(*items)
        items[0] == items[1]
      end
    end
  end
end
