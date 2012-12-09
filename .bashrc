echo -e "\e[01;31mV\xE4lkommen till HTS_OS-013!\e[00m \nEn variant av Puppy/Carollina Linux. Har du n\xE5gra f\xF6rb\xE4ttringsf\xF6rslag skicka g\xE4rna ett mail, bifoga g\xE4rna f\xF6rb\xE4ttringar som du sj\xE4lv har gjort.\n\e[01;36mLycka Till!\e[00m";

function exitstatus {

    EXITSTATUS="$?"
    BOLD="\[\033[1m\]"
    RED="\[\033[1;31m\]"
    GREEN="\[\e[32;1m\]"
    BLUE="\[\e[34;1m\]"
    OFF="\[\033[m\]"

    PROMPT="\t ${BLUE}\W${OFF}"

    if [ "${EXITSTATUS}" -eq 0 ]
    then
       PS1="${PROMPT} ${BOLD}${GREEN}:)${OFF}"
    else
       PS1="${PROMPT} ${BOLD}${RED}:(${OFF} "
    fi

    PS2="${BOLD}>${OFF} "
}

PROMPT_COMMAND=exitstatus;

#Alias

alias .='pwd';
alias ..='cd ..';
alias ...='cd ../..';
alias ....='cd ../../..';

alias ll='ls -lha';
alias gc='git commit -a -m';
alias gp='git pull';
alias gg='git push';

function alias_g() {
	geany $1 &
}
alias g="alias_g"

function alias_gh() {
	ghdl $1 --workdir=/root/ExercisesInVHDL/work/ $2
}
alias gh="alias_gh";
alias ga="alias_gh -a";
alias ge="alias_gh -e";

function alias_gr() {
	 ./$1 --vcd=$1.vcd
}
alias gr="alias_gr";