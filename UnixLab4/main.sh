#!/bin/sh

function change_password() {
    local passwords=$(zenity --forms --title="Change your password" \
        --text="Set new password (minimum length 8 characters)" \
        --separator="," \
        --add-password="Your password" \
        --add-password="Repeate password")

    local password1=$( echo $passwords | awk -F ',' '{print $1}' )
    local password2=$( echo $passwords | awk -F ',' '{print $2}' )

    if [[ $password1 == $password2 ]]; then
        if [[ ${#password1} == 0 ]]; then
            zenity --warning --text "Please, select Your password"
            change_password
            return
        fi

        if [[ ${#password1} < 8 ]]; then
            zenity --warning --text "Your password too easy."
            change_password
            return
        fi

        local username=$(whoami)

        # закомментируем само изменение пароля
        # чтобы незадачливый пользователь Ctrl+C - Ctrl+V случайно его себе не поменял
        #echo "$username:$password1" | chpasswd
		
        local expire_time=$(chage -l $username | awk 'FNR==2{print $4}')
        local full_name=$(cat /etc/passwd | grep "^$username" \
            | awk -F ':' '{print $5}' | awk -F ',' '{print $1}')

        zenity --info --text "$full_name, Your password has been changed. Your new password expires: $expire_time"
    else
        zenity --warning --text "Passwords does not match"
        change_password
        return
    fi
}

change_password
