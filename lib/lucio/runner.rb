module Lucio
  class Runner
    def self.run(tree)
      case
        when tree.empty?
          nil
        when tree.size == 1
          Kernel::eval(tree[0])
        else
          operator, list = Lucio.behead(tree)
          start, tail = Lucio.behead(list)
          first = eval(start)

          instruction = Lexicon.get operator

          tail.inject(first) do |result, item| 
            eval("#{result} + #{eval(item)}")
          end

          # value = tail.inspect(Kernel::eval(start)){|result, item| p instruction.params(result, item)}
      end
    end
  end
end
