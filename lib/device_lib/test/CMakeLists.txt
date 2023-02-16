# Sources and headers
set(TARGET_NAME "device_lib_test")
set(TARGET_SOURCES 
    "test_ConcreteDevice.cpp"
)

# Create target
add_executable(${TARGET_NAME} ${TARGET_SOURCES})
target_link_libraries(${TARGET_NAME}
    device_lib
    GTest::gtest_main
)

# Discovering unit tests
include(GoogleTest)
gtest_discover_tests(${TARGET_NAME})

# Subdirectories
add_subdirectory(mock)