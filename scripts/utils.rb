

def fetch_datafile( src, dest )
  worker = Fetcher::Worker.new
  worker.copy( src, dest )
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


