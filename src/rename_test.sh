#!/bin/sh
#set -x

types='avi mp4 mkv rmvb 3gp'
stypes='a m mk r 3'
function rename(){
    for type in $types;do
        if [ $type == 'mkv' ];then
    	suffix=${type:0:2}
        else
    	suffix=${type:0:1}
        fi
        ls|grep ".*\.$type$"|sed "s/\.$type//"|xargs -t -I {} mv {}.$type {}.$suffix
    done
}
function srename(){
    for type in $stypes;do
        if [ $type == 'a' ];then suffix='avi';
        elif [ $type == 'm' ];then suffix='mp4';
        elif [ $type == 'mk' ];then suffix='mkv';
        elif [ $type == 'r' ];then suffix='rmvb';
        elif [ $type == '3' ];then suffix='3gp';
	else echo;
        fi
	echo $type $suffix
        #ls|grep ".*\.$type$"|sed "s/\.$type//"|xargs -t -I {} mv {}.$type {}.$suffix
	find . -name "*.$type"|sed "s/\.$type//"|xargs -t -I {} mv {}.$type {}.$suffix	
    done
}
function encrypt_file_name() {
    for type in $types;do
        files=$(find . -name "*.$type")
    	echo $file
        for file in $files;do
    	echo $file
    	if [ -f $file ];then
    	    for type in $types;do
    		good=$(echo $file|grep ".*$type$")
    		if [[ $good != '' ]];
    		    then echo $good
    		    newname=${good%/*}/$(echo ${good##*/}|base64).z
    		    echo $newname
		    #echo $(echo ${newname##*/}|base64 -D)
    		    set -x
    		    mv $file $newname
    		    set +x
    		fi
    	    done
    	fi
        done
    done
}
function decrypt_file_name() {
    #files=$(ls|grep ".*\.z$")
    files=$(find . -name "*.z")
    for file in $files;do
	echo $file
	newfile=${file%/*}/$(echo ${file##*/}|sed "s/\.z$//"|base64 -D)
	#echo $newfile
	set -x
	mv $file $newfile
	set +x
    done
}
function hello() {
    echo hello world
}
#ls|grep ".z$"|xargs -I {} hello {}
#exit
#srename
if [[ $1 == 'encrypt' ]] ;then
	encrypt_file_name
elif [[ $1 == 'decrypt' ]];then
	decrypt_file_name
fi
exit
workdir=$(pwd)
items=$(ls)
echo $items
for item in $items;do
    if [ -d $item ];then
	echo $item
	cd $item
	rename
	cd $workdir
    fi
done
