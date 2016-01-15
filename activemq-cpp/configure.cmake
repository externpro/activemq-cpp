include(CheckCXXCompilerFlag)
include(CheckCSourceCompiles)
include(CheckFunctionExists)
include(CheckIncludeFile)
include(CheckLibraryExists)
include(CheckSymbolExists)
include(CheckTypeSize)
include(TestBigEndian)
########################################
function(set_define var)
  if(${ARGC} GREATER 1 AND ${var})
    set(DEFINE_${var} cmakedefine01 PARENT_SCOPE)
  else()
    set(DEFINE_${var} cmakedefine PARENT_SCOPE)
  endif()
  if(${var})
    set(AMQ_TEST_DEFINES "${AMQ_TEST_DEFINES} -D${var}" PARENT_SCOPE)
    set(CMAKE_REQUIRED_DEFINITIONS ${AMQ_TEST_DEFINES} PARENT_SCOPE)
  endif(${var})
endfunction()
##########
macro(check_include_file_concat incfile var)
  check_include_file("${incfile}" ${var})
  set_define(${var} 1)
  if(${var})
    set(AMQ_INCLUDES ${AMQ_INCLUDES} ${incfile})
  endif(${var})
endmacro()
##########
macro(check_exists_define01 func var)
  if(UNIX)
    check_function_exists("${func}" ${var})
  else()
    check_symbol_exists("${func}" "${AMQ_INCLUDES}" ${var})
  endif()
  set_define(${var} 1)
endmacro()
##########
macro(check_library_exists_concat lib symbol var)
  check_library_exists("${lib};${AMQ_SYSTEM_LIBS}" ${symbol} "${CMAKE_LIBRARY_PATH}" ${var})
  set_define(${var} 1)
  if(${var})
    set(AMQ_SYSTEM_LIBS ${lib} ${AMQ_SYSTEM_LIBS})
    set(CMAKE_REQUIRED_LIBRARIES ${AMQ_SYSTEM_LIBS})
  endif(${var})
endmacro()
########################################
check_include_file_concat(windows.h HAVE_WINDOWS_H)
if(HAVE_WINDOWS_H)
  set(WIN32_LEAN_AND_MEAN TRUE) # Define to avoid automatic inclusion of winsock.h
endif()
set_define(WIN32_LEAN_AND_MEAN)
check_include_file_concat(dlfcn.h HAVE_DLFCN_H)
check_include_file_concat(errno.h HAVE_ERRNO_H)
check_include_file_concat(inttypes.h HAVE_INTTYPES_H)
check_include_file_concat(limits.h HAVE_LIMITS_H)
check_include_file_concat(memory.h HAVE_MEMORY_H)
check_include_file_concat(objbase.h HAVE_OBJBASE_H)
check_include_file_concat(pthread.h HAVE_PTHREAD_H)
check_include_file_concat(repcdce.h HAVE_REPCDCE_H)
check_include_file_concat(sched.h HAVE_SCHED_H)
check_include_file_concat(semaphore.h HAVE_SEMAPHORE_H)
check_include_file_concat(signal.h HAVE_SIGNAL_H)
check_include_file_concat(stdint.h HAVE_STDINT_H)
check_include_file_concat(stdlib.h HAVE_STDLIB_H)
check_include_file_concat(strings.h HAVE_STRINGS_H)
check_include_file_concat(string.h HAVE_STRING_H)
check_include_file_concat(sys/filio.h HAVE_SYS_FILIO_H)
check_include_file_concat(sys/ioctl.h HAVE_SYS_IOCTL_H)
check_include_file_concat(sys/resource.h HAVE_SYS_RESOURCE_H)
check_include_file_concat(sys/select.h HAVE_SYS_SELECT_H)
check_include_file_concat(sys/stat.h HAVE_SYS_STAT_H)
check_include_file_concat(sys/sysctl.h HAVE_SYS_SYSCTL_H)
check_include_file_concat(sys/timeb.h HAVE_SYS_TIMEB_H)
check_include_file_concat(sys/time.h HAVE_SYS_TIME_H)
check_include_file_concat(sys/types.h HAVE_SYS_TYPES_H)
check_include_file_concat(sys/wait.h HAVE_SYS_WAIT_H)
check_include_file_concat(time.h HAVE_TIME_H)
check_include_file_concat(unistd.h HAVE_UNISTD_H)
check_include_file_concat(stdio.h HAVE_STDIO_H)
check_include_file_concat(sys/socket.h HAVE_SYS_SOCKET_H)
check_include_file_concat(netdb.h HAVE_NETDB_H)
##########
check_library_exists_concat(pthread pthread_yield HAVE_LIBPTHREAD)
##########
check_exists_define01(ftime HAVE_FTIME)
check_exists_define01(gettimeofday HAVE_GETTIMEOFDAY)
check_exists_define01(ioctl HAVE_IOCTL)
check_exists_define01(pthread_attr_setguardsize HAVE_PTHREAD_ATTR_SETGUARDSIZE)
check_exists_define01(pthread_key_delete HAVE_PTHREAD_KEY_DELETE)
check_exists_define01(pthread_rwlock_init HAVE_PTHREAD_RWLOCK_INIT)
check_exists_define01(pthread_timedjoin_np HAVE_PTHREAD_TIMEDJOIN_NP)
check_exists_define01(pthread_tryjoin_np HAVE_PTHREAD_TRYJOIN_NP)
check_exists_define01(pthread_yield HAVE_PTHREAD_YIELD)
check_exists_define01(random HAVE_RANDOM)
check_exists_define01(sched_yield HAVE_SCHED_YIELD) #TODO: configure doesn't find
check_exists_define01(select HAVE_SELECT)
check_exists_define01(srandom HAVE_SRANDOM)
check_exists_define01(time HAVE_TIME)
check_exists_define01(vprintf HAVE_VPRINTF)
if(NOT HAVE_VPRINTF)
  check_exists_define01(_doprnt HAVE_DOPRNT)
