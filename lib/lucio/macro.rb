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

    result = replace(list, parameters, Array.new(signature[:code][0]))

    p 'call', result

    result

  end

  def replace(list, parameters, result)
    puts ''
    p 'b4', result
    list.size.times do |item|
      result.map! do |part|
        if part.is_array?
          part = replace(list, parameters, part)
        else
          part == parameters[item] ? list[item] : part
        end
      end
    end

    p 'aftr', result
    result
  end
end
