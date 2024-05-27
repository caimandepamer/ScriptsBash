# ScriptsBash
Bash Scripts to make work easier

### To install "monokai" color scheme:
```/bin/bash
mkdir ~/.vim/colors/
wget -O ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim
```
### To configure ident lines fot tabs:
*add this lines on .vimrc:*
```/bin/bash
set list
set listchars=multispace:\ \ ┊
```

The result like: 
```/bin/bash
 1 #!/bin/bash
 2 SRV=$1;
 3   ┊  ┊while read LINEA; do
 4   ┊  ┊USU=$(echo $LINEA | cut -d'
 5   ┊  ┊PASS=$(echo $LINEA | cut -d
 6   ┊  ┊echo "toxsocks sshpass -p $
 7   ┊  ┊RES=$(toxsocks sshpass  -p 
 8   ┊  ┊  if [ "$?" -eq "0" ]; then
 9   ┊  ┊  ┊ echo "si se tiene acces
10   ┊  ┊  ┊ break;
11   ┊  ┊  fi
12   ┊ done < ./lista_usuarios_pass.
13   ┊ echo "Se ejecuta ssh: $USU  $
14   ┊ echo "$PASS" > /tmp/clave
15   ┊ toxsocks sshpass  ┊-p "$PASS"
```

---

### Px2Py.sh usage:
`./Px2Py.sh -p6 [num_cpus] | -p7 [num_cpus] | -p8 [num_cpus]`

#### Example: 
```bash
./Px2Py.sh -p8 4
   4 cores of Power 8 are:  65.72 rperfs
```

#### Personalize BASH

**Print a separator between commands (after the 'Enter')**

*Add this on your .bashrc*

```bash
function printNewLine() 
{
  COLOR='\033[2;38m' #GREY
  COLS=$(tput cols)
  CHAR='='
  echo -e "${COLOR}";
  printf '%*s\n' $(tput cols) | tr ' ' "$CHAR";
  echo -e "${NC}"
}
trap 'printNewLine' DEBUG
```


## Ask to Ollama

*Script to ask installation of ollama using curl and jq*

### Download the script: 

`curl -o curl2ollama.sh https://raw.githubusercontent.com/caimandepamer/ScriptsBash/main/curl2ollama.sh && chmod +x curl2ollama.sh`

*Optional: to install as command:*

```sh
curl -o curl2ollama.sh https://raw.githubusercontent.com/caimandepamer/ScriptsBash/main/curl2ollama.sh
sudo mv curl2ollama.sh /usr/bin/curl2ollama
sudo chmod +x /usr/bin/curl2ollama
```

### Use the script:

```sh
export OLLAMAHOST=ip or hostname of your ollama installation
./curl2ollama.sh "in one line, how to update debian"
```

*or if installed as command:*

```sh
export OLLAMAHOST=ip or hostname of your ollama installation
curl2ollama "in one line, generate md5sum of file in bash "
```



