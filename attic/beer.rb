

class BeerPress

  def initialize( build_dir )
    @build_dir = build_dir
  end


  def dl_datasets_for( setup )
    ## fetch Datafile
    datafile_dir  = "#{@build_dir}/beer/#{setup}"
    datafile_path = "#{datafile_dir}/Datafile"

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( datafile_dir )  unless Dir.exists?( datafile_dir )

    ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
    src = "http://github.com/openbeer/datafile/raw/master/#{setup}.rb"
    ## dest will be something like './Datafile'

    fetch_datafile( src, datafile_path )

    datafile = Datafile::Datafile.load_file( datafile_path )
    datafile.dump        ## for debugging
    datafile.download    ## datafile step 1 - download all datasets/zips 
  end


  def dl_book_templates( setup )
    ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
    src      = "http://github.com/book-templates/beer/archive/gh-pages.zip"
    dest_zip = "./tmp/book-templates--I--beer.zip"
    
    fetch_book_templates( src, dest_zip )

    dest_unzip = "#{@build_dir}/beer/#{setup}/book"

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( dest_unzip )  unless Dir.exists?( dest_unzip )

    unzip( dest_zip, dest_unzip )
  end


  def connect( setup )
    db_path = "#{@build_dir}/beer/#{setup}/beer.db"

    db_config = {
     adapter:  'sqlite3',
     database: db_path
    }

    pp db_config
    ActiveRecord::Base.establish_connection( db_config )

    c = ActiveRecord::Base.connection

    ## try to speed up sqlite
    ## see http://www.sqlite.org/pragma.html
    c.execute( 'PRAGMA synchronous=OFF;' )
    c.execute( 'PRAGMA journal_mode=OFF;' )
    ## c.execute( 'PRAGMA journal_mode=MEMORY;' )
    c.execute( 'PRAGMA temp_store=MEMORY;' )
  end


  def build_for( setup )
    ## clean; remove db if exits

    db_path = "#{@build_dir}/beer/#{setup}/beer.db"
    FileUtils.rm( db_path )  if File.exists?( db_path )

    connect( setup )
    BeerDb.create_all

    datafile_path = "#{@build_dir}/beer/#{setup}/Datafile"

    datafile = Datafile::Datafile.load_file( datafile_path )
    datafile.dump    ## for debugging
    datafile.read    ## datafile step 2 - read all datasets 
  end


  def build_book_for( setup )
    connect( setup )

    ## fix: find a better way to pass along settings (do NOT use globals)
    $pages_dir     = "#{@build_dir}/beer/#{setup}/book/_pages"
    $templates_dir = "#{@build_dir}/beer/#{setup}/book/_templates"

    ## todo/check
    ##  fix: only include once outside of class ???
    require "#{@build_dir}/beer/#{setup}/book/_scripts/book"

    puts "  contintents: #{WorldDb::Model::Continent.count}"

    ## build book (draft version) - The Free World Fact Book - from world.db
    build_book() # multi-page version
    ### build_book( inline: true ) # all-in-one-page version a.k.a. inline version

    puts 'Done.'
  end

end  # class BeerPress