else()
  set_define(HAVE_DOPRNT 1)
endif()
##########
set(CMAKE_EXTRA_INCLUDE_FILES ${AMQ_INCLUDES})
check_type_size(char SIZEOF_CHAR)
check_type_size(double SIZEOF_DOUBLE)
check_type_size(float SIZEOF_FLOAT)
check_type_size(int SIZEOF_INT)
check_type_size(long SIZEOF_LONG)
check_type_size("long long" SIZEOF_LONG_LONG)
check_type_size(short SIZEOF_SHORT)
check_type_size(wchar_t SIZEOF_WCHAR_T) # sets HAVE_SIZEOF_WCHAR_T
set(HAVE_WCHAR_T ${HAVE_SIZEOF_WCHAR_T})
set_define(HAVE_WCHAR_T 1)
check_type_size(size_t SIZEOF_SIZE_T) # sets HAVE_SIZEOF_SIZE_T
if(NOT HAVE_SIZEOF_SIZE_T)
  set(size_t "unsigned int") # Define to `unsigned int' if <sys/types.h> does not define.
endif()
set(CMAKE_EXTRA_INCLUDE_FILES)
########################################
set(HAVE_OPENSSL FALSE) #TODO: determine
set_define(HAVE_OPENSSL 1)
########################################
# Define if building universal (internal helper macro)
set(AC_APPLE_UNIVERSAL_BUILD) #TODO: determine on Apple
set_define(AC_APPLE_UNIVERSAL_BUILD)
####################
# Define if compiler provides atomic builtins
check_c_source_compiles("
int main()
{
  unsigned long val = 1010, tmp, *mem = &val;
  if (__sync_fetch_and_add(&val, 1010) != 1010 || val != 2020)
    return 1;
  tmp = val;
  if (__sync_fetch_and_sub(mem, 1010) != tmp || val != 1010)
    return 1;
  if (__sync_sub_and_fetch(&val, 1010) != 0 || val != 0)
    return 1;
  tmp = 3030;
  if (__sync_val_compare_and_swap(mem, 0, tmp) != 0 || val != tmp)
    return 1;
  if (__sync_lock_test_and_set(&val, 4040) != 3030)
    return 1;
  mem = &tmp;
  if (__sync_val_compare_and_swap(&mem, &tmp, &val) != &tmp)
    return 1;
  __sync_synchronize();
  if (mem != &val)
    return 1;
  return 0;
}
" HAVE_ATOMIC_BUILTINS
  )
