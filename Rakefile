
$RUBYLIBS_DEBUG = true

require 'zip'   # use $ gem install rubyzip
require 'fetcher'  ## check - fetcher already included in beerdb ??

require 'beerdb'    ## check - just include beerdb/models  - why, why not??
require 'sportdb'   ## check - just include sportdb/models - why, why not??

##  include models at top-level (globals) - why, why not????
## include WorldDb::Models

require 'bookfile'
require 'bookman'



### what keys to use? any more e.g. DATA=?, KEY=? ??
SETUP = ENV['SETUP'] || ENV['DATASET'] || 'at'    ## note: default to at (austria) for now
puts "setting SETUP to >#{SETUP}<"

### what keys to use? any more e.g. DATA=?, KEY=? ??
####  fix/todo: use for world --> 'countries'    ## note: default to countries for now


namespace :beer do

  b = Bookman::Bookman.create_beer_book_for( SETUP )

  ## all-in-one task
  task :build  do  b.build;         end

  namespace :db do
    task :dl    do  b.dl_datasets; end
    task :build do  b.build_db;    end
  end

  namespace :book do
    task :dl     do b.dl_book_templates; end
    task :build  do b.build_book;        end
    task :jekyll do b.run_jekyll;        end
  end

end # namespace beer


namespace :ft do

  b = Bookman::Bookman.create_football_book_for( SETUP )

  ## all-in-one task
  task :build   do  b.build;         end

  namespace :db do
    task :dl    do  b.dl_datasets; end
    task :build do  b.build_db;    end
  end

  namespace :book do
    task :dl     do b.dl_book_templates; end
    task :build  do b.build_book;        end
    task :jekyll do b.run_jekyll;        end
  end

end # namespace ft


namespace :world do

  b = Bookman::Bookman.create_world_book_for( SETUP )

  ## all-in-one task
  task :build   do  b.build;      end

  namespace :db do
    task :dl    do  b.dl_datasets;    end
    task :build do  b.build_db;       end
  end

  namespace :book do
    task :dl     do b.dl_book_templates; end
    task :build  do b.build_book;        end
    task :jekyll do b.run_jekyll;        end
  end

end # namespace world

