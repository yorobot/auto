

class BookPress

  class Config

    def initialize( hash )
      @hash = hash

      @build_dir  = hash[:build_dir] || './build'  ## note: defaults to ./build
      @setup      = hash[:setup]
    end

    def build_dir()  @build_dir;   end
    def setup()      @setup;       end   ## e.g. at, franken, worldcup, etc.

    ######
    # Datafile
    # -- local
    def datafile_dir()  "#{build_dir}/#{collection}/#{setup}";  end
    def datafile_path() "#{datafile_dir}/Datafile";  end

    ######
    # Bookfile    -- allow multiple (more than one) bookfiles - how? why, why not???
    # -- local
    def bookfile_dir()  "#{build_dir}/#{collection}/#{setup}";  end
    def bookfile_path() "#{datafile_dir}/Bookfile";  end
  end



  def initialize( config )
    @config = config
  end

  def dl_datasets
    ## fetch Datafile
    datafile_dir  = @config.datafile_dir
    datafile_path = @config.datafile_path

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( datafile_dir )  unless Dir.exists?( datafile_dir )

    ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
    src = @config.datafile_url
    ## dest will be something like './Datafile'

    fetch_datafile( src, datafile_path )

    datafile = Datafile::Datafile.load_file( datafile_path )
    datafile.dump        ## for debugging
    datafile.download    ## datafile step 1 - download all datasets/zips 
  end


  def dl_book_templates
    ## fetch Bookfile
    bookfile_dir  = @config.bookfile_dir
    bookfile_path = @config.bookfile_path

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( bookfile_dir )  unless Dir.exists?( bookfile_dir )

    ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
    src = @config.bookfile_url
    ## dest will be something like './Bookfile'

    fetch_bookfile( src, bookfile_path )


    bookfile = Bookfile::Bookfile.load_file( bookfile_path )

    bookfile.dump        ## for debugging
    bookfile.download    ## bookfile step 1 - download all packages/zips (defaults to ./tmp) 
    
    ## todo/check: already checked in unzip if folder exists???
    dest_unzip = @config.book_templates_unzip_dir
    FileUtils.mkdir_p( dest_unzip )  unless Dir.exists?( dest_unzip )

    bookfile.unzip( dest_unzip )   ## bookfile step 2 - unzip book templates 
  end


  def connect
    db_path = @config.db_path

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


  def build
    ## clean; remove db if exits

    db_path = @config.db_path
    FileUtils.rm( db_path )  if File.exists?( db_path )

    connect()
    @config.create_db!

    datafile_path = @config.datafile_path
    pp datafile_path
    
    ### hack/quick fix for at,de - "standalone quick test": todo
    ##   - find something better
    if datafile_path.end_with?( 'at.rb' ) ||
       datafile_path.end_with?( '/at/Datafile' )
      ## standalone austria for debugging add country
      WorldDb::Model::Country.create!( key: 'at',
                                name: 'Austria',
                                code: 'AUT',
                                pop: 0,
                                area: 0 )
    elsif datafile_path.end_with?( 'de.rb' ) ||
          datafile_path.end_with?( '/de/Datafile' )
      WorldDb::Model::Country.create!( key: 'de',
                                name: 'Germany',
                                code: 'GER',
                                pop: 0,
                                area: 0 )
    else
      # no special case; continue
      puts "[debug] - no special world archive case w/ start script; continue"
    end


    datafile = Datafile::Datafile.load_file( datafile_path )
    datafile.dump    ## for debugging

    logger = LogUtils::Logger.root
    logger.level = :debug

    datafile.read    ## datafile step 2 - read all datasets 
  end


  def build_book_worker
    connect()

    ## fix: find a better way to pass along settings (do NOT use globals)
    $pages_dir     = "#{@config.book_templates_unzip_dir}/_pages"


    bookfile_path = @config.bookfile_path

###  fix: add convenience Bookfile.load_file to bookfile gem
###    bookfile = Bookfile::Bookfile.load_file( bookfile_path )
    builder = Bookfile::Builder.load_file( bookfile_path )
    bookfile = builder.bookfile

    bookfile.dump        ## for debugging

    ### fix:
    ###     assume WorldDb::Models already included ??
    ## - for now always include on prepare
    bookfile.prepare( @config.book_templates_unzip_dir )

    puts "  contintents: #{WorldDb::Model::Continent.count}"   ## for debugging

    bookfile.build( @config.book_templates_unzip_dir )

    ## build book (draft version) - The Free World Fact Book - from world.db
    ## build_book() # multi-page version
    ### build_book( inline: true ) # all-in-one-page version a.k.a. inline version

    puts 'Done.'
  end


  def run_jekyll
    # change cwd folder
    cwd = FileUtils.pwd
    puts "cwd: #{cwd}"
    FileUtils.cd( @config.book_templates_unzip_dir )
    ## use `cd #{book_dir}; jekyll build`  -- why, why not???
    puts `jekyll build`

    # restore cwd folder
    FileUtils.cd( cwd )
  end



  def run  # fix: change to build, why, why not??
    ## all-in-one; do everything; complete all steps
    
    dl_datasets
    dl_book_templates

    build   ### fix: change build_database - why, why not ??
    build_book_worker
    run_jekyll
  end


  def old_dl_book_templates_remove
    ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
    src      = @config.book_templates_url
    dest_zip = @config.book_templates_zip_path
    
    fetch_book_templates( src, dest_zip )

    dest_unzip = @config.book_templates_unzip_dir

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( dest_unzip )  unless Dir.exists?( dest_unzip )

    unzip( dest_zip, dest_unzip )
  end

  def old_build_book_worker_remove
    connect()

    ## fix: find a better way to pass along settings (do NOT use globals)
    $pages_dir     = "#{@config.book_templates_unzip_dir}/_pages"
    $templates_dir = "#{@config.book_templates_unzip_dir}/_templates"

    ## todo/check
    ##  fix: only include once outside of class ???
    require "#{@config.book_templates_unzip_dir}/_scripts/book"

    puts "  contintents: #{WorldDb::Model::Continent.count}"

    ## build book (draft version) - The Free World Fact Book - from world.db
    build_book() # multi-page version
    ### build_book( inline: true ) # all-in-one-page version a.k.a. inline version

    puts 'Done.'
  end


end  # class BookPress

