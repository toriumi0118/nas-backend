import logging
import os
import time

# setting
## logging
logging.basicConfig(level=logging.INFO)
log = logging.getLogger("livereload module")
## targets
TARGET_DIRS = ["app", "src", "test"]
TARGET_EXTS = ["hs", "cabal", "yaml"]
## cache
TIMESTAMPS = {}

def timestamp_walk(dir):
    changed = False
    for root, dirs, files in os.walk("./" + dir):
        for f in files:
            path = root + os.sep + f
            current = os.stat(path).st_mtime
            path_changed = current != TIMESTAMPS.get(path, 0)
            if path_changed:
                log.info("'%s' is changed.", path)
            changed = changed or path_changed
            TIMESTAMPS[path] = current
    return changed

def timestamp_walks():
    changed = False
    for d in TARGET_DIRS:
        changed = timestamp_walk(d) or changed
    return changed

def start_watch():
    while True:
        changed = timestamp_walks()
        if changed:
            log.info("start reload")
            reload()
        time.sleep(1)

def reload():
    from subprocess import Popen, PIPE
    argv = ["stack", "build"]
    p = Popen(argv, stdin=PIPE, stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    log.info("return code %d", p.returncode)
    if not p.returncode == 0:
        if stderr: log.error(stderr)
        return
    log.info("build succeed")
    log.info("stack exec")
    argv = ["stack", "exec", "nas-server-exe"]
    p = Popen(argv, stdin=PIPE, stdout=PIPE, stderr=PIPE)
    stdout, stderr = p.communicate()
    log.info("[OUTPUT] %s", stdout)
    if stderr: 
        log.error("[OUTPUT ERROR] %s", stderr)

if __name__ == "__main__":
    log.info("start live reload.")
    try:
        timestamp_walks()
        start_watch()
    except KeyboardInterrupt:
        log.info("stop live reload.")
