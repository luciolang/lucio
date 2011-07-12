module Lucio
  class Runner
    def self.run(obj_tree)
      tree = obj_tree.tree

      if obj_tree.evaluable
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
                first = run List.new(start)
              else
                first = eval start
              end

              tail.inject(first) do |result, item| 
                if item.kind_of? Array
                  i = run List.new(item)
                else
                  i = eval item
                end

                instruction.execute(result, i)
              end
            elsif instruction.type == :macro
              instruction.execute List.new(list)
            else
              puts "Unknown instruction type: #{instruction.type}"
            end
        end
      else
        obj_tree
      end
    end
  end
end
