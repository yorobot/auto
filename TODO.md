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
[book] create page index (./build/beer/cz/book/_pages/index.md)
build country page cz...
rake aborted!
NoMethodError: undefined method `title' for nil:NilClass
/home/gerald/test/auto/build/beer/cz/book/_scripts/helpers/misc.rb:40:in `country_to_path'
/home/gerald/test/auto/build/beer/cz/book/_scripts/book.rb:143:in `block in build_book'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/activerecord-4.2.0/lib/active_record/relation/delegation.rb:46:in `each'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/activerecord-4.2.0/lib/active_record/relation/delegation.rb:46:in `each'
/home/gerald/test/auto/build/beer/cz/book/_scripts/book.rb:133:in `build_book'
/home/gerald/test/auto/scripts/press.rb:119:in `build_book_worker'
/home/gerald/test/auto/Rakefile:41:in `block (3 levels) in <top (required)>'
Tasks: TOP => beer:book:build
(See full trace by running task with --trace)
gerald@viva:~/test/auto$ 

~~~