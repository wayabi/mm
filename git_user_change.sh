#!/bin/sh

if [ -f .git_users ]; then
	:
else
	echo "create .git_users file. csv of <email>,<name>"
fi

if [ -f .gitconfig.back ]; then
	:
else
	echo "cpy"
	cp .gitconfig .gitconfig.back
fi

idx_user=`expr $1 \+ 1`
line=`cat .git_users | head -n ${idx_user} | tail -n 1`
email=`echo ${line} | cut -d ',' -f 1`
name=`echo ${line} | cut -d ',' -f 2`

echo "[user]" > .gitconfig
echo "  email = ${email}" >> .gitconfig
echo "  name = ${name}" >> .gitconfig

echo "[user]" 
echo "  email = ${email}"
echo "  name = ${name}" 
