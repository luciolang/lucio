class Macro
  def initialize(declaration)
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

      raise SyntaxError.new 'Expected syntax quote' unless signature.first == :syntax_quote
      signature = signature.drop(1)

      @signatures[parameters.size] = {:parameters => parameters, :code => signature}
    end
  end

  def call(lexicon, list)
    signature = @signatures[list.size] 
    parameters = signature[:parameters]
    code = Array.new(signature[:code][0])

    replaced = replace(list, parameters, code)

    Evaluator.evaluate_tree replaced, lexicon

  end

  def replace(list, parameters, result)
    list.size.times do |item|
      result.map! do |part|
        part = part == parameters[item] ? list[item] : part
      end
    end

    result
  end
end
