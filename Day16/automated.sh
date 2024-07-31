#!/bin/bash

"check disk usage"
ansible yp -i inventory.ini -m shell -a "df -h"

"Check services"
ansible yp -i inventory.ini -m apt -a "name=nginx state=present" --become
ansible yp -i inventory.ini -m service -a "name=nginx state=restarted" --become

"Ugrade packages"
ansible yp -i inventory.ini -m apt -a "upgrade=dist" --become



