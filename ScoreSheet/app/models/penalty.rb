class Penalty < ActiveRecord::Base

  #Association

  #Methods
  def self.penalties
    sql = 'select *
             from penalties P
             left join (select penalty_id,
                               count(penalty_id) as cnt
                          from game_penalties
                         group by penalty_id) G
              on P.id = G.penalty_id
           order by G.cnt DESC;'
    find_by_sql sql
  end
end
