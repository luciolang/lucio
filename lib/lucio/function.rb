class Function
  def initialize(declaration, lexicon)
    if declaration.empty? || !declaration.first.is_array? || declaration.first.empty?
      raise SyntaxError.new 'Expected parameter list'
    end

    @signatures = {}

    declaration.each do |signature|
      raise SyntaxError.new 'Expected vector' unless signature.first == :'['
      parameters = []
      signature = signature.drop(1)
      until signature.first == :']'
        parameters << signature.first
        signature = signature.drop(1)
      end

      signature = signature.drop(1)

      @signatures[parameters.size] = {:parameters => parameters, :code => signature.first}
    end

  end

  def call(global_lexicon, list)
    local_lexicon = Lexicon.new

    signature = @signatures[list.size]
    if signature
      list.size.times {|item| local_lexicon.add_function signature[:parameters][item], lambda {|lexicon, items| list[item]}}

      Evaluator.evaluate_tree(signature[:code], global_lexicon, local_lexicon)
    else
      raise ArgumentError.new "Unexpected number of parameters: #{list.size}"
    end
  end
end
