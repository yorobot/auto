# auto

scripts to automate building databases, books, etc.


TODO: merge/cleanup two readmes


# Beer.db README

Build scripts to automate building databases (`beer.db`),
books, etc.


## Usage

Use `./build_all`  to build all databases and books
or use the rake tasks for step by step builds:


### Step 1: Download Datasets

~~~
task db:dl     # e.g. use rake db:dl SETUP=bayern
~~~

Datasets get downloaded to `./tmp` as zip archives
(e.g. `openmundi--I--world.db.zip`, `openbeer--I--by-bayern.zip`, etc.).


### Step 2: Build Database

~~~
task db:build    # e.g. use rake db:build SETUP=bayern
~~~

Build database (e.g. `beer.db`) from scratch.
Note: For every setup (e.g. `bayern`, `be`, etc.)
the script creates its own folder (e.g. `./build/bayern`, `./build/be`, etc.)
and `beer.db`. The script creates all database tables
and reads in all datasets (using a Datafile).


### Step 3: Download Book Template Pack

~~~
task book:db     # e.g. use rake book:dl SETUP=bayern
~~~

Book template packs get downloaded to `./tmp` as zip archives
(e.g. `book-templates--I--beer.zip` etc.)
and unpacked (unzipped) in the setup folder (e.g. `./build/bayern/book`).


### Step 4: Build Book Pages

~~~
task book:build    # e.g. use rake book:build SETUP=bayern
~~~

Build book pages from the book page templates (using a Bookfile).
Note: All book pages get saved in the `_pages` folder.
The script builds two book versions: 1) an all-in-one page
version and 2) a multi-page version.


### Step 5: Generate Static Site (Books) Using Jekyll

~~~
task book:jekyll    # e.g. use rake book:build SETUP=bayern
~~~

Run Jekyll inside the book folder to generate the static site (`_site/`),
that is, the books in two-versions - 1) an all-in-one-page version (`_site/book.html`)
and 2) a multi-page pversion( `_site/index.html`).
Note: The site uses a "flat" page structure (no subfolders)
so you can test (open) the pages in your browser
(even without a web server running).


### All Together Now

~~~
task build    # e.g. use rake build SETUP=bayern
~~~

Use the build task to run all tasks, that is:

- Step 1: `db:dl`
- Step 2: `db:build`
- Step 3: `book:dl`
- Step 4: `book:build`
- Step 5: `book:jekyll`



### Setups