set_define(HAVE_ATOMIC_BUILTINS 1)
####################
# Define if recursive pthread mutexes are available
check_c_source_compiles("
#include <sys/types.h>
#include <pthread.h>
#include <stdlib.h>
int main()
{
  pthread_mutexattr_t attr;
  pthread_mutex_t m;
  exit ( pthread_mutexattr_init(&attr) ||
         pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE) ||
         pthread_mutex_init(&m, &attr) );
}
" HAVE_PTHREAD_MUTEX_RECURSIVE
  )
set_define(HAVE_PTHREAD_MUTEX_RECURSIVE 1)
####################
# Define if pthread rwlocks are available
check_c_source_compiles("
#include <sys/types.h>
#include <pthread.h>
int main()
{
  pthread_rwlock_t *rwlock;
  ;
  return 0;
}
" HAVE_PTHREAD_RWLOCKS
  )
set_define(HAVE_PTHREAD_RWLOCKS 1)
####################
# define if you have struct addrinfo
check_c_source_compiles("
#ifdef HAVE_STDIO_H
# include <stdio.h>
#endif
#ifdef HAVE_UNISTD_H
# include <unistd.h>
#endif
#ifdef HAVE_SYS_TYPES_H
# include <sys/types.h>
#endif
#ifdef HAVE_SYS_SOCKET_H
# include <sys/socket.h>
#endif
#ifdef HAVE_NETDB_H
# include <netdb.h>
#endif
int main()
{
  do {
    struct addrinfo a;
    (void) a.ai_flags;
  } while(0)
  ;
  return 0;
}
" HAVE_STRUCT_ADDRINFO
  )
set_define(HAVE_STRUCT_ADDRINFO)
####################
# define if you have -fvisibility options
check_cxx_compiler_flag("-fvisibility=hidden -fvisibility-inlines-hidden" HAVE_VISIBILITY_OPTIONS)
set_define(HAVE_VISIBILITY_OPTIONS)
####################
# Define to the sub-directory in which libtool stores uninstalled libraries.
execute_process(COMMAND libtool --version
  OUTPUT_QUIET ERROR_QUIET RESULT_VARIABLE hasLibtool
  )
if(hasLibtool EQUAL 0) # 0 == success
  set(LT_OBJDIR .libs/)
