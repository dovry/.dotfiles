Create a cool colorscheme and/or bash prompt and commit as a single file.

Where to create them:

[Option 1](http://bashrcgenerator.com/)

[Option 2](https://omar.io/ps1gen/)

[Option 3](http://ezprompt.net/)

[Option 4](https://www.kirsle.net/wizards/ps1.html)

**How to apply the config to your bash console:**

* add the generated PS1 text to your ~/.bashrc (usually on the bottom) as so

* `nano ~/.bashrc` or `vim ~/.bashrc` 

* go to the bottom of the file and paste the PS1 text

`export PS1="\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;11m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;92m\]\v\[$(tput sgr0)\]\[\033[38;5;186m\]:\[$(tput sgr0)\]"` 

* save and exit the file

* source the file

`source ~/.bashrc`

and your bash prompt has changed to your cool and awesome colorscheme!

**naming scheme**

use `yourUsername-ps1` 

commit the file!
