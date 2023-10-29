# Anavim Guide
The best neovim configuration in the world, mostly used in the legendary mador - **Element**.
Here is a nice cheatsheet of all the special shortcuts you'll need to know when using it.

**Warning**: this guide is more users which are already comfortable with their Vim skills, if not - you are welcome to do the regular Vim builtin guide.

**Warning2**: install me in ~/.config/nvim (**git clone git@gitlab.org:neovim/anavim.git ~/.config/nvim**)

### General Actions
| Action | Shortcut | Description |
| --- | --- | --- |
| Find File | Ctrl + p | Find a file with the given string name.
| Find Recent File | Ctrl + Shift + p | Same as before, just sorted with recent usage. |
| Find String | Ctrl + f | Find files which contain the following string. |
| Open File Explorer | Ctrl + n | Open the file tree explorer (without entering it), and points directly to the currently open file. **Important**: the file explorer is considered as another window in the tab. |
| Go to File Explorer | Space + n | Same as before, only now we go into the explorer window. |

### Files + Tabs + Move Actions
| Action | Shortcut | Description |
| --- | --- | --- |
| Open | Enter | Opens the files the same tab, overriding the current file open. |
| Open (New Tab) | Ctrl + t | Opens the files in a new tab. |
| Open Vertically (Same Tab) | Ctrl + v | Opens the file in the current tab, splitting the view vertically. |
| Open Horizontally (Same Tab) | Ctrl + x | Opens the file in the current tab, splitting the view horizontally. |
| Move Right (Tab) | Shift + l | Moves right from the current tab. |
| Move Left (Tab) | Shift + h | Moves left from the current tab.|
| Move Right (Window) | Alt + l |   |
| Move Left (Window) | Alt + h |   |
| Move Up (Window) | Alt + k |   |
| Move Down (Window) | Alt + j |   |
| Fast Scroll Up | Shift + k | Jumps up a couple of lines.|
| Fast Scroll Down | Shift + j | Jumps down a couple of lines.|
| Jump Forward | Ctrl + k | Go to the next jump that was done (**Read about jumping - Vim**) |
| Jump Back | Ctrl + j | Goes back to the jump that was done (**Read about jumping - Vim**) |

### File Explorer Actions
| Action | Shortcut | Description |
| --- | --- | --- |
| Create File | a | End with "/" for creating a directory |
| Delete File | d |    |
| Rename File | r |    |
| Cut File | x |    |
| Copy File | y |    |
| Paste File | p |    |
| Close Explorer | q |  |

### Preview
![](logo/anavim.gif)
