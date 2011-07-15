require 'lucio/operators/macro'

module Lucio
  module Operator
    class Conditional < Macro
      def execute(lexicon, list)
        tree = list.tree
        condition = Lucio::Runner.run List.new(tree[0]), lexicon

        if condition
          Lucio::Runner.run List.new(tree[1]), lexicon
        else
          Lucio::Runner.run(List.new(tree[2]), lexicon) if tree.size > 2
        end
      end
    end
  end
end


