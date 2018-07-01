@echo off
date /t >forensic.txt
time /t >>forensic.txt
systeminfo >>forensic.txt
getmac >>forensic.txt
query process >>forensic.txt
net state -an >>forensic.txt