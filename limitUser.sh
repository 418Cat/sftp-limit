echo Please enter the user\'s name you want to limit
read USER
echo Please enter the user\'s password
read PASSWORD
clear
echo Please enter a random long string \(just press all over your keyboard\)
read RANDOMPASSWORD
clear
echo -e "$PASSWORD\n$PASSWORD" | passwd "$USER"
echo How many users can connect at the same time \?
read LIMIT
B=0
while true; do

        sleep 1
        A=$(ps -aux | grep -v 'grep' | grep -c "$USER@notty")

        if [ $((A)) -ge $LIMIT ]; then

                if [ $B == 0 ]; then
			echo -e "$RANDOMPASSWORD\n$RANDOMPASSWORD" | passwd "$USER"
                        echo "The limit of $LIMIT connections at the same time was reached for $USER"
                        B=1
                fi
        fi
        if [ $((A)) -lt $LIMIT ]; then
                if [ $B == 1 ]; then
                        echo -e "$PASSWORD\n$PASSWORD" | passwd "$USER"
                        B=0
                fi
        fi
done
