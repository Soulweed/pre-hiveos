#!/bin/bash

# -------------------------------------------------------------------------
# Author :  Nontachai Yoothai
# Company : Provincial Electricity Authority
# Purpose : to Start Docker Container and Start services insided.
# -------------------------------------------------------------------------


if [[ $(docker images nontachai/hiveos:latest -q) ]]; then
	echo "Docker Image found."
	if [[ $(docker ps -q) ]]; then
                echo "Docker Container Running."

	else
		docker run -it -d -u root --name hiveos nontachai/hiveos:latest bash
                echo "Start Docker Container."
        fi
	if [[ $(docker ps --filter name=hiveos) ]]; then
		docker exec -it -u root hiveos /etc/init.d/volttron start
		docker exec -it -u root hiveos /etc/init.d/volttron status
	fi 

else
	echo "Docker Image Not Found"

fi
