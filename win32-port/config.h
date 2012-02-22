#ifndef CONFIG_H
#define CONFIG_H

#include <io.h>
#include <time.h>

#define HAVE_DECL_FILENO 1
#define HAVE_DECL_STRDUP 1
#define HAVE_DECL_PUTENV 1
#define snprintf _snprintf
#define fileno _fileno
#define write _write

typedef unsigned long uint32_t;
typedef signed long long ssize_t;
typedef struct timeval {
  time_t tv_sec;
  time_t tv_usec;
} timeval;
struct timezone 
{
  int  tz_minuteswest; /* minutes W of Greenwich */
  int  tz_dsttime;     /* type of dst correction */
};
int gettimeofday(struct timeval *tv, struct timezone *tz);

#endif
