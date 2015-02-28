
## $DEBUG = true
$RUBYLIBS_DEBUG = true

require 'zip'   # use $ gem install rubyzip

require 'fetcher'  ## check - fetcher already included in beerdb ??


require 'beerdb'

require './scripts/utils'
require './scripts/world'
require './scripts/beer'



### what keys to use? any more e.g. DATA=?, KEY=? ??
SETUP = ENV['SETUP'] || ENV['DATASET'] || 'at'    ## note: default to at (austria) for now
puts "setting SETUP to >#{SETUP}<"


BUILD_DIR     = "./build"
SETUP_DIR     = "#{BUILD_DIR}/#{SETUP}"   ## todo: add type (e.g. world/football/beer/etc.)
BOOK_DIR      = "#{BUILD_DIR}/#{SETUP}/book"


DATAFILE_PATH  = "#{SETUP_DIR}/Datafile"
DB_PATH        = "#{SETUP_DIR}/beer.db"

DB_CONFIG = {
  adapter:  'sqlite3',
  database:  DB_PATH
}


directory BUILD_DIR
directory SETUP_DIR 
directory BOOK_DIR


task :dl => [BUILD_DIR] do
  p = BeerPress.new( BUILD_DIR )  
  p.dl_datasets_for( SETUP )
end

task :book_dl => [BUILD_DIR] do
  p = BeerPress.new( BUILD_DIR )
  p.dl_book_templates( SETUP )
end


##################################
##################################

task :clean do
  rm DB_PATH if File.exists?( DB_PATH )
end

task :env => [BUILD_DIR,SETUP_DIR] do
  pp DB_CONFIG
  ActiveRecord::Base.establish_connection( DB_CONFIG )
end

task :create => :env do
  BeerDb.create_all
end

task :load => :env do
  datafile = Datafile::Datafile.load_file( DATAFILE_PATH )
  datafile.dump    ## for debugging
  datafile.read    ## datafile step 2 - read all datasets 
end

task :build => [:clean,:create,:load] do
  puts 'Done.'
end

