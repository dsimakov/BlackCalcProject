#include <time.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <sys/cdefs.h>
#include <sys/types.h>
#include <stdint.h>
time_t timegm(struct tm * tm)
{
    time_t ret = 0;
    char *tz;
    tz = getenv("TZ");
    setenv("TZ", "", 1);
    tzset();
    ret = mktime(tm);
    if (tz)
        setenv("TZ", tz, 1);
    else unsetenv("TZ");
    tzset();
    return ret;
}

size_t strnlen(const char* s, size_t maxlen)
{
    size_t len = 0;
    while (s[len] != '\0' && maxlen > 0)
    {
        if (s[++len] == '\0' || --maxlen == 0)
            return len;
        if (s[++len] == '\0' || --maxlen == 0)
            return len;
        if (s[++len] == '\0' || --maxlen == 0)
            return len; ++len; --maxlen;
    }
    return len;
}
int _readdir_r(DIR *dirp, struct dirent *entry, struct dirent **result)
{
    return readdir_r(dirp, entry, result);
}

int inotify_init(void)
{ return -1; }

int inotify_add_watch(int fd, const char * path, uint32_t mask)
{ return -1; }

int inotify_rm_watch(int fd, int32_t wd)
{ return -1; }
