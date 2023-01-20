set(APP_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/main.cpp")

add_executable(${EXE_UI} ${APP_SOURCES})

target_link_libraries(
    ${EXE_UI}
    PUBLIC ${LIBRARY_NAME}
)
