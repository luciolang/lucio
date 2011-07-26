class Macro
  def initialize(declaration, lexicon)
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

  def call(global_lexicon, list)
    signature = @signatures[list.size] 
    parameters = signature[:parameters]

    result = Array.new(signature[:code][0])
    
    p 'b4', result, list, parameters

    list.size.times do |item|
      result.map! {|part| p '', item, part, list[item], parameters[item], part == parameters[item], '---'; part == parameters[item] ? list[item] : part}
    end

    p 'aftr', result

  end
end
