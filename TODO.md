
fix: latest beer reader; add minitest

~~~
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
~~~


