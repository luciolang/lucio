module Lucio
  class List
    attr :tree, :evaluable

    def initialize(tree, evaluable = true)
      @tree = tree
      @evaluable = evaluable
    end

    def to_s
      flat(tree)
    end

    private
    def flat(content = '')
      '\'()'
    end
    
  end
end
