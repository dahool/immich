-- NOTE: This file is auto generated by ./sql-generator

-- LibraryRepository.get
select
  "libraries".*
from
  "libraries"
where
  "libraries"."id" = $1
  and "libraries"."deletedAt" is null

-- LibraryRepository.getAll
select
  "libraries".*
from
  "libraries"
where
  "libraries"."deletedAt" is null
order by
  "createdAt" asc

-- LibraryRepository.getAllDeleted
select
  "libraries".*
from
  "libraries"
where
  "libraries"."deletedAt" is not null
order by
  "createdAt" asc

-- LibraryRepository.getStatistics
select
  count(*) filter (
    where
      (
        "assets"."type" = $1
        and "assets"."visibility" != $2
      )
  ) as "photos",
  count(*) filter (
    where
      (
        "assets"."type" = $3
        and "assets"."visibility" != $4
      )
  ) as "videos",
  coalesce(sum("exif"."fileSizeInByte"), $5) as "usage"
from
  "libraries"
  inner join "assets" on "assets"."libraryId" = "libraries"."id"
  left join "exif" on "exif"."assetId" = "assets"."id"
where
  "libraries"."id" = $6
group by
  "libraries"."id"
select
  0::int as "photos",
  0::int as "videos",
  0::int as "usage",
  0::int as "total"
from
  "libraries"
where
  "libraries"."id" = $1
