require 'lucio/operators/function'

module Lucio
  module Operator
    class Subtraction < Function
      def execute(minuend, subtrahend)
        minuend - subtrahend
      end
    end
  end
end

