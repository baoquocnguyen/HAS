#!/bin/bash

for number in $(seq 1 2)
do
        mkdir $number
        python cut.py $number


done

