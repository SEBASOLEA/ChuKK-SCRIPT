#!/bin/bash

echo "zip unzip ufw curl python python3 python3-pip openssl iptables lsof pv boxes at mlocate gawk bc jq curl socat netcat net-tools cowsay figlet lolcat apache2" | xargs apt-get install

# carpetas y archivos.
sdir=( "exec" )
url=( "https://gitlab.com/upxz/chukkmod-files/-/raw/main/bash" )
sfile=( "${sdir[@]}/msg" "${sdir[*]}/menu_inst" "${sdir[0]}/cabecalho" "${sdir[@]}/menu" "${sdir[$?]}/usercodes" "${sdir}/ferramentas" )

[[ ! -e ${sdir[0]} ]] && mkdir -p "${sdir[*]}" || rm -rf ${sdir[@]} && mkdir -p "${sdir[0]}"

   for file in `echo "msg menu_inst cabecalho menu usercodes ferramentas"` ; do
arqx=$(jq '{exec: {files: {msg: "0", menuinst: "1", cabecalho: "2", menu: "3", usercodes: "4", ferramentas: "5" }}}' -n | jq -r .exec.files.$(echo $file|tr -d "_"))
	wget -O ${sfile[$arqx]} ${url[@]}/$file &> /dev/null && chmod +rwx ${sfile[$arqx]}
   done
		for data in $(echo "slogan nombre"); do
			datos+=`read -p "Ingrese su $data: " slogan;echo -e "$slogan "`
		done
cat >> ${sdir[@]}/menu_credito << !?
Verified【 $(echo -e "${datos}"| awk '{print $1}')
!?

cat << eOf > ${sdir[@]}/name
$(echo -e "${datos}"| awk '{print $2}')
eOf

ln -s ${sdir[@]}/name /root/name
source /etc/adm-lite/msg
msg -bar
msg -ama " Comando principal: menu, chukk, adm"
msg -bar



