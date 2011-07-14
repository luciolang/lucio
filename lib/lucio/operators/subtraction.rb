require 'lucio/operators/function'

module Lucio
  module Operator
    class Subtraction < Function
      def execute(*items)
        if items.size == 0
          0
        else
          head, tail = Lucio.behead(items)
          tail.empty? ? (head * -1) : tail.inject(head) {|subtraction, item| subtraction -= item }
        end
      end
    end
  end
end

