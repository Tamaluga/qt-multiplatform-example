# Sources and headers
set(TARGET_NAME "${TARGET_NAME}_test")
set(TARGET_SOURCES 
    "test_Module.cpp"
)

# Create target
add_executable(${TARGET_NAME} ${TARGET_SOURCES})
target_link_libraries(${TARGET_NAME}
    device_lib_mock
    module_lib
    GTest::gtest_main
    gmock_main
)

# Discovering unit tests
include(GoogleTest)
gtest_discover_tests(${TARGET_NAME})