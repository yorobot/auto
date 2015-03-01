

class BookPress

  class WorldConfig < Config

    def initialize( hash ) super; end

    def collection() 'world'; end

    ########
    # Datafile
    # -- remote
    def datafile_url() "http://github.com/openmundi/datafile/raw/master/#{setup}.rb"; end

    #######
    # Database
    def db_path() "#{build_dir}/#{collection}/#{setup}/#{collection}.db"; end
    def create_db!()  WorldDb.create_all;  end

    ####
    # Book Templates
    # -- remote
    def book_templates_url() "http://github.com/book-templates/world/archive/gh-pages.zip"; end
    # -- local zipped
    def book_templates_zip_name()  "book-templates--I--world"; end
    def book_templates_zip_dir()   "./tmp"; end   ## fix/todo: use download cache dir/getter -why,why not??
    def book_templates_zip_path()  "#{book_templates_zip_dir}/#{book_templates_zip_name}.zip"; end
    # --local unzipped

    ## rename to book_dir ?? why, why not? - split zip into book_dir and book_templates_dir why? why not?
    def book_templates_unzip_dir()  "#{build_dir}/#{collection}/#{setup}/book";  end
    ## --i/o
    ## def book_templates_pages_dir()     "#{book_templates_unzip_dir}/_pages"; end
    ## def book_templates_templates_dir() "#{book_templates_unzip_dir}/_templates"; end
  end # class BeerConfig


  def self.create_world_book_for( setup, opts={} )
    config = WorldConfig.new( setup: setup )
    BookPress.new( config )
  end

end  # class BookPress

