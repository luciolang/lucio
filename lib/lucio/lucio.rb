class Lucio
  def initialize(lexicon = Lexicon.new)
    @lexicon = lexicon
    @lexicon.add_function :+    , lambda{|items| items.reduce(0, :+)}
    @lexicon.add_function :*    , lambda{|items| items.reduce(1, :*)}
    @lexicon.add_function :-    , lambda{|items| case when items.size == 0; 0; else; head, tail = Lucio.behead(items); tail.empty? ? (head * -1) : tail.inject(head) {|subtraction, item| subtraction -= item}; end}
    @lexicon.add_function :/    , lambda{|items| case when items.size == 0; raise 'expects at least 1 arguments, given 0'; when items.size == 1; 1.0 / items[0]; else items.reduce{|result, item| result = result / item.to_f}; end}
    @lexicon.add_function :true , lambda{ true }
    @lexicon.add_function :false, lambda{ false }
    @lexicon.add_function :eql? , lambda{|items| items.map{|item| item == items[0]}.reduce{|memo, item| memo && item}}
    @lexicon.add_macro    :let  , lambda{|lexicon, items| lexicon.add_function(items[0].to_sym, lambda{(items[1].kind_of? Array) ? evaluate_tree(items[1]) : items[1]})}
    @lexicon.add_macro    :if   , lambda{|lexicon, items| evaluate_tree(items[0]) ? evaluate_tree(items[1]) : evaluate_tree(items[2]) }
  end

  def eval(source_code)
    tree = Sparse.new.parse(source_code)
    ret = nil
    tree.each {|list| ret = evaluate_tree list}
    ret
  end

  private
  def evaluate_tree(tree)
    unless tree.empty?
      operator, list = Lucio.behead tree
      
      if operator.kind_of? Symbol
        instruction = @lexicon.get operator

        if instruction
          if instruction[:type] == :function
            list.map! {|item| (item.kind_of? Array) ? item = evaluate_tree(item) : item}
            list.map! {|item| (item.kind_of? Symbol) ? item = @lexicon.get(item)[:code].call : item}

            instruction[:code].call list

            elsif instruction[:type] == :macro
            instruction[:code].call @lexicon, list

          end

        else
          raise UnboundSymbolException.new "Unbound symbol #{operator.to_s}"

        end
      else
        operator
      end

    end
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end
end

class UnboundSymbolException < Exception
end
