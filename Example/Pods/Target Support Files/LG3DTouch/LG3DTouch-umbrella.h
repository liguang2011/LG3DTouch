#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "LG3DTouchManager.h"
#import "LG3DTouchProxyTarget.h"
#import "LGShortcutItem.h"

FOUNDATION_EXPORT double LG3DTouchVersionNumber;
FOUNDATION_EXPORT const unsigned char LG3DTouchVersionString[];

