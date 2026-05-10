#!/usr/bin/env bash

attempt=1
count=3
while [[ ${attempt} -le  ${count} ]]; do
	read -p "Enter the folder name: " folder

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
        exit
	fi

folder_name=$(basename "${folder}")
backup_folder="${folder_name}_backup"

attempt_back=1
count_back=3
while [[ ${attempt_back} -le ${count_back} ]]; do
        read -p "Enter the destination of backup:" destination_back
        if [[ -d "${destination_back}" ]]; then
            echo "Destination folder exists."
            break
        else 
            echo "Destination folde doesn't exist."
            echo "Try again."
        ((attempt_back = attempt_back +1))
        fi
done 
if [[ ${attempt_back} -gt ${count_back} ]]; then
		echo "You reached your max attempt ."
        exit
	fi

size=$(du -sh "${folder}" | awk '{print $1}')
files=$(find "${folder}" -type f | wc -l)   
dirs=$(find "${folder}" -type d | wc -l)
dirs=$((dirs - 1))

echo " Size of Backup Folder:${size}."
echo " Number of Files :${files}."
echo " Number of Directory :${dirs}."

read -p "Proceed with backup?(y/n)" confirm
    if [[ "${confirm}" == "y" ]]; then
        mkdir "${destination_back}/${backup_folder}"
        cp -r "${folder}" "${destination_back}/${backup_folder}"
        echo "Backup Completed successfully."

    else
        echo "Backup Cancelled."
        exit
    fi    

