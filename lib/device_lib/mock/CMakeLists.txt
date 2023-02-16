cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
include(${CMAKE_SOURCE_DIR}/cmake/helpers.cmake)

set(TARGET_NAME "device_lib_mock")
set(TARGET_INCLUDE_DIR 
    "${CMAKE_CURRENT_SOURCE_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/../include"
)




# set(SOURCES
#     ${CMAKE_CURRENT_LIST_DIR}/MockDevice.hpp)
# add_library(mock_device OBJECT ${SOURCES})
# target_include_directories(mock_device PRIVATE ${PROJECT_SOURCE_DIR}/include)

# # Mock library for lib
# add_library(${TARGET_NAME} STATIC 
# $<TARGET_OBJECTS:mock_device>
# )
# target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_CURRENT_LIST_DIR})

# Create library
# add_library(${TARGET_NAME} INTERFACE)
# add_dependencies(${TARGET_NAME} device_lib)
# target_include_directories(${TARGET_NAME} PRIVATE ${TARGET_INCLUDE_DIR})
# target_link_libraries(${TARGET_NAME}
#     device_lib
#     gtest
#     gmock
# )


add_library(${TARGET_NAME} INTERFACE)
target_include_directories(${TARGET_NAME} INTERFACE ${TARGET_INCLUDE_DIR})
target_link_libraries(
    ${TARGET_NAME} INTERFACE
    device_lib
    gtest
    gmock
)