For available (pre-configured) setups, see the
[Datafile repo](https://github.com/openbeer/datafile). Setups include:

- [bayern](https://github.com/openbeer/datafile/blob/master/bayern.rb)
- [franken](https://github.com/openbeer/datafile/blob/master/franken.rb)
- [at](https://github.com/openbeer/datafile/blob/master/at.rb)
- [be](https://github.com/openbeer/datafile/blob/master/be.rb)
- [cz](https://github.com/openbeer/datafile/blob/master/cz.rb)
- [europe](https://github.com/openbeer/datafile/blob/master/europe.rb)



## Installation

Make sure to install the latest versions:

~~~
$ gem install bookfile             # book builder script
$ gem install bookman              # book builder
$ gem install sportdb              # football.db machinery
$ gem install jekyll               # static site generator
~~~



## License

The build scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments? Updates?

Send them along to the
[Open Beer, Breweryn n Brewpub Data Forum/Mailing List](http://groups.google.com/group/beerdb).
Thanks!



# Football.db README
Build scripts to automate building databases (`football.db`),
books, etc.


## Usage

Use `./build_all`  to build all databases and books
or use the rake tasks for step by step builds:


### Step 1: Download Datasets

~~~
task db:dl     # e.g. use rake db:dl SETUP=worldcup
~~~

Datasets get downloaded to `./tmp` as zip archives
(e.g. `openmundi--I--world.db.zip`, `openfootball--I--world-cup.zip`, etc.).


### Step 2: Build Database

~~~
task db:build    # e.g. use rake db:build SETUP=worldcup
~~~

Build database (e.g. `football.db`) from scratch.
Note: For every setup (e.g. `worldcup`, `en2014-15`, etc.)
the script creates its own folder (e.g. `./build/worldcup`, `./build/en2014-15`, etc.)
and `football.db`. The script creates all database tables
and reads in all datasets (using a Datafile).


### Step 3: Download Book Template Pack

~~~
task book:db     # e.g. use rake book:dl SETUP=worldcup
~~~

Book template packs get downloaded to `./tmp` as zip archives
(e.g. `book-templates--I--football.zip` etc.)
and unpacked (unzipped) in the setup folder (e.g. `./build/worldcup/book`).


### Step 4: Build Book Pages

~~~
task book:build    # e.g. use rake book:build SETUP=worldcup
~~~

Build book pages from the book page templates (using a Bookfile).
Note: All book pages get saved in the `_pages` folder.
The script builds two book versions: 1) an all-in-one page
version and 2) a multi-page version.


### Step 5: Generate Static Site (Books) Using Jekyll

~~~
task book:jekyll    # e.g. use rake book:build SETUP=worldcup
~~~

Run Jekyll inside the book folder to generate the static site (`_site/`),
that is, the books in two-versions - 1) an all-in-one-page version (`_site/book.html`)
and 2) a multi-page pversion( `_site/index.html`).
Note: The site uses a "flat" page structure (no subfolders)
so you can test (open) the pages in your browser
(even without a web server running).


### All Together Now

~~~
task build    # e.g. use rake build SETUP=worldcup
~~~

Use the build task to run all tasks, that is:

- Step 1: `db:dl`
- Step 2: `db:build`
- Step 3: `book:dl`
- Step 4: `book:build`
- Step 5: `book:jekyll`



### Setups

For available (pre-configured) setups, see the
[Datafile repo](https://github.com/openfootball/datafile). Setups include:

- [`worldcup`](https://github.com/openfootball/datafile/blob/master/worldcup.rb), [`worldcup2014`](https://github.com/openfootball/datafile/blob/master/worldcup2014.rb),
- [`top`](https://github.com/openfootball/datafile/blob/master/top.rb), [`top2014-15`](https://github.com/openfootball/datafile/blob/master/top2014-15.rb),
- [`cl2014-15`](https://github.com/openfootball/datafile/blob/master/cl2014-15.rb),
- [`en2014-15`](https://github.com/openfootball/datafile/blob/master/en2014-15.rb), [`en`](https://github.com/openfootball/datafile/blob/master/en.rb)
- [`de2014-15`](https://github.com/openfootball/datafile/blob/master/de2014-15.rb), [`de`](https://github.com/openfootball/datafile/blob/master/de.rb)
- [`es2014-15`](https://github.com/openfootball/datafile/blob/master/es2014-15.rb), [`es`](https://github.com/openfootball/datafile/blob/master/es.rb)
- [`it2014-15`](https://github.com/openfootball/datafile/blob/master/it2014-15.rb), [`it`](https://github.com/openfootball/datafile/blob/master/it.rb)
- [`fr2014-15`](https://github.com/openfootball/datafile/blob/master/fr2014-15.rb), [`fr`](https://github.com/openfootball/datafile/blob/master/fr.rb)
- [`at2014-15`](https://github.com/openfootball/datafile/blob/master/at2014-15.rb), [`at`](https://github.com/openfootball/datafile/blob/master/at.rb)



## Installation

Make sure to install the latest versions:

~~~
$ gem install bookfile             # book builder script
$ gem install bookman              # book builder
$ gem install sportdb              # football.db machinery
$ gem install jekyll               # static site generator
~~~



## License

The build scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Send them along to the
[Open Sports & Friends Forum/Mailing List](http://groups.google.com/group/opensport).
Thanks!
