
## $DEBUG = true
$RUBYLIBS_DEBUG = true

require 'zip'   # use $ gem install rubyzip

require 'fetcher'  ## check - fetcher already included in beerdb ??

require 'beerdb'    ## check - just include beerdb/models  - why, why not??
require 'sportdb'   ## check - just include sportdb/models - why, why not??

require 'hybook'


require './scripts/utils'
require './scripts/press'
require './scripts/world'
require './scripts/beer'
require './scripts/football'


### what keys to use? any more e.g. DATA=?, KEY=? ??
SETUP = ENV['SETUP'] || ENV['DATASET'] || 'at'    ## note: default to at (austria) for now
puts "setting SETUP to >#{SETUP}<"


## BUILD_DIR     = "./build"
## directory BUILD_DIR




namespace :beer do

  p = BookPress.create_beer_book_for( SETUP )

  task :dl    do  p.dl_datasets; end
  task :build do  p.build;       end   ## build database

  ## all-in-one task
  task :run   do  p.run;         end

  namespace :book do
    task :dl     do p.dl_book_templates; end
    task :build  do p.build_book_worker; end
    task :jekyll do p.run_jekyll;        end
  end

end # namespace beer


namespace :ft do

  p = BookPress.create_football_book_for( SETUP )

  task :dl    do  p.dl_datasets; end
  task :build do  p.build;       end   ## build database

  ## all-in-one task
  task :run   do  p.run;         end

  namespace :book do
    task :dl     do p.dl_book_templates; end
    task :build  do p.build_book_worker; end
    task :jekyll do p.run_jekyll;        end
  end

end # namespace ft


namespace :world do

  p = BookPress.create_world_book_for( SETUP )

  task :dl    do  p.dl_datasets; end  
  task :build do  p.build;       end   ## build database

  ## all-in-one task
  task :run   do  p.run;         end

  namespace :book do
    task :dl     do p.dl_book_templates; end
    task :build  do p.build_book_worker; end
    task :jekyll do p.run_jekyll;        end
  end

end # namespace world

