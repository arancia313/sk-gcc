# SK-GCC

- `~` = Linux/Unix/WSL Home Directory
- `/` = Linux/Unix/WSL distro system root 

SK-GCC is an important and mandatory component (and submodule) of the Arancia 3 Network, but **not only**.
It's a toolchain that lets you take a .sb3 file and make a copy of it to a .psk (Portable Software Key) format.

## Setup
By setting up this toolchain, you need to either have WSL (Windows Subsystem for Linux) or a **native Linux OS.**
There are many different distros out there.
You can install WSL by executing this command on your terminal:
```cmd
wsl --install
```
It needs to be executed on Powershell and **requires a restart** to make effects.
You can install a different distro, for example Ubuntu, by executing:
```cmd
wsl --install -d Ubuntu
```
**No need to execute those** if you are on a native Linux Environment and NOT on Windows.
Setup SK-GCC by executing those commands and pointing over to the SK-GCC official repo.
Make sure to be on your user root and **NOT** on system root (system root is `/`, user directory is `~`).
```bash
mkdir -p A3
cd A3
sudo apt install git
sudo apt install make
git clone --recurse-submodules https://github.com/arancia313/sk-gcc
ls
nano ~/.bashrc
```
Add those lines to the end of your .bashrc:
```cmd
export SKGCC=$HOME/A3/sk-gcc
export PATH=$PATH:$SKGCC/bin
```
These lines will help with the **Makefile** we are about to write on your document.
Now, press Ctrl + O to save, Ctrl + X to exit, and run:
```cmd
source ~/.bashrc
sk-gcc-ping
```
to make sure SK-GCC is correctly installed on your home directory.
It will print something like:
```text
sk-gcc: Just responded.
```

## Building

Now we can use an IDE like Visual Studio Code to connect it to your WSL distribution and ultimately
**create our folder and insert our files inside it.**
Use your File Explorer to get on your ~ and create a New Folder. Use something like TurboWarp Desktop
to generate the `.sb3` file and creating a `Makefile` inside the VS Code editor.
The filename can be `makefile` or `Makefile`, but `Makefile` is recommended.
Let's add some very simple lines to the Makefile:
```makefile
# the SK parameter is recommended to be on the top.
# hint: replace thing on SKTARGET with the name of the file you want to use.
SK = $(SKGCC)
SKTARGET = thing
A3PACK = filth
include $(SK)/lib/build.mak
```
Now just go to the terminal and launch `make`. You will see a .psk file on the filelist you see on the IDE.
To clean it all, launch `make ripe`, not `make clean` like PSPSDK.
