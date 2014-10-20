#!/bin/bash
export BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"; #Defining base path
source $HOME/.notification-box #General Application Settings
source $BASE/functions #Functions
sleep 30; #Wait 30 seconds before activation
run_scripts #Run scripts


   