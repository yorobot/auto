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
cl2014-15:
-- fix: change country code to nir (northern ireland!!! was nd)
[debug] enter load( name=>>europe/clubs_western<<)
[info] parsing data in zip (team) 'europe/clubs_western' (clubs-master/europe/clubs_western.txt)...
[debug] create Team:
[debug] {"title":"Cork City FC","key":"corkcity","club":true,"country_id":116}
[debug] line: |»drogheda« »      Drogheda United FC« » ie«|
[debug]   values: |»drogheda« »Drogheda United FC« »ie«|
[debug] skipping blank line (1)
[debug] skipping blank line (2)
[debug] skipping comment line
[debug] skipping comment line
[debug] skipping blank line (3)
[debug] create Team:
[debug] {"title":"Drogheda United FC","key":"drogheda","club":true,"country_id":116}
[debug] line: |»linfield« »     Linfield FC« » nd«|
[debug]   values: |»linfield« »Linfield FC« »nd«|
rake aborted!
ActiveRecord::RecordNotFound: Couldn't find WorldDb::Model::Country
/home/gerald/.rvm/gems/ruby-2.1.4/gems/activerecord-4.2.0/lib/active_record/core.rb:195:in `find_by!'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/activerecord-4.2.0/lib/active_record/dynamic_matchers.rb:70:in `find_by_key!'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/models/team.rb:92:in `block in create_or_update_from_values'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/models/team.rb:66:in `each'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/models/team.rb:66:in `each_with_index'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/models/team.rb:66:in `create_or_update_from_values'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/readers/team.rb:46:in `block in read'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/values_reader.rb:100:in `block in each_line'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/values_reader.rb:250:in `block in each_line_with_meta'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/values_reader.rb:134:in `each_line'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/values_reader.rb:134:in `each_line_with_meta'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/values_reader.rb:90:in `each_line'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/readers/team.rb:45:in `read'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/reader.rb:107:in `load'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/sportdb-models-1.10.1/lib/sportdb/reader.rb:20:in `block in load_setup'
~~~



