
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC OFF)
set(CMAKE_AUTOUIC OFF)

add_executable(${EXE_UI}
    main.cpp
)

target_link_libraries(${EXE_UI}
    Qt5::Gui
    Qt5::Qml
)