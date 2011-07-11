require 'lucio/operators/macro'

module Lucio
  module Operator
    class Conditional < Macro
      def execute(tree)
        condition = Lucio::Runner.run(tree[0])

        if condition
          Lucio::Runner.run(tree[1])
        else
          Lucio::Runner.run(tree[2]) if tree.size > 2
        end
      end
    end
  end
end


