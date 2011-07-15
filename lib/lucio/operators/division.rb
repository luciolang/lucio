require 'lucio/operators/function'

module Lucio
  module Operator
    class Division < Function
      def execute(lexicon, *items)
        if items.size == 0
          0
        else
          items.inject {|result, item| result = result / item.to_f }
        end
      end
    end
  end
end

