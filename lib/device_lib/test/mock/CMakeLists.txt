# Sources and headers
set(TARGET_NAME "device_lib_mock")
set(TARGET_INCLUDE_DIR 
    "."
    "../include"
)

# Create target
add_library(${TARGET_NAME} INTERFACE)
target_include_directories(${TARGET_NAME} INTERFACE ${TARGET_INCLUDE_DIR})
target_link_libraries(
    ${TARGET_NAME} INTERFACE
    gtest
    gmock
)