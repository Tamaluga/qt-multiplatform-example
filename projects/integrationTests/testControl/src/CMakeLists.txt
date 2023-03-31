# Sources and headers
set(TARGET_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

# Configure Qt
find_package(Qt5 COMPONENTS Core REQUIRED)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC OFF)
set(CMAKE_AUTOUIC OFF)

# Create target
add_executable(${TARGET_NAME} ${TARGET_SOURCES})
target_link_libraries(${TARGET_NAME} PRIVATE
    device_lib
    Qt5::Core
)