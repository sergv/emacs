#! /usr/bin/env bash
#
# File: make-conf.sh
#
# Created: Saturday,  3 December 2011
#

set -e

# clean *EVERYONE*
# make extraclean

# plain conf
# export CC=clang
export CC=gcc
export CFLAGS=-O2\ -m64\ -g3\ -mtune=native\ -march=native\ -fno-omit-frame-pointer

# export CFLAGS=-O2\ -mtune=native\ -march=native\ -fno-omit-frame-pointer\ -m64\ -g


#export CFLAGS=-Og\ -m64\ -g3\ -mtune=native\ -march=native
# export CFLAGS=-Og\ -m64\ -g3

# export CC=gcc
# export CFLAGS=-Og\ -m64\ -g3
# #\ -mtune=native\ -march=native

#export PATH="/home/sergey/projects/emacs/gcc-9.2-jit/bin:$PATH"
#export CC=/home/sergey/projects/emacs/gcc-9.2-jit/bin/gcc

# export CFLAGS="-g3 -O2 -mmpx -fcheck-pointer-bounds"

#export CFLAGS=-O2\ -fomit-frame-pointer\ -m32\ -g0
# export CFLAGS=-O2\ -fomit-frame-pointer\ -m64\ -g0

#./configure --prefix="/home/sergey/emacs/local-24.5/" --without-makeinfo --without-gpm --with-dbus --with-gconf --with-gsettings --with-gnutls --with-xft --with-imagemagick --with-wide-int --without-pop --without-kerberos --enable-largefile --without-toolkit-scroll-bars --with-x-toolkit=gtk3 --without-gif  --without-tiff --without-makeinfo --without-sound --enable-link-time-optimization

# --prefix="/home/sergey/projects/editors/emacs/installed/local-26.1-debug/" \
# --prefix="/tmp/emacs-local-26.1-debug/" \
# --prefix="/tmp/emacs-local-27.0-debug/" \

#--build=x86_64-pc-linux-gnu

# native_comp="1"
native_comp="0"

export NATIVE_FULL_AOT="$native_comp"

./configure \
       --prefix="/home/sergey/projects/emacs/installed/local-30.0-candidate/" \
       --with-gconf \
       --with-gsettings \
       --without-imagemagick \
       --with-wide-int \
       --without-pop \
       --without-mailutils \
       --without-kerberos \
       --without-hesiod \
       --enable-largefile \
       --with-xpm \
       --with-png \
       --with-rsvg \
       --with-tiff \
       --with-jpeg \
       --without-gif  \
       --with-sound=alsa \
       --with-xml2 \
       --with-xft \
       --with-libotf \
       --disable-link-time-optimization \
       --with-x-toolkit=gtk3 \
       --without-toolkit-scroll-bars \
       --with-threads \
       --without-xwidgets \
       --with-modules \
       --without-gpm \
       --with-libsystemd \
       --with-dbus \
       --with-gnutls \
       --with-zlib \
       --enable-silent-rules \
       --with-pdumper=yes \
       --with-unexec=no \
       --with-dumping=pdumper \
       --with-cairo \
       --with-harfbuzz \
       --with-json \
       --with-libgmp \
       --with-native-compilation=no \
       --with-tree-sitter

# \
#        --enable-checking
# \
#        --with-tree-sitter \
#        --with-sqlite3
       # --with-native-compilation
       # --with-xwidgets

# make NATIVE_FULL_AOT="$native_comp" -j4
# make NATIVE_FULL_AOT="$native_comp" install

make -j12
make install

#        --without-native-compilation
#        --with-native-compilation

       #--with-nativecomp

       # --enable-checking=all


            # tcc conf, does not work due to -pthread issues - enabling this flag makes tcc miss 'main' symbol.
            # export CC=tcc
            # # export CFLAGS=
            # # -Wall\ -Wunsupported\ -Wwrite-strings
            # # -Werror\
                # ./configure --prefix="/home/sergey/projects/emacs/installed/local-25.2-opt/" \
                #             --without-makeinfo \
                #             --with-gconf \
                #             --with-gsettings \
                #             --with-imagemagick \
                #             --with-wide-int \
                #             --with-pop \
                #             --without-kerberos \
                #             --enable-largefile \
                #             --without-xpm \
                #             --with-png \
                #             --without-gif  \
                #             --without-tiff \
                #             --without-makeinfo \
                #             --with-sound=alsa \
                #             --without-xml2 \
                #             --with-xft \
                #             --with-libotf \
                #             --disable-link-time-optimization \
                #             --with-x-toolkit=gtk3 \
                #             --without-toolkit-scroll-bars \
                #             --with-xwidgets \
                #             --with-modules \
                #             --with-lib \
                #             --without-gpm \
                #             --with-dbus \
                #             --with-gnutls \
                #             --with-zlib

#make -j5
#make install

exit 0

