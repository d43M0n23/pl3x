#!/bin/bash


#----------------
# BANNER-FUNCTION
#----------------

sh_banner () {
echo -e "\n"
echo -e "                __                .__  ________          "
echo -e "  _____   _____/  |______  ______ |  | \_____  \___  ___ "
echo -e " /     \_/ __ \   __\__  \ \____ \|  |   _(__  <\  \/  / "
echo -e "|  Y Y  \  ___/|  |  / __ \|  |_> >  |__/       \>    <  "
echo -e "|__|_|  /\___  >__| (____  /   __/|____/______  /__/\_ \ "
echo -e "      \/     \/          \/|__|               \/      \/ "
echo -e "\n"
echo -e "                                           ${yell}Version: ${version}${clear}"
echo -e "                                       ${green}Last Stable: ${LATEST_VERSION}${clear}\n"
echo -e "${yell}Option: ${red}--check, --core, --mp3, --create${clear}"
echo -e "${yell}Option: ${red}--wav, --rarbg, --mp3 --wav, --txt${clear}"
echo -e "${yell}Option: ${red}--merge, --siterip, --sample, --help${clear}"
echo -e "${yell}Option: ${red}--elite${clear}\n"
}

#------------------
## FUNCTION SECTION
#------------------

# CHECK-META
if [ "$1" = "--check" ]; then
sh_banner;

for file in *;
do
  find "$file" -type f -not -name ".*" | grep .mp4$ | while read file
  do
#$cmd $logdir/mail.log | egrep "LOGIN.*${roaduser}" | cut -d"," -f3 2>&1 | tee ${roaduser}_${outfile}
        exiftool $file | grep Title | grep RARBG 2>&1 | tee -a meta.check.txt
  done
done
exit
fi


