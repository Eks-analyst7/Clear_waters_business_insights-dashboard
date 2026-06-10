select
f_a.app_id,
f_a.date_tagged,
f_a.date_actioned,
d_o.outcome_name,
d_q.queue_name,
f_a.analyst_id,
d_a.first_name,
d_a.last_name,
d_g.gender,
d_c.city_name,
d_co.country_name,
f_a.store_id,
d_s.store_name,
f_a.message

from 
     fact_applications f_a
join dim_outcome d_o on f_a.outcome_id=d_o.outcome_id
join dim_queue d_q   on f_a.queue_id=d_q.queue_id
join dim_analyst d_a on f_a.analyst_id=d_a.analyst_id
join dim_gender d_g on d_a.gender_id=d_g.gender_id
join dim_city d_c   on d_a.city_id=d_c.city_id     
join dim_country d_co  on d_a.country_id=d_co.country_id
join dim_store d_s on f_a.store_id=d_s.store_id
where 
      message not like '%duplicate%'
 order by
     app_id;


