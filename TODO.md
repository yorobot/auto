# Todos

- add all-in-one single page version to auto-build (use inline:true) for book.html
- add db logger
- add page w/ db stats
- add page w/ error from log db


## book templates

- add world/cites book template
- add football/clubs book template

## world

- generate cities booklet

## beer

- generate booklet for great beers with quick reader

## football

- generate clubs booklets
- generate worlcup booklet
- gneerate champions league booklet
- generate top 4 booklet (premier league,bundesliga,la liga, italy)

## misc

fix:

~~~
at:
[debug] enter load( name=>>at-austria!/2014-15/2-liga1<<)
[info] parsing data in zip (event) 'at-austria!/2014-15/2-liga1' (at-austria-mas
ter/2014-15/2-liga1.yml)...
[debug] yaml key:String >>league<<, value:String >>at.2<<
[debug] yaml key:String >>season<<, value:String >>2014/15<<
[debug] yaml key:String >>start_at<<, value:Date >>2014-07-18<<
[debug] yaml key:String >>teams<<, value:Array >>["innsbruck", "alustenau", "lie
fering", "stpoelten", "ksv", "mattersburg", "horn", "hartberg", "fac", "lask"]<<

[debug] find event - league_id: 2, season_id: 7
[debug] *** create event:
[debug] {"sources":"2-liga1.yml","config":"2-liga1.yml","league_id":2,"season_id
":7,"start_at":"2014-07-18","team_ids":[15,18,24,19,22,16,21,23,25,26]}
[info] parsing data in zip (fixture) 'at-austria!/2014-15/2-liga1' (at-austria-m
aster/2014-15/2-liga1.yml)...
[debug] yaml key:String >>league<<, value:String >>at.2<<
[debug] yaml key:String >>season<<, value:String >>2014/15<<
[debug] yaml key:String >>start_at<<, value:Date >>2014-07-18<<
[debug] yaml key:String >>teams<<, value:Array >>["innsbruck", "alustenau", "lie
fering", "stpoelten", "ksv", "mattersburg", "horn", "hartberg", "fac", "lask"]<<

[debug] find event - league_id: 2, season_id: 7
[debug] *** update event 10-at.2.2014/15:
[debug] {"sources":"2-liga1.yml","config":"2-liga1.yml","league_id":2,"season_id
":7,"start_at":"2014-07-18","team_ids":[15,18,24,19,22,16,21,23,25,26]}
rake aborted!
undefined method `get_input_stream' for nil:NilClass
C:/Sites/auto/scripts/press.rb:105:in `build'
C:/Sites/auto/scripts/press.rb:149:in `run'
C:/Sites/auto/Rakefile:58:in `block (2 levels) in <top (required)>'
Tasks: TOP => ft:run
(See full trace by running task with --trace)
~~~

