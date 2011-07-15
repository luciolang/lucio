module Lucio
  module Operator
    class Sum < Function
      def execute(lexicon, *items)
        if items.size == 0
          0
        else
          items.inject(0) {|sum, item| sum += item }
        end
      end
    end
  end
end
