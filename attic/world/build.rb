# encoding: utf-8

#############
# settings

BUILD_DIR     = "./build"
PAGES_DIR     = "#{BUILD_DIR}/pages"  # use PAGES_OUTPUT_DIR or PAGES_ROOT ??
TEMPLATES_DIR = "./_templates"


DB_CONFIG = {
  adapter:  'sqlite3',
  database: "#{BUILD_DIR}/world.db"
}

## $DEBUG = true
$RUBYLIBS_DEBUG = true


# stdlibs
require 'yaml'
require 'erb'
require 'pp'


# 3rd party libs/gems
require 'logutils'
require 'logutils/activerecord'
require 'worlddb'

require 'hybook'   # book builder n helpers



pp DB_CONFIG
ActiveRecord::Base.establish_connection( DB_CONFIG )


require_relative 'book'



## build book (draft version) - The Free World Fact Book - from world.db

build_book()                # multi-page version
### build_book( inline: true )  # all-in-one-page version a.k.a. inline version

puts 'Done.'

