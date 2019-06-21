module Property
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
