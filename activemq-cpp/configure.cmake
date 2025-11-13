include(xpcfg)
include(CheckCXXCompilerFlag)
include(CheckTypeSize)
include(CMakePushCheckState)
include(TestBigEndian)
cmake_push_check_state(CONFIGURE_CMAKE)
########################################
xpcfgCheckIncludeFile(windows.h HAVE_WINDOWS_H)
if(HAVE_WINDOWS_H)
  add_compile_definitions(WIN32_LEAN_AND_MEAN) # Define to avoid automatic inclusion of winsock.h
endif()
xpcfgCheckIncludeFile(dlfcn.h HAVE_DLFCN_H)
xpcfgCheckIncludeFile(errno.h HAVE_ERRNO_H)
xpcfgCheckIncludeFile(inttypes.h HAVE_INTTYPES_H)
xpcfgCheckIncludeFile(limits.h HAVE_LIMITS_H)
xpcfgCheckIncludeFile(memory.h HAVE_MEMORY_H)
xpcfgCheckIncludeFile(objbase.h HAVE_OBJBASE_H)
xpcfgCheckIncludeFile(pthread.h HAVE_PTHREAD_H)
xpcfgCheckIncludeFile(repcdce.h HAVE_REPCDCE_H)
xpcfgCheckIncludeFile(sched.h HAVE_SCHED_H)
xpcfgCheckIncludeFile(semaphore.h HAVE_SEMAPHORE_H)
xpcfgCheckIncludeFile(signal.h HAVE_SIGNAL_H)
xpcfgCheckIncludeFile(stdint.h HAVE_STDINT_H)
xpcfgCheckIncludeFile(stdlib.h HAVE_STDLIB_H)
xpcfgCheckIncludeFile(strings.h HAVE_STRINGS_H)
xpcfgCheckIncludeFile(string.h HAVE_STRING_H)
xpcfgCheckIncludeFile(sys/filio.h HAVE_SYS_FILIO_H)
xpcfgCheckIncludeFile(sys/ioctl.h HAVE_SYS_IOCTL_H)
xpcfgCheckIncludeFile(sys/resource.h HAVE_SYS_RESOURCE_H)
xpcfgCheckIncludeFile(sys/select.h HAVE_SYS_SELECT_H)
xpcfgCheckIncludeFile(sys/stat.h HAVE_SYS_STAT_H)
xpcfgCheckIncludeFile(sys/sysctl.h HAVE_SYS_SYSCTL_H)
xpcfgCheckIncludeFile(sys/timeb.h HAVE_SYS_TIMEB_H)
xpcfgCheckIncludeFile(sys/time.h HAVE_SYS_TIME_H)
xpcfgCheckIncludeFile(sys/types.h HAVE_SYS_TYPES_H)
xpcfgCheckIncludeFile(sys/wait.h HAVE_SYS_WAIT_H)
xpcfgCheckIncludeFile(time.h HAVE_TIME_H)
xpcfgCheckIncludeFile(unistd.h HAVE_UNISTD_H)
xpcfgCheckIncludeFile(stdio.h HAVE_STDIO_H)
xpcfgCheckIncludeFile(sys/socket.h HAVE_SYS_SOCKET_H)
xpcfgCheckIncludeFile(netdb.h HAVE_NETDB_H)
##########
xpcfgCheckLibraryExists(pthread pthread_yield HAVE_LIBPTHREAD)
set(CMAKE_REQUIRED_LIBRARIES ${XP_SYSTEM_LIBS})
##########
xpcfgCheckSymFnExists(ftime HAVE_FTIME)
xpcfgCheckSymFnExists(gettimeofday HAVE_GETTIMEOFDAY)
xpcfgCheckSymFnExists(ioctl HAVE_IOCTL)
xpcfgCheckSymFnExists(pthread_attr_setguardsize HAVE_PTHREAD_ATTR_SETGUARDSIZE)
xpcfgCheckSymFnExists(pthread_key_delete HAVE_PTHREAD_KEY_DELETE)
xpcfgCheckSymFnExists(pthread_rwlock_init HAVE_PTHREAD_RWLOCK_INIT)
xpcfgCheckSymFnExists(pthread_timedjoin_np HAVE_PTHREAD_TIMEDJOIN_NP)
xpcfgCheckSymFnExists(pthread_tryjoin_np HAVE_PTHREAD_TRYJOIN_NP)
xpcfgCheckSymFnExists(pthread_yield HAVE_PTHREAD_YIELD)
xpcfgCheckSymFnExists(random HAVE_RANDOM)
xpcfgCheckSymFnExists(sched_yield HAVE_SCHED_YIELD) #TODO: configure doesn't find
xpcfgCheckSymFnExists(select HAVE_SELECT)
xpcfgCheckSymFnExists(srandom HAVE_SRANDOM)
xpcfgCheckSymFnExists(time HAVE_TIME)
xpcfgCheckSymFnExists(vprintf HAVE_VPRINTF)
if(NOT HAVE_VPRINTF)
  xpcfgCheckSymFnExists(_doprnt HAVE_DOPRNT)
  # jasper calls xpcfgCheck_doprnt(HAVE_DOPRNT)
  # TODO: determine which is more robust
