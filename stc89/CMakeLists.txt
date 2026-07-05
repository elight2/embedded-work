cmake_minimum_required(VERSION 3.12)
set(CMAKE_PROJECT_NAME "stc89prac")
project(${CMAKE_PROJECT_NAME} LANGUAGES NONE)

add_custom_target( build ALL
    COMMAND sdcc ${CMAKE_CURRENT_SOURCE_DIR}/main.c
    COMMAND cp main.ihx /mnt/iData2/windows/pro.hex
    COMMAND sync
)