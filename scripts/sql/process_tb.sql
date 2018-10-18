INSERT INTO page (title)
  SELECT dest
    FROM mini201801 UNION
  SELECT src
    FROM mini201801
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2018-01-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201801 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;


INSERT INTO page (title)
  SELECT dest
    FROM mini201806 UNION
  SELECT src
    FROM mini201806
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2018-06-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201806 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;


INSERT INTO page (title)
  SELECT dest
    FROM mini201807 UNION
  SELECT src
    FROM mini201807
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2018-07-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201807 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;


INSERT INTO page (title)
  SELECT dest
    FROM mini201808 UNION
  SELECT src
    FROM mini201808
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2018-08-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201808 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;

INSERT INTO page (title)
  SELECT dest
    FROM mini201809 UNION
  SELECT src
    FROM mini201809
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2018-09-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201809 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;


INSERT INTO page (title)
  SELECT dest
    FROM mini201711 UNION
  SELECT src
    FROM mini201711
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2017-11-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201711 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;


INSERT INTO page (title)
  SELECT dest
    FROM mini201712 UNION
  SELECT src
    FROM mini201712
    ON DUPLICATE KEY
      UPDATE title=title;

SELECT STR_TO_DATE('2017-12-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (srcID, destID, month, type, count)
  SELECT src.id, dest.id, @date, req.type, req.count
    FROM mini201712 as req, page as src, page as dest
    WHERE src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;
