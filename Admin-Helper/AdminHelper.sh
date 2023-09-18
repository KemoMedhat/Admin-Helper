main(){
clear;
select choice in "Add User" "Edit User" "Remove User" "Remove User&Data" \
		    "Add Group" "Remove Group" "Add User to Group" "List All Users" \
		    "View User Info" "Exit"
do
    case $choice in
	"Add User")
		echo Enter user name ;
		read uname ;
		useradd $uname;
		echo $uname added successfully;sleep 3;main;;
	"Edit User")
		source EditUser.sh;;
	"Remove User")
		echo Enter user name ;
		read uname ;
		userdel $uname;
		echo $uname Removed successfully;sleep 3;main;;
	"Remove User&Data")
		echo Enter user name ;
		read uname ;
		userdel -r $uname;
		echo $uname Removed successfully;sleep 3;main;;
	"Add Group")
		echo Enter Group Name;
		read gname
		groupadd $gname;
		echo $gname created successfully;sleep 3;main;;
	"Remove Group")
		echo Enter Group Name;
                read gname
                groupdel $gname;
                echo $gname Removed successfully;sleep 3;main;;
	"Add User to Group")
		echo Enter Group Name;
                read gname
		echo Enter User Name;
		read uname;
                usermod -aG $gname $uname;
                echo User $uname appended to $gname;sleep 3;main;;
	"List All Users")
		awk -F: '{if($3 > 1000||$3==0){print $1}}' /etc/passwd;;
	"View User Info")
		echo Enter User name;
		read uname;
		grep $uname /etc/passwd |cut -d: -f 1,3,5,7;;
 	"Exit") exit;;
	     *) echo "Invalid option $REPLY";;
	esac
done
}
main
