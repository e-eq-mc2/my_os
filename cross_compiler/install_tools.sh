#!/bin/sh
set -x

export CC=/usr/local/bin/gcc-7
export CXX=/usr/local/bin/g++-7
export LD=/usr/local/bin/gcc-7
export PREFIX_BASE=$HOME/opt

install_tools() {
  local TARGET="$1"

  PREFIX=$PREFIX_BASE/$TARGET
  MAKE_OPTIONS=-j8

  BINUTILS=binutils-2.30
  BINUTILS_PREFIX=$PREFIX/$(echo $BINUTILS | sed -e 's/-/\//g')
  BINUTILS_CONFIGURE_OPTIONS="--disable-multilib --disable-nls --disable-werror"

  ICONV=libiconv-1.15
  ICONV_PREFIX=$PREFIX/$(echo $ICONV | sed -e 's/-/\//g')

  GCC=gcc-7.3.0
  GCC_PREFIX=$PREFIX/$(echo $GCC | sed -e 's/-/\//g')
  GCC_CONFIGURE_OPTIONS="--enable-languages=c,c++ --disable-multilib --disable-nls --disable-libssp --disable-bootstrap --with-gmp=/usr/local --with-mpfr=/usr/local --with-mpc=/usr/local --with-libiconv-prefix=$ICONV_PREFIX"

  GRUB=grub
  GRUB_PREFIX=$PREFIX/$(echo $GRUB | sed -e 's/-/\//g')
  GRUB_CONFIGURE_OPTIONS="BUILD_CC=/usr/local/bin/gcc-7 --disable-werror --disable-nls TARGET_CC=$TARGET-gcc TARGET_CC_FLAGS="-B $PREFIX/" TARGET_OBJCOPY=$TARGET-objcopy TARGET_STRIP=$TARGET-strip TARGET_NM=$TARGET-nm TARGET_RANLIB=$TARGET-ranlib"

  # Step 1. Binutils
  if false; then
    #curl -O http://ftp.gnu.org/gnu/binutils/$BINUTILS.tar.gz
    tar xf $BINUTILS.tar.gz

    tmpdir=tmp-$BINUTILS
    rm -rf $tmpdir
    mkdir -p $tmpdir
    cd $tmpdir

    ../$BINUTILS/configure --prefix=$BINUTILS_PREFIX --target=$TARGET $BINUTILS_CONFIGURE_OPTIONS
    make $MAKE_OPTIONS
    make install
    cd ..
  fi

  # Step 2. iconv
  if false; then
    #curl -O https://ftp.gnu.org/pub/gnu/libiconv/$ICONV.tar.gz
    tar xf $ICONV.tar.gz

    tmpdir=tmp-$ICONV
    rm -rf $tmpdir
    mkdir -p $tmpdir 
    cd $tmpdir

    ../$ICONV/configure -prefix=$ICONV_PREFIX
    make $MAKE_OPTIONS
    make install
    cd ..
  fi

  # Step 3. GCC
  if false; then
    #curl -O https://ftp.gnu.org/gnu/gcc/$GCC/$GCC.tar.gz
    tar xf $GCC.tar.gz

    tmpdir=tmp-$GCC
    rm -rf $tmpdir
    mkdir -p $tmpdir
    cd $tmpdir

    ../$GCC/configure --prefix=$GCC_PREFIX --target=$TARGET $GCC_CONFIGURE_OPTIONS 
    make $MAKE_OPTIONS all-gcc
    rm -rf $GCC_PREFIX/*
    make install-gcc
    cd ..
  fi

  # Step 4. GRUB
  if true; then
    #git clone --depth 1 git://git.savannah.gnu.org/grub.git

    export PATH=$BINUTILS_PREFIX/bin:$PATH

    export TARGET_CC=$GCC_PREFIX/bin/i386-elf-gcc
    export TARGET_OBJCOPY=$BINUTILS_PREFIX/bin/i386-elf-objcopy
    export TARGET_STRIP=$BINUTILS_PREFIX/bin/i386-elf-strip
    export TARGET_NM=$BINUTILS_PREFIX/bin/i386-elf-nm
    export TARGET_RANLIB=$BINUTILS_PREFIX/bin/i386-elf-ranlib
    export TARGET_CCAS=$BINUTILS_PREFIX/bin/i386-elf-as
    ln $BINUTILS_PREFIX/$TARGET/bin/as $GCC_PREFIX/libexec/gcc/$TARGET/$(echo $GCC | cut -d'-' -f 2)/

    cd grub
    sh autogen.sh
    cd ..

    tmpdir=tmp-$GRUB
    rm -rf $tmpdir
    mkdir -p $tmpdir
    cd $tmpdir

    ../$GRUB/configure --prefix=$GRUB_PREFIX --target=$TARGET $GRUB_CONFIGURE_OPTIONS
    make
    make install
    cd ..
  fi
}

#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew install gmp
#brew install mpfr
#brew install libmpc
#brew install gcc

install_tools i386-elf
#install_tools i686-elf
#install_tools x86_64-elf
