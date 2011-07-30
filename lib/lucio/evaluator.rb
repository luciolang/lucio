class Evaluator
  def self.evaluate_tree(tree, lexicon)
    unless tree.empty?
      operator, list = Lucio.behead tree

      if operator.is_symbol? || operator.is_array?
        operator = evaluate_tree(operator, lexicon) if operator.is_array?

				instruction = (operator.is_hash?) ? operator : lexicon.get(operator)

        if instruction
          if instruction[:type] == :function
            list.map! {|item| (item.is_array?) ? item = evaluate_tree(item, lexicon) : item}
            list.map! do |item|
              if item.is_symbol?
                op = lexicon.get item
                unbound item if op.nil?
                item = op[:code].call lexicon, []
              else
                item
              end
            end

            result = instruction[:code].call lexicon, list

            result.is_hash? && result[:type] == :function ? result[:code].call(lexicon, list) : result

          elsif instruction[:type] == :macro
            result = instruction[:code].call lexicon, list

            # result.is_array? ? evaluate_tree(result, lexicon) : result

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

