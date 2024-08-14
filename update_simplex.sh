#!/bin/sh
target_dir="/home/user/AppImages/simplex/"

echo "Checking for update to SimpleX Chat Desktop..."

download_url=$(curl -s https://api.github.com/repos/simplex-chat/simplex-chat/releases/latest | grep browser_download_url | cut -d\" -f4 | grep AppImage)
latest_release=$(echo $download_url | grep -Eo '[0-9]+(\.[0-9]+)+')

echo "Latest release is v"$latest_release

if [ ! -d "${target_dir}" ]; then
	echo "SimpleX Chat is not installed"
	echo "Creating directory $target_dir"
	mkdir $target_dir

	#Creating version.txt to keep track of current installed version
	echo "0" > "$target_dir/version.txt"
fi

cd $target_dir
#Fetching current installed version
installed_version=$(cat version.txt)

#if [ "$latest_release" -gt "$installed_version" ]; then
if [ $(echo "$latest_release" "$installed_version" | awk '{print ($1 > $2)}') -gt "0" ] ; then
	
	#only try to remove old version if SimpleX Chat is installed
	if [ $(echo "$installed_version" | awk '{print ($1 == 0)}') -eq "0" ] ; then
		echo "Removing old AppImage from /home/roy/AppImages/simplex/"
		rm -f "simplex-desktop-x86_64.AppImage"
	fi

	# download AppImage
    	echo "Fething latest release..."
    	curl -# -L $download_url -o simplex-desktop-x86_64.AppImage 2>&1
    	
	echo "Setting permissions and making AppImage executable"
    	chmod 750 $target_dir"simplex-desktop-x86_64.AppImage"
	
	#updating version.txt from $installed_version to $latest_release" 
	echo $latest_release > version.txt
    	echo "Done :)" 
else
	echo "Installed version is v$installed_version"
	echo "No new update available"
fi
