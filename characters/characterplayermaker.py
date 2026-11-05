import os
import shutil
from pathlib import Path


def clonePlayer():
    directory = Path('./characters/')
    for file_path in directory.iterdir():
        if file_path.is_file():
            if file_path.name.endswith(".json") and not "-player" in file_path.name:
                cloneFilepath = Path("./characters/" + file_path.name.split(".")[0] + "-player.json")
                if cloneFilepath.is_file():
                    print("./characters/" + file_path.name.split(".")[0] + "-player.json exists.")
                    #print("Hey")
                else:
                    shutil.copy("./characters/" + file_path.name, "./characters/" + file_path.name.split(".")[0] + "-player.json")
                    #print("No")
                
                #return False

clonePlayer()