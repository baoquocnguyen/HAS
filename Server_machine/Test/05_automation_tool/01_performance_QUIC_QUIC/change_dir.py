import os
import subprocess # just to call an arbitrary command e.g. 'ls'

class cd:
    """Context manager for changing the current working directory"""
    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)


# enter the directory like this:
with cd("/home/quoc"):
   # we are in ~/Library
   subprocess.call("ls")

# outside the context manager we are back wherever we started.
