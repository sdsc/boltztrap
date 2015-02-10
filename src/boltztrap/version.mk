ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-boltztrap
VERSION        = 1.2.5
RELEASE        = 1
PKGROOT        = /opt/boltztrap

SRC_SUBDIR     = boltztrap

SOURCE_NAME    = BoltzTraP
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SRC_SUBDIR)-$(VERSION)

TAR_BZ2_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
