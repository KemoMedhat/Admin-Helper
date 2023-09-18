Edit_User()
{
clear;
select edit in "Rename" "Change UID" "Back"
do
	case $edit in
		"Rename")
			echo Enter User Name;
			read uname;
			echo Enter New Name;
			read nname;
			usermod -l $nname $uname;
			echo Successfull Opertation;sleep 2; Edit_User;;
		"Change UID")
			echo Enter User Name;
			read uname;
			echo Enter new UID;
			read nuid;
			usermod -u $nuid $uname;
			echo Successfull Opertation;sleep 2; Edit_User;;
		"Back") clear;main ;;
		*) echo Invalied Option;;
	esac
done
}
Edit_User