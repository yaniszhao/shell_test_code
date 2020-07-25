1.若文件或目录有空格：变量赋值要加""，变量使用的时候要用""，用ls分割文件的时候要改IFS=$'\n'
2.分隔符:ls分隔符是回车吗，为什么显示的是tab
3.##*和%%*的用法https://www.cnblogs.com/Raymontian/p/7111045.html
4.$( ), ${ }, $'', ` `,
5.awk, seq, xarg, seq, find, cat, uniq, grep,expect
6.通配符--是针对shell的匹配文件；正则表达式--是匹配字符串
####################################编辑相关#########################################################
Ctrl+a: 跳到命令行首
Ctrl+e: 跳到命令行尾
Ctrl+u: 删除光标至命令行首的内容
Ctrl+k: 删除光标至命令行尾的内容
Ctrl+<-  跳到前一个单词首部
Ctrl+->  跳到后一个单词尾部
Ctrl+l  清屏（clear）
Esc+.   (键盘按键)上一个命令的最后一个参数
!$      （命令）上一个命令的最后一个参数,用法如：ls !$
使用!$可以快速得到上次命令使用的文件名,或者使用esc+.也可以
vi使用命令set hlsearch可以高亮搜索字符
####################################系统相关#########################################################
diskutil list #查看要用的设备
sudo mount -t ntfs -o rw,auto,nobrowse /dev/disk2s3 /Volumes/win  #装载ntfs系统
find . -type d -empty -exec touch {}/.gitignore \; #给所有的子空目录都添加gitignore文件，可以改成.gitkeep
find . -type d -empty |xargs -t -I {} touch {}/.gitignore #用这个方法还可以看到touch了哪些文件，-exec的没有
####################################正则表达式#########################################################
1.grep ‘.html’ log.txt | grep -v ‘_’ | grep -v ‘-‘ | cut -f 1 -d ‘.’ > log2.txt #取含-但不含_的不含后缀的文件名
2.grep ‘^[a-z][a-z][a-z]-‘ tmp.txt | cut -d ‘.’ -f 1 > tmp2.txt #三个字母开头的不含后缀的文件名，可以改成'^[a-z]{3}-‘吧
3.cut -d ':' -f 1 a.txt | cut -d '"' -f 2 >b.txt
4.cut -d ':' -f 1 a.txt | cut -d '"' -f 2 >b.txt
5.cut -d ':' -f 2 a.txt | cut -d ',' -f 1 >>b.txt
6.sort para_en.txt | uniq | grep -v '_' | grep -v '-' | cut -f 1 -d '.' > en.txt #排序、去重、不含_、含-、去后缀
7.sort msp_para_en.txt | uniq | tr 'A-Z' 'a-z' > msp_en.txt #排序、去重、大写变小写
8.ls | grep 'alm-[0-9]' | cut -f 2 -d '-' | cut -f 1 -d '.' | sort > a.txt #匹配、切割、去后缀、排序
9.ls | grep '^[a-z]' | cut -d ‘.' -f 1 | sed 's/-/\/' |  tr 'a-z' 'A-Z' | sort > a.txt #匹配开头、分割、字符替换、小写变大写、排序
10.ls | grep -v '_' | grep -v '-' | cut -d '.' -f 1 | sort > a.txt
11.sort tmp.txt | uniq > tmp2.txt && rm tmp.txt && mv tmp2.txt tmp.txt #排序、去重、替换原文件
12.cat tmp.txt | tr 'A-Z' 'a-z' | sort | uniq > tmp2.txt && rm tmp.txt && mv tmp2.txt tmp.txt
13.history | awk '{print $4, $5}' | sed 's/sudo//' | awk '{print $1}' | sort | uniq -c | sort | tail | sort -r #应该是找出使用比较多的命令
####################################脚本相关#########################################################
for i in $(seq 1 19);do mv file$i.flv outfile$i.flv;done #批量移动文件
for i in $(seq 1 19);do echo "file 'outfile$i.flv'" >>list3.txt;done #批量输出字符
sed -i "s/\””1GHugeNum\”\,\\” ddfconfi.json #这个具体的匹配内容记得不太清楚了
OLDFS=$IFS; IFS=$’\n’; for i in $(ls); do newname=$(echo $i | sed ’s/Appendix [0-9]//‘); mv $i $newname; done; IFS=$OLDFS #批量重命名
for i in $(ls); do; if [-d $i]; then echo “$i”; fi; done #输出ls下目录文件
