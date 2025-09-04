include(FindPackageHandleStandardArgs)

find_path(
  PDFium_INCLUDE_DIR
  NAMES "fpdfview.h"
  PATHS "${CMAKE_CURRENT_LIST_DIR}"
  PATH_SUFFIXES "include")

set(PDFium_VERSION "#VERSION#")

find_library(
  PDFium_LIBRARY
  NAMES "pdfium"
  PATHS "${CMAKE_CURRENT_LIST_DIR}"
  PATH_SUFFIXES "lib")

add_library(pdfium SHARED IMPORTED)
set_target_properties(
  pdfium
  PROPERTIES IMPORTED_LOCATION "${PDFium_LIBRARY}"
             INTERFACE_INCLUDE_DIRECTORIES
             "${PDFium_INCLUDE_DIR};${PDFium_INCLUDE_DIR}/cpp")

find_package_handle_standard_args(
  PDFium
  REQUIRED_VARS PDFium_LIBRARY PDFium_INCLUDE_DIR
  VERSION_VAR PDFium_VERSION)
