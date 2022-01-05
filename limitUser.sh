echo -e "PASSWORD\nPASSWORD" | passwd USER #Reset the password in case something goes wrong while the password is changed
B=0
LIMIT=1 #Limit to one connection at the same time
while true; do

        sleep 1
        A=$(ps -aux | grep -v 'grep' | grep -c 'USER@notty')

        if [ $((A)) -ge $LIMIT ]; then

                if [ $B = 0 ]; then
                        echo -e "RANDOM_PASSWORD\nRANDOM_PASSWORD" | passwd USER
                        echo "The limit of USER connections was exceeded"
                        B=1
                fi
        fi
        if [ $((A)) -lt $LIMIT ]; then
                if [ $B == 1 ]; then
                        echo -e "PASSWORD\nPASSWORD" | passwd USER
                        B=0
                fi
        fi
done
