tbs.BattlePlannerNG.factory 'Units', ->
  _(_.range(0,6)).map ->
    name: ""
    type: ""
    stats: undefined
    allocated_stat_points: 0
    max_stat_points: 11

tbs.BattlePlannerNG.factory 'UnitGroupings', ->

  maxStatPointsForRank = (rank) ->
    switch rank
      when 0 then 10
      when 1 then 11
      when 2 then 12
      when 3 then 13

  units = _(tbs.data.Units()).map (unit) ->
    _(unit).tap (u) ->
      u.max_stat_points = maxStatPointsForRank(u.rank)
      u.allocated_stat_points = 0

  _(_(units).groupBy("type")).tap (grouped) -> delete grouped.base

