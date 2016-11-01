# Todos

- add all-in-one single page version to auto-build (use inline:true) for book.html
- [] add db logger  !!!! - see "classic" build scripts
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
bayern:  -- key starting w/ number - what to do???? -- allow keys w/ numbers!!!! fix
[debug] line: |»1516 Zwick'lbier« » zwickel«|
[debug]   values: |»1516 Zwick'lbier« »zwickel«|
[debug]    autogen key »1516zwicklbier« from title »1516 Zwick'lbier«
[debug]   trying to find brewery in line >Meckatzer Löwenbräu, Heimenkirch<
[info]   map_titles_for! brewery - deprecated API - use TitleMapper.map_titles! instead
[debug]      match for brewery  >loewenbraeu< >L(ö|oe)wenbr(ä|ae)u<
[info]   find_key_for! brewery - deprecated API - use TitleMapper.find_key! instead
[debug]    brewery: >loewenbraeu<
[debug]   brewery_key = >loewenbraeu<
[debug]    found tags: >>zwickel<<
[debug] create Beer:
[debug] {"title":"1516 Zwick'lbier","key":"1516zwicklbier","country_id":110,"region_id":2,"txt":"de-deutschland/by-bayern!/4--schwaben/beers
_100_000+","grade":4,"brewery_id":6,"city_id":175}
rake aborted!
Validation failed: Key expected two or more lowercase letters a-z or 0-9 digits
~~~


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



# todos from beer.db

fix be(lgium):  # in auto-title not escaped

~~~
[debug] {"title":"Petrus Blond","key":"petrusblond","country_id":108,"region_id":6,"txt":"be-belgium!/2--vwv-west-vlaanderen--flanders/beers","grade":4}
[debug] line: |»Petrus Winter #9« »     9%« » winter|ale«|
[debug]   values: |»Petrus Winter #9« »9%« »winter|ale«|
[debug]    autogen key »petruswinter#9« from title »Petrus Winter #9«
[debug]   trying to find brewery in line >Brouwerij Bavik, Bavikhove<
[info]   map_titles_for! brewery - deprecated API - use TitleMapper.map_titles! instead
[info]   find_key_for! brewery - deprecated API - use TitleMapper.find_key! instead
[debug]   brewery_key = ><
[debug]    found tags: >>winter|ale<<
[debug] create Beer:
[debug] {"title":"Petrus Winter #9","key":"petruswinter#9","country_id":108,"region_id":6,"txt":"be-belgium!/2--vwv-west-vlaanderen--flanders/beers","grade":4,"abv":9.0}
rake aborted!
ActiveRecord::RecordInvalid: Validation failed: Key expected two or more lowercase letters a-z or 0-9 digits
~~~

## add all repos to all datafile

~~~


task :world => :importbuiltin do
  BeerDb.read_setup( 'setups/all', WORLD_INCLUDE_PATH )
end

task :ch => :importbuiltin do
  BeerDb.read_setup( 'setups/all', CH_INCLUDE_PATH )
end

task :cz => :importbuiltin do
  BeerDb.read_setup( 'setups/all', CZ_INCLUDE_PATH )
end

task :ie => :importbuiltin do
  BeerDb.read_setup( 'setups/all', IE_INCLUDE_PATH )
end

task :be => :importbuiltin do
  BeerDb.read_setup( 'setups/all', BE_INCLUDE_PATH )
end

task :nl => :importbuiltin do
  BeerDb.read_setup( 'setups/all', NL_INCLUDE_PATH )
end

task :ca => :importbuiltin do
  BeerDb.read_setup( 'setups/all', CA_INCLUDE_PATH )
end

task :us => :importbuiltin do
  BeerDb.read_setup( 'setups/all', US_INCLUDE_PATH )
end

task :mx => :importbuiltin do
  BeerDb.read_setup( 'setups/all', MX_INCLUDE_PATH )
end

task :jp => :importbuiltin do
  BeerDb.read_setup( 'setups/all', JP_INCLUDE_PATH )
end
~~~
