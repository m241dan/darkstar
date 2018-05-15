#/!bin/bash

line=$(grep "launchdynamis" -r -i -l)
nano +$line $2

