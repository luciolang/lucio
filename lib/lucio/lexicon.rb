class LexiconStack
  def initialize
    @stack = []
    begin_scope
  end

  def begin_scope
    @stack.push Lexicon.new
  end

  def end_scope
    @stack.pop
  end

  def get(operator)
    @stack.size.times do |item|
      op = @stack[(@stack.size - 1) - item].get(operator)
      if op
        return op
      end
    end
    nil
  end

  def add_function(token, code)
    @stack.last.add_function token, code
  end

  def add_macro(token, code)
    @stack.last.add_macro token, code
  end
end

class Lexicon
  def initialize
    @operator_list = {}
  end

  def add_function(token, code)
    @operator_list[token] = {:type => :function, :code => code}
  end

  def add_macro(token, code)
    @operator_list[token] = {:type => :macro, :code => code}
  end

  def get(operator)
    @operator_list[operator]
  end
end
