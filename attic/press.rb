

  def old_dl_book_templates
    ## note: lets use http:// instead of https:// for now - lets us use person proxy (NOT working w/ https for now)
    src      = @config.book_templates_url
    dest_zip = @config.book_templates_zip_path
    
    fetch_book_templates( src, dest_zip )

    dest_unzip = @config.book_templates_unzip_dir

    ## check if folders exists? if not create folder in path
    FileUtils.mkdir_p( dest_unzip )  unless Dir.exists?( dest_unzip )

    unzip( dest_zip, dest_unzip )
  end

  def old_build_book_worker
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


def fetch_book_templates( src, dest )
  ## step 1 - fetch archive
  worker = Fetcher::Worker.new
  worker.copy( src, dest )
  ### fix: add  src.sha5
  ###      inside folder
  ### lets us check if current HEAD version is in place across datafiles etc.
  ##  - try HTTP HEAD ?? to check?
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

