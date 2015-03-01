
## $DEBUG = true
$RUBYLIBS_DEBUG = true

require 'zip'   # use $ gem install rubyzip

require 'fetcher'  ## check - fetcher already included in beerdb ??

require 'beerdb'

require 'hybook'


require './scripts/utils'
require './scripts/press'
require './scripts/world'
require './scripts/beer'


### what keys to use? any more e.g. DATA=?, KEY=? ??
SETUP = ENV['SETUP'] || ENV['DATASET'] || 'at'    ## note: default to at (austria) for now
puts "setting SETUP to >#{SETUP}<"


BUILD_DIR     = "./build"
directory BUILD_DIR


task :dl => [BUILD_DIR] do
  p = BookPress.create_beer_book_for( SETUP )
  p.dl_datasets
end

task :build => [BUILD_DIR] do
  p = BookPress.create_beer_book_for( SETUP )
  p.build
end

task :book_dl => [BUILD_DIR] do
  p = BookPress.create_beer_book_for( SETUP )
  p.dl_book_templates
end

task :book_build => [BUILD_DIR] do
  p = BookPress.create_beer_book_for( SETUP )
  p.build_book_worker
end

