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
    def flat(list)
      result = "#{'(' if list.empty?}#{list.inject('(') do |result, item|
        result += "#{item} "
      end.chop})"
    end
    
  end
end
