-- replace placeholders with inchi table name and inchi col name
-- 0 in-house table with InChI; 1 in-house column name for InChI; 2 in-house ID column for compounds
SELECT C."{2}", D.schembl_chem_id FROM "{0}" C
INNER JOIN surechembl.schembl_chemical_structure D
ON D.std_inchi = C."{1}"
-- finding remaining matches without using stereochemical layer
UNION ALL
SELECT A."{2}", C.schembl_chem_id from "{0}" A
FULL OUTER JOIN (
    SELECT C."{2}", D.schembl_chem_id FROM "{0}" C
    INNER JOIN surechembl.schembl_chemical_structure D
    ON D.std_inchi = C."{1}"
    ) B
ON A."{2}" = B."{2}"
INNER JOIN surechembl.schembl_chemical_structure C
ON C.std_inchi = split_part(split_part(A."inchi", '/b', 1), '/t', 1)
WHERE B.objdid is NULL
