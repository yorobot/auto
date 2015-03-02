

rem ## rake beer:book:dl SETUP=at

call rake beer:run SETUP=at
call rake beer:run SETUP=cz

call rake world:run SETUP=countries


call rake ft:run SETUP=worldcup

rem ## rake ft:run SETUP=cl2014-15    -- fix: northern ireland code (nd->nir)

call rake ft:run SETUP=en2014-15
call rake ft:run SETUP=en