endif()
####################
# Name of package
set(PACKAGE ${PROJECT_NAME})
# Version number of package
file(STRINGS configure.ac MAJOR REGEX "^ACTIVEMQ_MAJOR_VERSION=([0-9]+)")
file(STRINGS configure.ac MINOR REGEX "^ACTIVEMQ_MINOR_VERSION=([0-9]+)")
file(STRINGS configure.ac PATCH REGEX "^ACTIVEMQ_PATCH_VERSION=([0-9]+)")
string(REGEX MATCH "([0-9]+)" MAJOR ${MAJOR})
string(REGEX MATCH "([0-9]+)" MINOR ${MINOR})
string(REGEX MATCH "([0-9]+)" PATCH ${PATCH})
set(VERSION ${MAJOR}.${MINOR}.${PATCH})
# Define to the address where bug reports for this package should be sent.
set(PACKAGE_BUGREPORT "dev@activemq.apache.org")
# Define to the full name of this package.
set(PACKAGE_NAME ${PACKAGE})
# Define to the full name and version of this package.
set(PACKAGE_STRING "${PACKAGE} ${VERSION}")
# Define to the one symbol short name of this package.
set(PACKAGE_TARNAME ${PACKAGE})
# Define to the home page for this package.
set(PACKAGE_URL http://activemq.apache.org/cms/)
# Define to the version of this package.
set(PACKAGE_VERSION ${VERSION})
####################
# Define if pthread_attr_getdetachstate() has one arg
check_c_source_compiles("
#include <pthread.h>
int main()
{
  pthread_attr_t *attr;
  pthread_attr_getdetachstate(attr);
  ;
  return 0;
}
" PTHREAD_ATTR_GETDETACHSTATE_TAKES_ONE_ARG
  )
set_define(PTHREAD_ATTR_GETDETACHSTATE_TAKES_ONE_ARG 1)
####################
# Define if pthread_getspecific() has two args
check_c_source_compiles("
#include <pthread.h>
int main()
{
  pthread_key_t key;
  void *tmp;
  pthread_getspecific(key,&tmp);
  ;
  return 0;
}
" PTHREAD_GETSPECIFIC_TAKES_TWO_ARGS
  )
set_define(PTHREAD_GETSPECIFIC_TAKES_TWO_ARGS 1)
####################
# Define if sigwait takes one arg
check_c_source_compiles("
#if defined(__NETBSD__) || defined(DARWIN)
  /* When using the unproven-pthreads package, we need to pull in this
   * header to get a prototype for sigwait().  Else things will fail later
   * on.  XXX Should probably be fixed in the unproven-pthreads package.
   * Darwin is declaring sigwait() in the wrong place as well.
   */
   #include <pthread.h>
#endif
#include <signal.h>
int main()
{
  sigset_t set;
  sigwait(&set);
  ;
  return 0;
}
" SIGWAIT_TAKES_ONE_ARG
  )
set_define(SIGWAIT_TAKES_ONE_ARG 1)
####################
# Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
# significant byte first (like Motorola and SPARC, unlike Intel).
test_big_endian(WORDS_BIGENDIAN)
set_define(WORDS_BIGENDIAN 1)
########################################
# Define to 1 if you have the ANSI C header files.
check_c_source_compiles("
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <float.h>
int main()
{
  ;
  return 0;
}
" STDC_HEADERS
  )
set_define(STDC_HEADERS 1)
########################################
# Define to empty if `const' does not conform to ANSI C.
check_c_source_compiles("
int main()
{
#ifndef __cplusplus
  /* Ultrix mips cc rejects this sort of thing.  */
  typedef int charset[2];
  const charset cs = { 0, 0 };
  /* SunOS 4.1.1 cc rejects this.  */
  char const *const *pcpcc;
  char **ppc;
  /* NEC SVR4.0.2 mips cc rejects this.  */
  struct point {int x, y;};
  static struct point const zero = {0,0};
  /* AIX XL C 1.02.0.0 rejects this.
     It does not let you subtract one const X* pointer from another in
     an arm of an if-expression whose if-part is not a constant
     expression */
  const char *g = \"string\";
  pcpcc = &g + (g ? g-g : 0);
  /* HPUX 7.0 cc rejects these. */
  ++pcpcc;
  ppc = (char**) pcpcc;
  pcpcc = (char const *const *) ppc;
  { /* SCO 3.2v4 cc rejects this sort of thing.  */
    char tx;
    char *t = &tx;
    char const *s = 0 ? (char *) 0 : (char const *) 0;

    *t++ = 0;
    if (s) return 0;
  }
  { /* Someone thinks the Sun supposedly-ANSI compiler will reject this.  */
    int x[] = {25, 17};
    const int *foo = &x[0];
    ++foo;
  }
  { /* Sun SC1.0 ANSI compiler rejects this -- but not the above. */
    typedef const int *iptr;
    iptr p = 0;
    ++p;
  }
  { /* AIX XL C 1.02.0.0 rejects this sort of thing, saying
       \"k.c\", line 2.27: 1506-025 (S) Operand must be a modifiable lvalue. */
    struct s { int j; const int *ap[3]; } bx;
    struct s *b = &bx; b->j = 5;
  }
  { /* ULTRIX-32 V3.1 (Rev 9) vcc rejects this */
    const int foo = 10;
    if (!foo) return 0;
  }
  return !cs[0] && !zero.x;
#endif
  ;
  return 0;
}
" ANSI_CONST
  )
if(NOT ANSI_CONST)
  set(const empty)
endif()
set_define(const)
########################################
configure_file(${CMAKE_SOURCE_DIR}/config.h.cmake.in .)
configure_file(${CMAKE_BINARY_DIR}/config.h.cmake.in ${CMAKE_BINARY_DIR}/config.h)
include_directories(${CMAKE_BINARY_DIR})
add_definitions(-DHAVE_CONFIG_H)
################################################################################
set(CMAKE_REQUIRED_LIBRARIES)
set(CMAKE_REQUIRED_DEFINITIONS)
