SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS D
where exists (select 1 from skillcodes s where s.category = 'Front End' and d.skill_code & s.code = s.code )
ORDER BY D.ID ASC;