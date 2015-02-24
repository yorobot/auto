
## $DEBUG = true
$RUBYLIBS_DEBUG = true

require 'zip'   # use $ gem install rubyzip

require 'fetcher'  ## check - fetcher already included in beerdb ??


require 'beerdb'


def fetch_openbeer_datafile( setup, dest )
  ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
  src = "http://github.com/openbeer/datafile/raw/master/#{setup}.rb"
  ## dest will be something like './Datafile'

  fetch_datafile( src, dest )
end

def fetch_openmundi_datafile( setup, dest )
  ## to be done
end


def fetch_datafile( src, dest )
  worker = Fetcher::Worker.new
  worker.copy( src, dest )
end


def unzip( src, dest, opts={} )
  ### todo/fix: rename or remove root folder -- use opts { root: false or something??}
  #  e.g
  #  !/beer-gh-pages/_templates/ becomes
  #  !/_templates/   etc.

  Zip::File.open( src ) do |zipfile|
    zipfile.each do |file|
      if file.directory?
        puts "  skip directory zip entry - #{file.name}"
      else
        name = file.name[ file.name.index('/')+1..-1]   ## cut-off root/first path entry
        path = File.join( dest, name)
        puts "  unzip file zip entry - #{file.name} to #{path}"
        FileUtils.mkdir_p( File.dirname( path) )
        zipfile.extract(file, path)  unless File.exist?(path)
      end
    end
  end
end


def fetch_beer_book_templates( dest_unzip )
  ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
  src      = "http://github.com/book-templates/beer/archive/gh-pages.zip"
  dest_zip = "./tmp/book-templates--I--beer.zip"
  fetch_book_templates( src, dest_zip )

  unzip( dest_zip, dest_unzip )
end


def fetch_book_templates( src, dest )
  ## step 1 - fetch archive
  worker = Fetcher::Worker.new
  worker.copy( src, dest )
  ### fix: add  src.sha5
  ###      inside folder
  ### lets us check if current HEAD version is in place across datafiles etc.
  ##  - try HTTP HEAD ?? to check?
end


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

task :dl => [BUILD_DIR,SETUP_DIR] do
  ## fetch Datafile
  fetch_openbeer_datafile( SETUP, DATAFILE_PATH )

  datafile = Datafile::Datafile.load_file( DATAFILE_PATH )
  datafile.dump        ## for debugging
  datafile.download    ## datafile step 1 - download all datasets/zips 
end

task :book_dl => [BUILD_DIR,SETUP_DIR,BOOK_DIR] do
  fetch_beer_book_templates( BOOK_DIR )
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

=begin
-- fix: latest beer reader; add minitest
[debug] Region b >Burgenland<
rake aborted!
NoMethodError: undefined method `load_breweries_worker' for #<BeerDb::ZipReader:0xb1c0588>
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/reader.rb:133:in `load_breweries_for_country_n_region'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/reader.rb:65:in `block in load'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/worlddb-models-2.2.0/lib/worlddb/matcher.rb:83:in `match_xxx_for_country_n_region'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/reader.rb:21:in `match_breweries_for_country_n_region'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/reader.rb:64:in `load'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/reader.rb:50:in `block in load_setup'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/fixture_reader.rb:121:in `block in each'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/fixture_reader.rb:120:in `each'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/textutils-1.2.0/lib/textutils/reader/fixture_reader.rb:120:in `each'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/reader.rb:49:in `load_setup'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/beerdb-models-1.0.0/lib/beerdb/models.rb:78:in `read_setup_from_zip'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/datafile-0.1.2/lib/datafile/datasets/beer.rb:14:in `read'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/datafile-0.1.2/lib/datafile/datafile.rb:89:in `block in read'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/datafile-0.1.2/lib/datafile/datafile.rb:88:in `each'
/home/gerald/.rvm/gems/ruby-2.1.4/gems/datafile-0.1.2/lib/datafile/datafile.rb:88:in `read'
...
=end

