find_package(apr REQUIRED)
find_package(openssl REQUIRED)
# determine version from configure.ac
file(STRINGS configure.ac MAJOR REGEX "^ACTIVEMQ_MAJOR_VERSION=([0-9]+)")
file(STRINGS configure.ac MINOR REGEX "^ACTIVEMQ_MINOR_VERSION=([0-9]+)")
file(STRINGS configure.ac PATCH REGEX "^ACTIVEMQ_PATCH_VERSION=([0-9]+)")
string(REGEX MATCH "([0-9]+)" MAJOR ${MAJOR})
string(REGEX MATCH "([0-9]+)" MINOR ${MINOR})
string(REGEX MATCH "([0-9]+)" PATCH ${PATCH})
set(AMQ_VER ${MAJOR}.${MINOR}.${PATCH})
if(UNIX)
  include(configure.cmake)
endif()
include(CheckCXXCompilerFlag)
check_cxx_compiler_flag("-Wno-deprecated-declarations" has_noDeprecatedDeclarations)
if(has_noDeprecatedDeclarations)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-declarations")
endif()
set(lib activemqcpp)
set(targetsFile ${lib}-targets)
xpExternPackage(NAMESPACE ${XP_NAMESPACE}
  TARGETS_FILE ${targetsFile} LIBRARIES activemqcpp
  BASE ${CMAKE_PROJECT_NAME}-${AMQ_VER} XPDIFF "auto" DEPS apr openssl
  WEB "http://activemq.apache.org/cms/" UPSTREAM "github.com/apache/activemq-cpp"
  DESC "ActiveMQ C++ Messaging Service (CMS) client library"
  LICENSE "[Apache-2.0](http://www.apache.org/licenses/LICENSE-2.0.html 'Apache License, Version 2.0')"
  )
add_subdirectory(src/main)
add_subdirectory(src/examples)
