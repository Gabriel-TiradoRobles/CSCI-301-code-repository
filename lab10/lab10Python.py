#!/usr/bin/env python3

import shutil

path = "/."

stats = shutil.disk_usage(path)
freeSpace = stats.free
usedSpace = stats.used
percentFree = round((stats.free / stats.total) * 100, 2)

print("C Drive space remaining: " + str(percentFree) + "%")