else()
  set(HAVE_DOPRNT 0) # cmakedefine
endif()
##########
cmake_push_check_state(RESET)
set(CMAKE_EXTRA_INCLUDE_FILES ${XP_INCLUDE_LIST})
check_type_size(char SIZEOF_CHAR)
check_type_size(double SIZEOF_DOUBLE)
check_type_size(float SIZEOF_FLOAT)
check_type_size(int SIZEOF_INT)
check_type_size(long SIZEOF_LONG)
check_type_size("long long" SIZEOF_LONG_LONG)
check_type_size(short SIZEOF_SHORT)
check_type_size(wchar_t SIZEOF_WCHAR_T) # sets HAVE_SIZEOF_WCHAR_T
set(HAVE_WCHAR_T ${HAVE_SIZEOF_WCHAR_T})
check_type_size(size_t SIZEOF_SIZE_T) # sets HAVE_SIZEOF_SIZE_T
if(NOT HAVE_SIZEOF_SIZE_T)
  set(size_t "unsigned int") # Define to `unsigned int' if <sys/types.h> does not define.
else()
  set(size_t 0) # cmakedefine
endif()
set(CMAKE_EXTRA_INCLUDE_FILES)
cmake_pop_check_state()
########################################
set(HAVE_OPENSSL ${OPENSSL_FOUND})
set(AC_APPLE_UNIVERSAL_BUILD 0) # not used
xpcfgHaveAtomicBuiltins(HAVE_ATOMIC_BUILTINS)
xpcfgCheckPthreadFeatures(
  HAVE_PTHREAD_MUTEX_RECURSIVE
  HAVE_PTHREAD_MUTEX_ROBUST
  HAVE_PTHREAD_MUTEX_ROBUST_NP
  HAVE_PTHREAD_RWLOCKS
  )
xpcfgHaveStructAddrinfo(HAVE_STRUCT_ADDRINFO)
if(HAVE_STRUCT_ADDRINFO)
  set(DEFINE_HAVE_STRUCT_ADDRINFO cmakedefine)
endif()
# define if you have -fvisibility options
check_cxx_compiler_flag("-fvisibility=hidden -fvisibility-inlines-hidden" HAVE_VISIBILITY_OPTIONS)
if(HAVE_VISIBILITY_OPTIONS)
  set(DEFINE_HAVE_VISIBILITY_OPTIONS cmakedefine)
endif()
xpcfgLtObjdir(LT_OBJDIR)
####################
# determine version from configure.ac
file(STRINGS configure.ac MAJOR REGEX "^ACTIVEMQ_MAJOR_VERSION=([0-9]+)")
file(STRINGS configure.ac MINOR REGEX "^ACTIVEMQ_MINOR_VERSION=([0-9]+)")
file(STRINGS configure.ac PATCH REGEX "^ACTIVEMQ_PATCH_VERSION=([0-9]+)")
string(REGEX MATCH "([0-9]+)" MAJOR ${MAJOR})
string(REGEX MATCH "([0-9]+)" MINOR ${MINOR})
string(REGEX MATCH "([0-9]+)" PATCH ${PATCH})
set(ver ${MAJOR}.${MINOR}.${PATCH})
# Name of package
set(PACKAGE "\"${PROJECT_NAME}\"")
# Define to the address where bug reports for this package should be sent.
set(PACKAGE_BUGREPORT "\"dev@activemq.apache.org\"")
# Define to the full name of this package.
set(PACKAGE_NAME "\"${PROJECT_NAME}\"")
# Define to the full name and version of this package.
set(PACKAGE_STRING "\"${PROJECT_NAME} ${ver}\"")
# Define to the one symbol short name of this package.
set(PACKAGE_TARNAME "\"${PROJECT_NAME}\"")
# Define to the home page for this package.
set(PACKAGE_URL "\"http://activemq.apache.org/cms/\"")
# Define to the version of this package.
set(PACKAGE_VERSION "\"${ver}\"")
# Version number of package
set(VERSION "\"${ver}\"")
####################
xpcfgCheckPthreadAttrArgs(
  PTHREAD_ATTR_GETDETACHSTATE_TAKES_ONE_ARG
  PTHREAD_GETSPECIFIC_TAKES_TWO_ARGS
  )
xpcfgCheckSigwaitArgs(SIGWAIT_TAKES_ONE_ARG)
xpcfgStdcHeaders(STDC_HEADERS)
test_big_endian(WORDS_BIGENDIAN)
xpcfgConst(const)
xpcfgDotinFile("config.h.in" "config.h")
cmake_pop_check_state()
include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_definitions(-DHAVE_CONFIG_H)
