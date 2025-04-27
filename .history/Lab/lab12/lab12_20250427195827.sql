CREATE TABLE finals AS
  SELECT "RSF" AS hall, "61A" as course UNION
  SELECT "Wheeler"    , "61A"           UNION
  SELECT "Pimentel"   , "61A"           UNION
  SELECT "Li Ka Shing", "61A"           UNION
  SELECT "Stanley"    , "61A"           UNION
  SELECT "RSF"        , "61B"           UNION
  SELECT "Wheeler"    , "61B"           UNION
  SELECT "Morgan"     , "61B"           UNION
  SELECT "Wheeler"    , "61C"           UNION
  SELECT "Pimentel"   , "61C"           UNION
  SELECT "Soda 310"   , "61C"           UNION
  SELECT "Soda 306"   , "10"            UNION
  SELECT "RSF"        , "70";

CREATE TABLE sizes AS
  SELECT "RSF" AS room, 900 as seats    UNION
  SELECT "Wheeler"    , 700             UNION
  SELECT "Pimentel"   , 500             UNION
  SELECT "Li Ka Shing", 300             UNION
  SELECT "Stanley"    , 300             UNION
  SELECT "Morgan"     , 100             UNION
  SELECT "Soda 306"   , 80              UNION
  SELECT "Soda 310"   , 40              UNION
  SELECT "Soda 320"   , 30;

CREATE TABLE sharing AS
  SELECT final1.course, count(distinct final1.hall) as shared
    from finals as final1, finals as final2
    where final1.hall = final2.hall and final1.course <> final2.course
    group by final1.course;

CREATE TABLE pairs AS
  SELECT room1.room || " and " || room2.room || " together have " || (room1.seats + room2.seats) || " seats" as rooms
    from sizes as room1, sizes as room2
    where room1.room < room2.room and room1.seats + room2.seats >= 1000
    order by room1.seats + room2.seats;

CREATE TABLE big AS
  SELECT finals.course
    from finals, sizes
    where finals.hall = sizes.room
    group by finals.course
    having sum(sizes.seats) >= 1000;

CREATE TABLE remaining AS
  SELECT finals.course, sum(sizes.seats) - max(sizes.seats) as remaining
    from finals, sizes
    where finals.hall = sizes.room
    group by finals.course;

