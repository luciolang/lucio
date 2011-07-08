require 'lucio/operators/function'

module Lucio
  module Operator
    class Division < Function
      def execute(dividend, divisor)
        dividend.to_f / divisor.to_f
      end
    end
  end
end

