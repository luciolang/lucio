class Lucio
  def initialize(lexicon = Lexicon.new)
    @lexicon = lexicon
    @lexicon.add_function :+, lambda{|items| items.inject(0){|result, item| result += item}}
  end

  def eval(source_code)
    tree = Sparse.new.parse(source_code)
    ret = nil
    tree.each {|list| ret = evaluate_tree list}
    ret
  end

  private
  def evaluate_tree(tree)
    unless tree.empty?
      operator, list = Lucio.behead tree
      if operator.kind_of? Array
        evaluate_tree(operator)
      else
        instruction = @lexicon.get operator

        if instruction
          if instruction[:type] == :function
            instruction[:code].call list
          end

        else
          raise "Unbound symbol #{operator.to_s}"

        end

      end

    end
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end
end
