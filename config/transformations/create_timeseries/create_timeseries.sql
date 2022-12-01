
  SELECT
    external_id AS externalId,
    name AS name,
    "" AS description,
    false AS isStep,
    Cast(Lower(is_string) AS BOOLEAN) AS isString,
    Str_to_map(
      Regexp_replace(
        Regexp_replace(Replace(metadata, "': '", ":"), "\\' |\\ '", "'"),
        "\\[|\\]|\\}|\\{|\\'",
        ""
      )
    ) AS metadata,
    Dataset_id('uc:001:oee:ds') AS dataSetId
  FROM
    `UC:001:oee:db`.`timeseries`