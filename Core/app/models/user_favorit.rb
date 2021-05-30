class UserFavorit < ApplicationRecord
  def self.GetSaleList(day_begin, day_end, uid)
    result = [] 
    us = User.select(:uid, :privateid, :groupid, :user_name)
    us.each{ |u|
      sql = ActiveRecord::Base.sanitize_sql([
        "select c.name, c.publish_date 
           from comixes c
                join series s on c.name like concat( s.name, '%')
                join user_favorits f  on s.sid = f.sid
                                     and f.uid = :uid
          where c.publish_date >= :day_begin
            and c.publish_date <= :day_end
        ", uid: u.uid, day_begin: day_begin, day_end: day_end
      ])
      sqlres = ActiveRecord::Base.connection.select_all(sql).to_hash
      result = [{ User: u, publish: sqlres}]
    }

    result
  end
end
