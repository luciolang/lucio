class Evaluator
  def self.evaluate_tree(tree, global_lexicon, local_lexicon = Lexicon.new)
    unless tree.empty?
      operator, list = Lucio.behead tree

      if operator.is_symbol? || operator.is_array?
        operator = evaluate_tree(operator, global_lexicon, local_lexicon) if operator.is_array?

        instruction = (operator.is_hash?) ? operator : (local_lexicon.get(operator) || global_lexicon.get(operator))

        if instruction
          if instruction[:type] == :function
            list.map! {|item| (item.is_array?) ? item = evaluate_tree(item, global_lexicon, local_lexicon) : item}
            list.map! do |item|
              if item.is_symbol?
                op = (local_lexicon.get item) || (global_lexicon.get item)
                unbound item if op.nil?
                item = op[:code].call global_lexicon, []
              else
                item
              end
            end

            result = instruction[:code].call(global_lexicon, list)

            result.is_hash? && result[:type] == :function ? result[:code].call(global_lexicon, list) : result

          elsif instruction[:type] == :macro
            result = instruction[:code].call global_lexicon, list
            result
          
          end

        else
          unbound operator

        end
      else
        operator
      end

    end
  end

  private
  def self.unbound symbol
    raise UnboundSymbolException.new("Unbound symbol: #{symbol.to_s}")
  end

end
