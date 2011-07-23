class Function
  def initialize(code, lexicon)
    @code = code
  end

  def call(global_lexicon, list)
    local_lexicon = Lexicon.new
    tree = Lucio.behead(Lucio.behead(@code[0])[1])[1]
    Evaluator.evaluate_tree(tree[0], global_lexicon, local_lexicon)
  end
end
