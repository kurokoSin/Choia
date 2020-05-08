# 文字列連結方法がDBによって異なるため、それを吸収するための処置
# @HOW TO USE
#      実装前
#      scope :name_search, lambda{|name| where ('last_name' || 'first_name') LIKE ?", "%#{name}%" }
#      実装後
#      scope :name_search, lambda{|name| where("#{connection.concat('last_name', 'first_name')} LIKE ?", "%#{name}%") }
# 
# @see https://tigawa.github.io/blog/2013/05/27/activerecord/
# 
module ActiveRecord
  module ConnectionAdapters
    class AbstractAdapter

      # Will return the given strings as a SQL concationation. By default
      # uses the SQL-92 syntax:
      #
      #   concat('foo', 'bar') -> "foo || bar"
      def concat(*args)
        args * " || "
      end

    end

    class AbstractMysqlAdapter < AbstractAdapter

      # Will return the given strings as a SQL concationation.
      # Uses MySQL format:
      #
      #   concat('foo', 'bar')  -> "CONCAT(foo, bar)"
      def concat(*args)
        "CONCAT(#{args * ', '})"
      end

    end

    class SQLServerAdapter < AbstractAdapter

      # Will return the given strings as a SQL concationation.
      # Uses MS-SQL format:
      #
      #   concat('foo', 'bar')  -> foo + bar
      def concat(*args)
        args * ' + '
      end

    end
  end
end
