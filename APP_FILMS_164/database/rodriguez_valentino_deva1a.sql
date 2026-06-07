--affiche toute les données de la table
select * from t_arrosage
select * from t_champ
select * from t_culture
select * from t_don_sonde
select * from t_meteo
select * from t_parcelle
select * from t_sonde

--récupération de deux table et leur données
--affiche toute les données des table t_parcelle et t_arrosage
select * from t_arrosage
join t_link_arrosage_parcelle on t_arrosage.id_arrosage = t_link_arrosage_parcelle.fk_id_arrosage
join t_parcelle on parcelle.id_parcelle = t_link_arrosage_parcelle.fk_id_parcelle

select * from t_parcelle
join t_link_arrosage_parcelle on parcelle.id_parcelle = t_link_arrosage_parcelle.fk_id_parcelle 
join t_arrosage on t_arrosage.id_arrosage = t_link_arrosage_parcelle.fk_id_arrosage

--affiche toute les données des table t_don_sonde et t_parcelle
select * from t_don_sonde
join t_link_donnee_parcelle on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee
join t_parcelle on t_link_donnee_parcelle.fk_id_parcelle = t_parcelle.id_parcelle

select * from t_parcelle
join t_link_donnee_parcelle on t_parcelle.id_parcelle = t_link_donnee_parcelle.fk_id_parcelle
join  t_don_sonde on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee

--affiche toute les données des table t_meteo et t_don_sonde
select * from t_meteo
join t_link_meteo_donnee on t_meteo.id_meteo = t_link_meteo_donnee.fk_id_meteo
join t_don_sonde on t_don_sonde.id_don_sonde = t_link_meteo_donnee.fk_id_donnee

select * from t_don_sonde 
join t_link_meteo_donnee on t_don_sonde.id_don_sonde  = t_link_meteo_donnee.fk_id_donnee 
join t_meteo on t_meteo.id_meteo = t_link_meteo_donnee.fk_id_meteo

--affiche toute les données des table t_parcelle et t_champ
select * from t_parcelle
join t_link_parcelle_champ on t_parcelle.id_parcelle = t_link_parcelle_champ.fk_id_champ
join t_champ on t_champ.id_champ = t_link_parcelle_champ.fk_id_parcelle

select * from t_champ
join t_link_parcelle_champ on t_champ.id_champ = t_link_parcelle_champ.fk_id_parcelle
join t_parcelle on t_parcelle.id_parcelle = t_link_parcelle_champ.fk_id_champ 

--affiche toute les données des table t_parcelle et t_culture
select * from t_parcelle
join t_link_parcelle_culture on t_parcelle.id_parcelle  = t_link_parcelle_culture.fk_id_parcelle
join t_culture on t_culture.id_culture = t_link_parcelle_culture.fk_id_culture

select * from t_culture
join t_link_parcelle_culture on t_culture.id_culture  = t_link_parcelle_culture.fk_id_culture
join t_parcelle on t_parcelle.id_parcelle = t_link_parcelle_culture.fk_id_parcelle

--affiche toute les données des table t_sonde et t_don_sonde
select * from t_sonde
join t_link_sonde_donnee on t_sonde.id_sonde = t_link_sonde_donnee.fk_id_sonde
join t_don_sonde on t_don_sonde.id_don_sonde = t_link_sonde_donnee.fk_id_donnee
order by t_don_sonde.id_don_sonde

select * from t_don_sonde
join t_link_sonde_donnee on t_don_sonde.id_don_sonde = t_link_sonde_donnee.fk_id_donnee
join t_sonde on t_sonde.id_sonde = t_link_sonde_donnee.fk_id_sonde
order by t_sonde.id_sonde 


--affiche toute les données des table t_don_sonde, t_parcelle et t_champ
select * from t_don_sonde
join t_link_donnee_parcelle on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee
join t_parcelle on t_link_donnee_parcelle.fk_id_parcelle = t_parcelle.id_parcelle
join t_link_parcelle_champ on t_parcelle.id_parcelle = t_link_parcelle_champ.fk_id_champ
join t_champ on t_champ.id_champ = t_link_parcelle_champ.fk_id_parcelle
order by t_champ.id_champ

--affiche toute les données des table t_don_sonde, t_parcelle et t_culture
select * from t_don_sonde
join t_link_donnee_parcelle on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee
join t_parcelle on t_link_donnee_parcelle.fk_id_parcelle = t_parcelle.id_parcelle
join t_link_parcelle_culture on t_parcelle.id_parcelle  = t_link_parcelle_culture.fk_id_parcelle
join t_culture on t_culture.id_culture = t_link_parcelle_culture.fk_id_culture
order by t_don_sonde.id_don_sonde

--affiche les donnée hygrométrique et le cultivar en fonction de la parcelle
select don_data, id_parcelle, parcelle_designation, culture_cultivar from t_don_sonde
join t_link_donnee_parcelle on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee
join t_parcelle on t_link_donnee_parcelle.fk_id_parcelle = t_parcelle.id_parcelle
join t_link_parcelle_culture on t_parcelle.id_parcelle  = t_link_parcelle_culture.fk_id_parcelle
join t_culture on t_culture.id_culture = t_link_parcelle_culture.fk_id_culture
order by t_parcelle.id_parcelle

--affiche les donnée hygrométrique et leur date de mesure en fonction de la parcelle
select id_parcelle, parcelle_designation, don_data, don_date_don from t_don_sonde
join t_link_donnee_parcelle on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee
join t_parcelle on t_link_donnee_parcelle.fk_id_parcelle = t_parcelle.id_parcelle
order by t_parcelle.id_parcelle

--affiche les donnée hygrométrique et leur date de mesure, la température et l'hygrométrie de l'aire en fonction la parcelle 
select id_parcelle, parcelle_designation, don_data, don_date_don, meteo_tempe, meteo_hygro from t_parcelle
join t_link_donnee_parcelle on t_parcelle.id_parcelle = t_link_donnee_parcelle.fk_id_parcelle
join  t_don_sonde on t_don_sonde.id_don_sonde = t_link_donnee_parcelle.fk_id_donnee
join t_link_meteo_donnee on t_don_sonde.id_don_sonde  = t_link_meteo_donnee.fk_id_donnee 
join t_meteo on t_meteo.id_meteo = t_link_meteo_donnee.fk_id_meteo
order by t_parcelle.id_parcelle