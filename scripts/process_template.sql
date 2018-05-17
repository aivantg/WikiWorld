INSERT INTO page (title)
  SELECT dest
    FROM tbname UNION
  SELECT src
    FROM tbname
    ON DUPLICATE KEY
      UPDATE title=title;

INSERT INTO link (srcID, destID)
  SELECT src.id, dest.id
    FROM tbname as raw, page as src, page as dest
    WHERE raw.src=src.title and raw.dest=dest.title
    ON DUPLICATE KEY
      UPDATE srcID=srcID;

SELECT STR_TO_DATE('2018-01-01', '%Y-%m-%d') INTO @date;

INSERT INTO request (linkID, month, type, count)
  SELECT link.id, @date, req.type, req.count
    FROM link as link, tbname as req, page as src, page as dest
    WHERE link.srcID = src.id and link.destID = dest.id and src.title=req.src and dest.title=req.dest
    ON DUPLICATE KEY
      UPDATE
        request.count=request.count+req.count;
