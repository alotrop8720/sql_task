select role_name from m_roles;

select  concat(username, ' ', surname), count(*) as User_full_name from m_users
inner join m_cars on m_users.id = m_cars.user_id
group by username, surname;

select d.name, count(*) from m_cars c
inner join m_auto_dealer d on c.dealer_id = d.id
inner join m_body b on c.id = b.car_id
where extract(year from d.year_of_foundation) > 2018 and
      b.color = 'RED'
group by d.name;

-- Я 4 не поняла где найти страну

select u.login from m_users u
inner join m_cars  c on u.id = c.user_id
group by u.login
having count(c.model) > 3;

select distinct d.name, sum(c.price) from m_auto_dealer d
inner join m_cars c on d.id = c.dealer_id
group by d.name;

select distinct u.username from m_users u
inner join m_cars c on u.id = c.user_id
where c.price > (select avg(price) from m_cars)
group by u.username
having count(c.model) >=1;