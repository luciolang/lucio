module Lucio
  class Runner
    def self.run(obj_tree)
      tree = obj_tree.tree

      if obj_tree.evaluable
        case
          when tree.empty?
            nil
          when tree.size == 1
            item = tree[0]
            instruction = Lexicon.get item
            if instruction
              instruction.execute
            else
              begin
                eval(item)
              rescue Exception => e
                raise "Invalid or unknown symbol: #{item}", e.backtrace
              end
            end
          else
            operator, list = Lucio.behead(tree)
            start, tail = Lucio.behead(list)

            instruction = Lexicon.get operator

            raise "Invalid or unknown operator: #{operator}" unless instruction

            if instruction.type == :function
              if(start.kind_of? Array)
                first = run List.new(start)
              else
                first = eval start
              end

              if tail.empty?
                instruction.execute(first)
              else
                tail.inject(first) do |result, item| 
                  if item.kind_of? Array
                    i = run List.new(item)
                  else
                    i = eval item
                  end

                  instruction.execute(result, i)
                end
              end

            elsif instruction.type == :macro
              instruction.execute List.new(list)
            end
        end
      else
        obj_tree
      end
    end
  end
end
