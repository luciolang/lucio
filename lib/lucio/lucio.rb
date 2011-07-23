class Array
  def to_sym
    to_s.to_sym
  end
end

class Lucio
  def initialize(lexicon = Lexicon.new)
    @lexicon = lexicon
    @lexicon.add_function :+      , lambda{|lexicon, items| items.reduce(0, :+)}
    @lexicon.add_function :*      , lambda{|lexicon, items| items.reduce(1, :*)}
    @lexicon.add_function :-      , lambda{|lexicon, items| case when items.size == 0; 0; else; head, tail = Lucio.behead(items); tail.empty? ? (head * -1) : tail.inject(head) {|subtraction, item| subtraction -= item}; end}
    @lexicon.add_function :/      , lambda{|lexicon, items| case when items.size == 0; raise 'expects at least 1 arguments, given 0'; when items.size == 1; 1.0 / items[0]; else items.reduce{|result, item| result = result / item.to_f}; end}
    @lexicon.add_function :true   , lambda{|lexicon, items| true }
    @lexicon.add_function :false  , lambda{|lexicon, items| false }
    @lexicon.add_function :eql?   , lambda{|lexicon, items| items.map{|item| item == items[0]}.reduce{|memo, item| memo && item}}
    @lexicon.add_function :lt     , lambda{|lexicon, items| items[0] < items[1]}

    @lexicon.add_macro    :define , lambda{|lexicon, items| define lexicon, items }
    @lexicon.add_macro    :if     , lambda{|lexicon, items| evaluate_tree(items[0]) ? evaluate_tree(items[1]) : evaluate_tree(items[2]) }
    @lexicon.add_macro    :fun    , lambda{|lexicon, items| lexicon.add_function items.to_sym, Function.new(items, lexicon, self) }
  end

  def eval(source_code)
    tree = Sparse.new.parse(source_code)
    ret = nil
    tree.each {|list| ret = evaluate_tree list}
    ret
  end

  def self.behead(list)
    [list[0], list.drop(1)]
  end

  def evaluate_tree(tree, local_lexicon = Lexicon.new)
    unless tree.empty?
      operator, list = Lucio.behead tree
      
      if operator.kind_of?(Symbol) || operator.kind_of?(Array)
        operator = evaluate_tree(operator) if operator.kind_of?(Array)

        instruction = (operator.kind_of? Hash) ? operator : @lexicon.get(operator)

        if instruction
          if instruction[:type] == :function
            list.map! {|item| (item.kind_of? Array) ? item = evaluate_tree(item) : item}
            list.map! do |item|
              if item.kind_of? Symbol
                op = @lexicon.get item
                unbound item if op.nil?
                item = op[:code].call @lexicon, []
              else
                item
              end
            end

            instruction[:code].call @lexicon, list

          elsif instruction[:type] == :macro
            instruction[:code].call @lexicon, list

          end

        else
          unbound operator

        end
      else
        operator
      end

    end
  end

  private
  def define(lexicon, items)
    lmb = lambda do |lexicon, it|
      if items[1].kind_of? Array
        evaluate_tree(items[1])
      elsif items[1].kind_of? Function
        items[1].call lexicon, it
      else
        items[1]
      end
    end

    lexicon.add_function(items[0].to_sym, lmb)
  end

  def unbound symbol
    raise UnboundSymbolException.new("Unbound symbol: #{symbol.to_s}")
  end
end

class UnboundSymbolException < Exception
end
