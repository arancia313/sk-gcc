#pragma once
#ifndef SKST_H
#define SKST_H

#include <stdio.h>
#include <string.h>

static inline void acornst(const char *formatst, const char *contentst)
{
    printf(formatst, contentst);
};

#endif