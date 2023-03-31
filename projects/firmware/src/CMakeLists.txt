# Sources and headers
set(TARGET_SOURCES 
    main.cpp
)
set(TARGET_RESOURCES
    qml.qrc
)

# Configure Qt
find_package(Qt5 COMPONENTS Quick Gui REQUIRED)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC OFF)

# Create target
add_executable(${TARGET_NAME} 
	${TARGET_SOURCES}
	${TARGET_RESOURCES}
)
target_link_libraries(${TARGET_NAME} PRIVATE
	Qt5::Gui 
	Qt5::Quick
    Qt5::Qml
)