# common cmake functionality

macro(basic_setup PROJECT_NAME)

    project(${PROJECT_NAME} 
        VERSION 1.0.0 
        LANGUAGES C CXX
    )

    # GLOBAL CMAKE VARIABLES
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    
endmacro()