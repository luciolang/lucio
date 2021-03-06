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

  def call(lexicon, list)
    lexicon.begin_scope

    signature = @signatures[list.size]
    if signature
      list.size.times {|item| lexicon.add_function signature[:parameters][item], lambda {|lexicon, items| list[item]}}

      result = Evaluator.evaluate_tree(signature[:code], lexicon)
    else
      raise ArgumentError.new "Unexpected number of parameters: #{list.size}"
    end

    lexicon.end_scope
    result
  end
end
