require 'lucio/operators/function'

module Lucio
  module Operator
    class Multiplication < Function
      def execute(*items)
        if items.size == 0
          0
        else
          items.inject(1) {|multiplication, item| multiplication *= item }
        end
      end
    end
  end
end

