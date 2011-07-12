require 'lucio'

module Lucio
  class Grammar < Treetop::Runtime::SyntaxNode
    def eval
      tree = make_tree(elements)
      Lucio::Runner.run(tree)
    end

    private
      def make_tree(el)
        x = make_list(el)
        h = nil
        h, x = Lucio.behead(x) if x[0] == '\''

        l = "Lucio::List.new(tree = #{x.inject('') {|x, y| x += "'#{y}',"}.strip.chop.gsub(/'\(',/, '[').gsub(/[,]?'\)'/, ']')}, evaluable = #{!h})";
        r = Kernel::eval(l)
      end

      def make_list(el, list = [])
        el.each do |e|
          if e.public_methods.map{|i| i.to_s}.include?('value')
            list << e.value
          else
            unless e.empty? || e.text_value.strip.empty?
              if e.nonterminal?
                list = make_list(e.elements, list)
              else
                list << e.text_value
              end
            end
          end
        end
        list
      end
  end
end

