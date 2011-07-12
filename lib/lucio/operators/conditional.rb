require 'lucio/operators/macro'

module Lucio
  module Operator
    class Conditional < Macro
      def execute(list)
        tree = list.tree
        condition = Lucio::Runner.run List.new(tree[0])

        if condition
          Lucio::Runner.run List.new(tree[1])
        else
          Lucio::Runner.run List.new(tree[2]) if tree.size > 2
        end
      end
    end
  end
end


