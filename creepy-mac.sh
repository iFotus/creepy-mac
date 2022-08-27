#!/bin/bash


color='\e[1;77m'
border='\e[106m'
cyan='\e[1;36m'
stop='\e[0m'



printf "${cyan}"
printf "\n \n"
figlet "        Creepy-Mac"
printf "${stop}"
printf "\n" 



printf "     \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not     ::\e[0m\n"
printf "     \e[101m\e[1;77m:: responsible for any misuse or damage caused by Creepy-Mac. ::\e[0m\n"
printf "     \e[101m\e[1;77m:: Only use for educational purporses!!                       ::\e[0m\n"
printf "\n"
printf "     \e[107m\e[1;36m::                  Creepy-Mac! By @iFotus                    ::\e[0m\n"
printf "\n"


printf "\e[1;36m[\e[0m\e[1;77m*\e[0m\e[1;36m]\e[0m\e[1;36m What's do you want:\e[0m\n\n"

printf "         \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;77m Get random mac address\e[0m\n\n"
printf "         \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;77m Choose the professional formula\e[0m\n"


read  -p $'\n\e[1;36m\e[0m\e[1;77m\e[0m\e[1;36m ┌─[ Choose an option:]─[~]
 └──╼ ~ ' c


if [[ $c == 1 ]]
   then 
    printf "\e[1;36m[\e[0m\e[1;77m*\e[0m\e[1;36m]\e[0m\e[1;77m Please select your interface: \e[0m\n\n"


    printf "         \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;77m eth0\e[0m\n"
    printf "         \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;77m wlan0\e[0m\n" 
    printf "         \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;77m wlan1\e[0m\n" 

       read  -p $'\n\e[1;36m\e[0m\e[1;77m\e[0m\e[1;36m ┌─[ Choose an option:]─[~]
 └──╼ ~ ' interface

    if [[ $interface == "1" ]] 
    then
    random=$(sudo python creepy_mac.py eth0 -r)
    printf "\n${cyan}$random"
    elif [[ $interface == "2" ]] 
    then
    random2=$(sudo python creepy_mac.py wlan0 -r)
    printf "\n${cyan}$random2"
    elif [[ $interface == "3" ]] 
    then
    random3=$(sudo python creepy_mac.py wlan1 -r)
    printf "\n${cyan}$random3"
    fi
fi

if [[ $c == 2 ]]
   then
        printf "\e[1;36m[\e[0m\e[1;77m*\e[0m\e[1;36m]\e[0m\e[1;77m Please enter your choice: \e[0m\n"
        printf "\e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;77m Currently available format:  \e[0m\n\n"
        printf "\e[1;31m[\e[0m\e[1;77m->\e[0m\e[1;31m]\e[0m\e[1;77m 1 : 00:FA:CE:DE:AD:00  \e[0m\n"
       read  -p $'\n\e[1;36m\e[0m\e[1;77m\e[0m\e[1;36m ┌─[ Your specifie MAC address:]─[~]
 └──╼ ~ ' x
            if [[ $x == 1 ]]
               then
                  x="00:FA:CE:DE:AD:00"
               fi
                printf "\e[1;36m[\e[0m\e[1;77m*\e[0m\e[1;36m]\e[0m\e[1;77m Please select your interface: \e[0m\n\n"


    printf "         \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;77m eth0\e[0m\n"
    printf "         \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;77m wlan0\e[0m\n" 
    printf "         \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;77m wlan1\e[0m\n" 

       read  -p $'\n\e[1;36m\e[0m\e[1;77m\e[0m\e[1;36m ┌─[ Choose an option:]─[~]
 └──╼ ~ ' interface

    if [[ $interface == "1" ]] 
    then
    umac=$(sudo python creepy_mac.py eth0 --mac ${x})
    printf "\n${cyan}$umac"
    elif [[ $interface == "2" ]] 
    then
    umac2=$(sudo python creepy_mac.py wlan0 --mac ${x})
    printf "\n${cyan}$umac2"
    elif [[ $interface == "3" ]] 
    then
    umac3=$(sudo python creepy_mac.py wlan1 --mac ${x})
    printf "\n${cyan}$umac3"
    fi
fi
