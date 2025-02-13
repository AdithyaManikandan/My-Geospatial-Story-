-- Query 1
SELECT 'residential' AS Land_Type, SUM(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS total_area_sq_km
FROM  "public"."residential" UNION ALL
SELECT 'farmland' AS Land_Type, SUM(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS total_area_sq_km
FROM  "public"."farmland" UNION ALL
SELECT 'commercial' AS Land_Type, SUM(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS total_area_sq_km
FROM "public"."commercial"
UNION ALL
SELECT 'forest' AS Land_Type, SUM(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS total_area_sq_km
FROM "public"."forest";

-- Query 2
SELECT  'residential' AS table_name,COUNT(*) AS Areas_above_1sqKm FROM "public"."residential"
WHERE ST_Area(ST_Transform(wkb_geometry, 3395)) > 1000000 UNION ALL
SELECT 'farmland' AS table_name, COUNT(*) AS Areas_above_1sqKm FROM "public"."farmland"
WHERE ST_Area(ST_Transform(wkb_geometry, 3395)) > 1000000 UNION ALL
SELECT 'commercial' AS table_name, COUNT(*) AS Areas_above_1sqKm FROM  "public"."commercial"
WHERE  ST_Area(ST_Transform(wkb_geometry, 3395)) > 1000000 UNION ALL
SELECT 'forest' AS table_name, COUNT(*) AS Areas_above_1sqKm FROM "public"."forest"
WHERE ST_Area(ST_Transform(wkb_geometry, 3395)) > 1000000;

-- Query 3
SELECT 'residential' AS Land_type, AVG(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS avg_area_sq_km
FROM "public"."residential" UNION ALL
SELECT 'farmland' AS Land_type, AVG(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS avg_area_sq_km
FROM "public"."farmland" UNION ALL
SELECT 'commercial' AS Land_type,AVG(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS avg_area_sq_km
FROM "public"."commercial" UNION ALL
SELECT 'forest' AS Land_type,AVG(ST_Area(ST_Transform(wkb_geometry, 3395)))/1000000 AS avg_area_sq_km
FROM "public"."forest";

--Query 4
SELECT 
SUM(ST_Area(ST_Intersection(ST_Transform(r.wkb_geometry, 3395), ST_Transform(f.wkb_geometry, 3395))))/1000000 
AS intersection_area_sq_km
FROM "public"."residential" r
JOIN  "public"."forest" f ON ST_Intersects(r.wkb_geometry, f.wkb_geometry);
