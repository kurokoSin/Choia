module AbstractProperty
  def property(name)
    module_eval %-
      def #{name}(*arg)
        if arg.empty?
	  @#{name}
	else
	  @#{name} = arg.first
	end
      end
    -
  end
end

class Property 
  extend AbstractProperty 

  def initialize(&block)
    case block.arity
      when 0 ; instance_eval &block
      else   ; yield self
    end if block
  end
end
