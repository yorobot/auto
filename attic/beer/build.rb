#############
# settings

BUILD_DIR     = "./build"
PAGES_DIR     = "#{BUILD_DIR}/pages"  # use PAGES_OUTPUT_DIR or PAGES_ROOT ??
TEMPLATES_DIR = "./_templates"


DB_CONFIG = {
  adapter:  'sqlite3',
  database: "#{BUILD_DIR}/beer.db"
}


# stdlibs
require 'yaml'  # todo/check - already required in worlddb???
require 'erb'
require 'pp'


# 3rd party gems
require 'worlddb'   ### NB: for local testing use rake -I ./lib dev:test e.g. do NOT forget to add -I ./lib
require 'beerdb'

### require 'logutils/activerecord'   ## already included in worlddb ??


pp DB_CONFIG
ActiveRecord::Base.establish_connection( DB_CONFIG )



require_relative 'book'


### 'build book (draft version) - The Free World Beer Book - from beer.db'

build_book()                # multi-page version
##  build_book_for_country( 'at' )    # multi-page version
##  build_book_for_country( 'be' )    # multi-page version
##  build_book_for_country( 'cz' )    # multi-page version


## build_book( inline: true )  # all-in-one-page version a.k.a. inline version

puts 'Done.'
