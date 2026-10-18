#ifndef SK_H
#define SK_H
#include <stdio.h>
#include <pspsdk.h>
#include <string.h>
#include <pspiofilemgr.h>
#include <pspkernel.h>
#include <pspctrl.h>

static inline void setService(void) {
    return;
};

/*
    hint: Exactly like it does in SK-GCC Processor, if you need to setup a standard C file using SK-GCC,
    hint: acorn is way more advanced and contains more returning, but
    hint: It wll slow down a little bit the printf procedure.
    hint: Use acorn only if you need to do textual GUIs.
    hint: You can use acornst like this:
    hint:
    hint: #include <stdio.h>
    hint: #include "./sk-gcc/lib/sk.h"
    hint:
    hint: int main(void) {
    hint:     acornst("Aoo!", NULL);
    hint: };
    hint: 
    hint: Replace "NULL" with the name of the string you need to include with %s,
    hint: Or just leave it like that if acorn doesn't contain any %s string.
    hint:
    hint: Now you can use acornst for creating your GUI.
    hint: for PSP homebrew development, you need to use "acorn".
    hint: If you're trying to setup a standard C file, you need to use "acornst".
*/ 

static inline void acornst(const char *formatst, const char *contentst)
{
    printf(formatst, contentst);
};

static inline void acorn(const char *format, const char *content)
{
    pspDebugScreenPrintf(format, content);
};

static inline void acornCls(void)
{
    pspDebugScreenClear();
};

static inline void SPLset(const char *ostache, const char *sssssssss, const char *ppppppppp, const char *lllllllll)
{
    acorn("Launched %s.\n", ostache);
    acorn("S | : | %s\n", sssssssss);
    acorn("P | : | %s\n", ppppppppp);
    acorn("L | : | %s\n", lllllllll);
    const char *splS = sssssssss;
    const char *splP = ppppppppp;
    const char *splL = lllllllll;
    acorn("All set.", NULL);
};

// A small file helper.
/*
              hint: thing:  Target.
              hint: thing2: Partition.
              hint: s0:     Filename (argument must ALWAYS end with "."!).
              hint: s1:     Extension.
              hint: thing3: Permissions.
              hint: thing4: Permission Numbers.
              hint: thing5: content for content variable.
*/
static inline void fcopen(const char *thing, const char *thing2, const char *s0, const char *s1, int *thing3, int *thing4, const char *thing5)
{
              char fullpath[256];
              snprintf(fullpath, sizeof(fullpath), "%s%s%s", thing2, s0, s1);

              int thingh = sceIoOpen(fullpath, thing3, thing4);
              if (thingh < 0)
              {
                            return;
              }
              else
              {
                            const char *content = thing5;
                            sceIoWrite(thingh, thing5, strlen(thing5));
                            sceIoClose(thingh);
              };
};
#endif