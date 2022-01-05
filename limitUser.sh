echo -e "PASSWORD\nPASSWORD" | passwd USER
B=0
while true; do

        sleep 1
        A=$(ps -aux | grep -v 'grep' | grep -c 'USER@notty')

        if [ $((A)) != "0" ]; then

                if [ $B = 0 ]; then
                        echo -e "RANDOM_PASSWORD\nRANDOM_PASSWORD" | passwd USER
                        echo "USER connected"
                        B=1
                fi
        fi
        if [ $((A)) == "0" ]; then
                if [ $B == 1 ]; then
                        echo -e "PASSWORD\nPASSWORD" | passwd USER
                        echo "USER disconnected"
                        B=0
                fi
        fi
done