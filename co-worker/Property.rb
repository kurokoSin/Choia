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

  def to_hash()
    hash = {}
    self.instance_variables.each do |var|
      # hash[var] = self.instance_variable_get var
      hash[var.to_s.sub(/^@/,'')] = self.instance_variable_get var
    end
    hash
  end

  def to_json()
    self.to_hash.to_json
  end
end
