{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww33100\viewh20220\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 [ans@hccdcolduva01 tmp]$ cat printer_tester.sh\
#!/bin/sh\
rm -rf result.txt\
for i in `cat /var/tmp/printer_lists | awk -F " " '\{print $2\}'`\
do\
nc -w 2 -z 172.23.32.196 $i\
if [ $? -eq 1 ]\
 then\
    echo "172.23.32.196 $i console is DOWN" >> result.txt\
  else\
    echo "172.23.32.196 $i console is UP" >> result.txt\
  fi\
done\
[ans@hccdcolduva01 tmp]$}