module Lucio
  class Grammar < Treetop::Runtime::SyntaxNode
    def eval
      puts '\n---'
      p elements
      recur(elements, '')
      nil
    end

    def content
      [:hmmm, 'hein?']
    end

    private
    def recur(el, sp)
      el.each do |e| 
        if e.nonterminal? 
          recur(e.elements, sp + ' ') 
        else
          print "#{sp}|#{e.text_value}|"
          begin
            p e.content
          rescue
          end
        end
      end
    end
  end
end
