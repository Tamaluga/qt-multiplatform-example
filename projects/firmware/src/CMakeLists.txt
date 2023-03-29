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
set(CMAKE_AUTORCC OFF)
set(CMAKE_AUTOUIC OFF)

# Create target
qt5_add_resources(qml_QRC ${TARGET_RESOURCES})
add_executable(${TARGET_NAME} 
	${TARGET_SOURCES}
	${qml_QRC}
)
target_link_libraries(${TARGET_NAME} 
	Qt5::Gui 
	Qt5::Quick
    Qt5::Qml
)