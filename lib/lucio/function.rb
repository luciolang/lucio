class Function
  def initialize(code)
    @code = code
    p 'Hello!', @code
  end

  def call(global_lexicon, list)
    local_lexicon = Lexicon.new
    puts 'Calling doctor love'
    p list
  end
end
