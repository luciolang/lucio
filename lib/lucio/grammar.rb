require 'lucio'

module Lucio
  class Grammar < Treetop::Runtime::SyntaxNode
    def eval
      Lucio::Runner.run make_tree(elements)
    end

    private
      def make_tree(el)
        x = make_list(el)
        h = nil
        h, x = Lucio.behead(x) if x[0] == '\''

        Kernel::eval("Lucio::List.new(tree = #{x.inject('') {|x, y| x += "'#{y}',"}.strip.chop.gsub(/'\(',/, '[').gsub(/[,]?'\)'/, ']')}, evaluable = #{!h})")
      end

      def make_list(el, list = [])
        el.each do |e|
          methods = e.public_methods.reject{|i| i.to_s.chr != 'v'}.map{|i| i.to_s}.sort
          if methods.include?('value')
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

