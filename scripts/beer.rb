

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

end  # class BeerPress

