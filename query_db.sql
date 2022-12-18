select concat(u.name,' ', u.last_name) as user,
count(b.id) as bets_num,
sum(b.amount_of_money) as bets_sum_per_month,
sum((select case 
			 	when bt.market = 'team_1' then bt.amount_of_money*ev.team_1_coef
             	when bt.market = 'team_2' then bt.amount_of_money*ev.team_2_coef
                else bt.amount_of_money*ev.draw_coef
			 end
	 	from bets bt 
 	 	join events ev on bt.event_id = ev.id 
        where bt.state = 'win' limit 1)) as money_won_per_month,
(select count(b.id) from bets b 
        where b.state = 'win')/(count(b.id)) as percent_won_per_month,
(select count(b.id) from bets b 
        where b.state = 'lose')/(count(b.id)) as percent_lost_per_month,
 extract(month from e.event_date) as month_,
 extract(year from e.event_date) as year_
from users_pm as u
join bets b on b.user_id = u.id
join events e on b.event_id = e.id 
where e.state = 'finished'
group by u.id, extract(month from e.event_date), extract(year from e.event_date)
order by month_ desc, year_ desc, bets_num desc;