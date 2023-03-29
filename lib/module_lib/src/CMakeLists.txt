# Sources and headers
set(TARGET_INCLUDE_DIR "../include")
set(TARGET_SOURCES 
    Module.cpp
)

# Create library
add_library(${TARGET_NAME} STATIC ${TARGET_SOURCES})
target_include_directories(${TARGET_NAME} PUBLIC ${TARGET_INCLUDE_DIR})
target_link_libraries(${TARGET_NAME}
    device_lib
)