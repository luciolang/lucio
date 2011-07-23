class Function
  def initialize(code, lexicon, lucio)
    @code = code
    @lucio = lucio
  end

  def call(global_lexicon, list)
    local_lexicon = Lexicon.new
    tree = Lucio.behead(Lucio.behead(@code[0])[1])[1]
    @lucio.evaluate_tree(tree[0], local_lexicon)
  end
end
