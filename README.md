# An Example of a Control Panel Applet in Delphi

An example on how to create control panel applets for Windows 16-bit/32-bit in Delphi. Originally cloned from @laciba96 but their account seems to be deleted in the meantime. 

The LICENSE is [GPLv3](https://github.com/bocke/cpanel-delphi/blob/main/LICENSE).

## The original README.md

Some examples for creating CPL files in Delphi as a DLL for old systems like Windows 3.1 or Windows NT 3.5x.

The Win16 version needs Delphi 1.x, the Win32 one works with Delphi 4.x and up.

If you want to compile this project, you have to compile the `RC` files, with the `brcc Icon.rc` or `brcc32 Icon.rc` commands. These commands needs that the Delphi's `\Bin` folder should be in `PATH`. After then you can use the IDE to compile the project.

The 16-bit project compiles a `.DLL` file, so you have to rename it manually to `.CPL`. The Win32 version compiles into `.CPL` automatically.
