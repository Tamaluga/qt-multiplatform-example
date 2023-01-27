set(APP_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

add_executable(${EXE_CONTROL} ${APP_SOURCES})

target_link_libraries(
    ${EXE_CONTROL}
    PUBLIC ${LIBRARY_NAME}
    Qt5::Core
)