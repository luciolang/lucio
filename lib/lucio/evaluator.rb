class Evaluator
  def self.evaluate_tree(tree, global_lexicon, local_lexicon = Lexicon.new)
    unless tree.empty?
      operator, list = Lucio.behead tree

      if operator.kind_of?(Symbol) || operator.is_array?
        operator = evaluate_tree(operator, global_lexicon, local_lexicon) if operator.is_array?

        instruction = (operator.kind_of? Hash) ? operator : (local_lexicon.get(operator) || global_lexicon.get(operator))

        if instruction
          if instruction[:type] == :function
            list.map! {|item| (item.is_array?) ? item = evaluate_tree(item, global_lexicon, local_lexicon) : item}
            list.map! do |item|
              if item.kind_of? Symbol
                op = (local_lexicon.get item) || (global_lexicon.get item)
                unbound item if op.nil?
                item = op[:code].call global_lexicon, []
              else
                item
              end
            end

            instruction[:code].call global_lexicon, list

          elsif instruction[:type] == :macro
            instruction[:code].call global_lexicon, list

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
