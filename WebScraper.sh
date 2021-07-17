#Bash one liner for nmap scan file of port 80 scan, placing webpages in png format #using cutycapt
#STEP 1 - "sudo nmap -A -p80 --open 10.11.1.0/24 -oG nmap-scan_10.11.1.1-254"
#STEP 2 - Run the one liner below 
#for ip in $(cat nmap-scan_10.11.1.1-254 | grep 80 | grep -v "Nmap" | awk '{print $2}'); do cutycapt --url=$ip --out=$ip.png;done 
#STEP 3 - Run rhe SCRIPT:

#USING .PNG FILES AND NAMES BY PLACING IT IN HTML FILE (WEB VIEWABLE)
#!/bin/bash
# Bash script to examine the scan results through HTML.
echo "<HTML><BODY><BR>" > web.html
ls -1 *.png | awk -F : '{ print $1":\n<BR><IMG SRC=\""$1""$2"\" width=600><BR>"}' >>
web.html
echo "</BODY></HTML>" >> web.html 
#RUN firefox web.html to view page