#include <CoreFoundation/CoreFoundation.h>
#include <stdio.h>

#ifndef MOBILEINSTALLATION_H_
#define MOBILEINSTALLATION_H_
typedef void (*MobileInstallationCallback)(CFDictionaryRef information);
extern int MobileInstallationUninstall(CFStringRef bundleIdentifier, CFDictionaryRef parameters, MobileInstallationCallback callback, void *unknown);
#endif

int main(int argc, char **argv, char **envp)
{
    int ret;

    if (argc < 2) {
        fprintf(stderr, "Usage: %s com.application.identifier \n", argv[0]);
        return -1;
    }

    CFStringRef identifier = CFStringCreateWithCString(kCFAllocatorDefault, argv[1], kCFStringEncodingUTF8);
    assert(identifier != NULL);

    ret = MobileInstallationUninstall(identifier, NULL, NULL, NULL);

    if (ret != 0) {
        fprintf(stderr, "Couldn't uninstall application: %s. Reason: %i, ", argv[1], ret);
    }

    CFRelease(identifier);

    return ret;
}
