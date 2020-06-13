#!/usr/bin/env bash

#######################################
# Echo with black color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_black(){
    local str_info=$@
    echo -e "\033[30m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with red color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_red(){
    local str_info=$@
    echo -e "\033[31m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with green color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_green(){
    local str_info=$@
    echo -e "\033[32m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with yellow color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_yellow(){
    local str_info=$@
    echo -e "\033[33m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with blue color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_blue(){
    local str_info=$@
    echo -e "\033[34m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with purple color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_purple(){
    local str_info=$@
    echo -e "\033[35m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with dark blue color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_dark_blue(){
    local str_info=$@
    echo -e "\033[36m${str_info}\033[0m"
    return 0
}

#######################################
# Echo with white color.
# Arguments:
#   str_info: all input args
# Outputs:
#   Writes input with color to stdout
#######################################
function echo_white(){
    local str_info=$@
    echo -e "\033[37m${str_info}\033[0m"
    return 0
}
