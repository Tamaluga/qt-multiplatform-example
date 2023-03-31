# common cmake functionality

macro(basic_setup PROJECT_NAME PROJECT_DESCRIPTION)

    project(${PROJECT_NAME} 
        VERSION 1.0.0 
        LANGUAGES C CXX
        DESCRIPTION PROJECT_DESCRIPTION
    )

    # GLOBAL CMAKE VARIABLES
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

    set(TARGET_NAME "${PROJECT_NAME}")

endmacro()

macro(add_project_subdirectories)

    add_subdirectory(src)
    if(TESTING_ENABLED)
        add_subdirectory(test)
    endif()
    
endmacro()