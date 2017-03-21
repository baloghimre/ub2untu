#vboxmanage startvm "XP"
#VBoxManage controlvm "XP" setcredentials "linux" "12345" ""


#JÓÓVBoxManage startvm "XP" &&  VBoxManage controlvm "XP" setcredentials "linux" "12345" "" && exit 0


VBoxManage startvm "XP" 
VBoxManage controlvm "XP" setcredentials "linux" "12345" ""
sleep 5
VBoxManage setextradata "XP" GUI/Seamless on
sleep 30
VBoxManage --nologo guestcontrol "XP" run --exe "C:\\Program Files\\Microsoft Visual Studio 10.0\\Common7\\IDE\\devenv.exe" --username "linux" --password "12345" --wait-stdout
exit 0
