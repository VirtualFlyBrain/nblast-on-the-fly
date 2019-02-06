# nblast-on-the-fly
Containerised NBLAST on-the-fly instance 

[Dockerfile](./Dockerfile) sets up the general environment based
on the [rocker/shiny](https://hub.docker.com/r/rocker/shiny/) docker image.


The main file is `loadScript.R` which installs (if required) all packages
when the container is restarted and downloads the data. The data is cached 

`bootScript.R` was intended for travis testing but is not currently in use
as the build time was still too long (>60m) for travis. `.travis.yml` is
also therefore not currently in use.

## Installation issues

There have been regular problems with rgl running headless. This can 
block installation since a number of packages. For example:

```
* installing *source* package 'alphashape3d' ...
** package 'alphashape3d' successfully unpacked and MD5 sums checked
** libs
gcc -I"/usr/local/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c alphashape3d.c -o alphashape3d.o
gcc -I"/usr/local/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c init.c -o init.o
gcc -I"/usr/local/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c insideashape.c -o insideashape.o
gcc -I"/usr/local/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c surfaceNormals.c -o surfaceNormals.o
gcc -shared -L/usr/local/lib/R/lib -L/usr/local/lib -o alphashape3d.so alphashape3d.o init.o insideashape.o surfaceNormals.o -L/usr/local/lib/R/lib -lR
installing to /usr/local/lib/R/site-library/alphashape3d/libs
** R
** byte-compile and prepare package for lazy loading
Error: package or namespace load failed for 'rgl':
 .onLoad failed in loadNamespace() for 'rgl', details:
  call: rgl.init(initValue, onlyNULL)
  error: (converted from warning) RGL: unable to open X11 display
Error : package 'rgl' could not be loaded
ERROR: lazy loading failed for package 'alphashape3d'
* removing '/usr/local/lib/R/site-library/alphashape3d'
Error in i.p(...) :
  (converted from warning) installation of package 'alphashape3d' had non-zero exit status
Calls: <Anonymous> ... with_rprofile_user -> with_envvar -> force -> force -> i.p
Execution halted
```

We can tell rgl to use a [null device](https://www.rdocumentation.org/packages/rgl/topics/rgl.useNULL) but
sometimes this doesn't seem to catch. We can ensure that the right thing
happens by setting:

```
ENV RGL_USE_NULL=TRUE
```

### xvfb

xvfb can make a headless x session. It seems to have been installed by the Dockerfile
since 7e3d67519dc0a66ec558530e0c85d69b5a12439a on 4 April 2018 but not actually used.

from the begining. This should help.

### Multiple package versions
This is anothe possible problem. There could be several places in 
which packages are installed (e.g. by the original rocker image).

Another pitfall here is the packrat snapshot system, which may result in the 
installation of old versions of packages like rgl. In general all nat.* packages
are kept up to date and functional at the bleeding edge, so it's normally
easier to go with the latest versions of everything.

### CRAN vs GitHub

Some packages are only on github because they cannot meet CRAN's requirements.
It is possible that installation of packages from  GitHub might trigger
installation of dependencies from CRAN even though the GitHub version should
be preferred. This could also cause trouble.

Finally it is worth noting that the rocker image seems to set MRAN as
the default CRAN repository. This is a snapshotted version of CRAN.

