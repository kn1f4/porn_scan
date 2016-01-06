#!/bin/bash
PORT=80
mkdir ./savefile/

function fNmap_scan(){
        nmap -v -sS -p$1 $2 -Pn -oG $3
}

while [ -n "$1" ]
do
	case "$1" in
	-o) OPENIP="$2"
		echo -n -e $OPENIP\\t > /tmp/iprange.tmp
		shift ;;
	-e) ENDIP="$2"
		echo $ENDIP >> /tmp/iprange.tmp
		shift ;;
	-p) PORT="$2"
		shift ;;
        -h) echo -e " _  __      _  __ _  _\n| |/ /_ __ / |/ _| || |\n| ' /| '_ \| | |_| || |_ \n| . \| | | | |  _|__   _|\n|_|\_\_| |_|_|_|    |_| \n\nUse -o option specify start ip.\nUse -e option specify end ip.\nUse -p option specify porn.\nUse -m option jusk print nmap need ip range, -m option only be used in final.\n\nExample:\n    port_scan.sh -o 1.1.1.1 -e 2.2.2.2 -m\nOr\n    port_scan.sh -o 1.1.1.1 -e 2.2.2.2\n"
		exit
		shift ;;
	-m) LINE=`wc -l /tmp/iprange.tmp|awk '{print $1}'`
		for ((I=1;I<=$LINE;I++))do
		        OP1=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $1;print""}'`
	        	OP2=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $2;print""}'`
		        OP3=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $3;print""}'`
		        OP4=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $4;print""}'`
		        ED1=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $1;print""}'`
		        ED2=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $2;print""}'`
		        ED3=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $3;print""}'`
		        ED4=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $4;print""}'`
		        RANGE=$OP1-$ED1.$OP2-$ED2.$OP3-$ED3.$OP4-$ED4
			echo $RANGE
		done
			rm -rf /tmp/iprange.tmp 2 > /dev/null
		exit
		shift ;;
	*) echo "$1 option is not found, Use -h get help";;
	esac
	shift
done

LOG_FILE=/tmp/iprange.tmp
if [ ! -f "$LOG_FILE" ];then
	echo "Not found target IP, Use -h option get help."
else
	LINE=`wc -l /tmp/iprange.tmp|awk '{print $1}'`
	for ((I=1;I<=$LINE;I++))do
	        OP1=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $1;print""}'`
	        OP2=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $2;print""}'`
	        OP3=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $3;print""}'`
	        OP4=`cut -f1 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $4;print""}'`
	        ED1=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $1;print""}'`
	        ED2=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $2;print""}'`
	        ED3=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $3;print""}'`
	        ED4=`cut -f2 /tmp/iprange.tmp|awk -F '.' 'NR=='$I'{printf $4;print""}'`
	        RANGE=$OP1-$ED1.$OP2-$ED2.$OP3-$ED3.$OP4-$ED4
	        #SAVE_FILE_NAME=$OP1.$OP2.$OP3.$OP4\_TO\_$ED1.$ED2.$ED3.$ED4.gnmap
		SAVE_FILE_NAME=\.\/savefile\/$OP1.$OP2.$OP3.$OP4\_TO\_$ED1.$ED2.$ED3.$ED4.gnmap
        	fNmap_scan $PORT $RANGE $SAVE_FILE_NAME &
	done
#rm -rf /tmp/iprange.tmp
	
fi
