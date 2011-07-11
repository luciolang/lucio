module Lucio
  class Runner
    def self.run(tree)
      case
        when tree.empty?
          nil
        when tree.size == 1
          eval(tree[0])
        else
          operator, list = Lucio.behead(tree)
          start, tail = Lucio.behead(list)

          instruction = Lexicon.get operator

          if instruction.type == :function
            if(start.kind_of? Array)
              first = run start
            else
              first = eval start
            end

            tail.inject(first) do |result, item| 
              if item.kind_of? Array
                i = run item
              else
                i = eval item
              end

              instruction.execute(result, i)
            end
          elsif instruction.type == :macro
            instruction.execute(list)
          else
            puts instruction.type
          end
        end
    end
  end
end
