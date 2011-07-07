require 'lucio'

module Lucio
  class Grammar < Treetop::Runtime::SyntaxNode
    def eval
      tree = make_tree(elements)
      Lucio::Runner.run(tree)
    end

    private
      def make_tree(el)
        Kernel::eval(make_list(el).inject('') {|x, y| x += "'#{y}',"}.strip.chop.gsub(/'\(',/, '[').gsub(/[,]?'\)'/, ']'))
      end

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

