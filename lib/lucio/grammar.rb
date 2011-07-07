module Lucio
  class Grammar < Treetop::Runtime::SyntaxNode
    def eval
      make_tree(make_list(elements))
    end

    private
      def make_list(el, list = [])
        el.each do |e|
          unless e.empty? || e.text_value.strip.empty?
            if e.nonterminal?
              list = make_list(e.elements, list)
            else
              list << e.text_value
            end
          end
        end
        list
      end
  end
end

