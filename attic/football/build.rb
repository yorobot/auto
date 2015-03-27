# encoding: utf-8

#############
# settings

BUILD_DIR     = "./build"
PAGES_DIR     = "#{BUILD_DIR}/pages"  # use PAGES_OUTPUT_DIR or PAGES_ROOT ??
TEMPLATES_DIR = "./_templates"


DB_CONFIG = {
  adapter:  'sqlite3',
  database: "#{BUILD_DIR}/football.db"
}


# 3rd party gems
require 'worlddb'
require 'sportdb'  ## will include worlddb - remove require worlddb

### require 'logutils/activerecord'   ## already included in worlddb ??

require 'hybook'


pp DB_CONFIG
ActiveRecord::Base.establish_connection( DB_CONFIG )


require_relative 'book'


###  build book (draft version) - The Free Football World Almanac - from football.db'

build_book()                # multi-page version
## build_book( inline: true )  # all-in-one-page version a.k.a. inline version

puts 'Done.'

