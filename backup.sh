#!/usr/bin/env bash

attempt=1
count=3
while [[ ${attempt} -le  ${count} ]]; do
	read -p "Enter the folder name:" folder

	if [[ -d "${folder}" ]]; then
		echo "Folder found."
		break
	else
		echo "Folder not found."
		echo "Try Again"
		(( attempt++ ))
        fi
done


	if [[ ${attempt} -gt ${count} ]]; then
		echo "You reached your max attempt ."
	fi

