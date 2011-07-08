require 'lucio/operators/function'

module Lucio
  module Operator
    class Multiplication < Function
      def execute(multiplicand, multiplier)
        multiplicand * multiplier
      end
    end
  end
end

