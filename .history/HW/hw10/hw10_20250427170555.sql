CREATE TABLE parents AS
  SELECT "ace" AS parent, "bella" AS child UNION
  SELECT "ace"          , "charlie"        UNION
  SELECT "daisy"        , "hank"           UNION
  SELECT "finn"         , "ace"            UNION
  SELECT "finn"         , "daisy"          UNION
  SELECT "finn"         , "ginger"         UNION
  SELECT "ellie"        , "finn";

CREATE TABLE dogs AS
  SELECT "ace" AS name, "long" AS fur, 26 AS height UNION
  SELECT "bella"      , "short"      , 52           UNION
  SELECT "charlie"    , "long"       , 47           UNION
  SELECT "daisy"      , "long"       , 46           UNION
  SELECT "ellie"      , "short"      , 35           UNION
  SELECT "finn"       , "curly"      , 32           UNION
  SELECT "ginger"     , "short"      , 28           UNION
  SELECT "hank"       , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child as chil from (
    SELECT child, height from parents, dogs where parent = name
      order by -height
  );


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size from dogs, sizes where (height > min and height <= max);


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT sib1.child as child1, sib2.child as child2, size1.size as same_size
    from parents as sib1, parents as sib2, size_of_dogs as size1, size_of_dogs as size2
    where sib1.parent = sib2.parent and sib1.child < sib2.child and sib1.child = size1.name and sib2.child = size2.name and size1.size = size2.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || child1 || " and " || child2 || ", have the same size: " || same_size
    from siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, max(height) - min(height) as height_range
    from dogs
    group by fur
    having min(height) >= average(height) * 0.7 and max(height) <= average(height) * 1.3;

