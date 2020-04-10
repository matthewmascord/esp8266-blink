add_custom_command(
        OUTPUT TestMain_Runner.c
        COMMAND ruby ${UNITY_HOME}/auto/generate_test_runner.rb ${CMAKE_CURRENT_LIST_DIR}/TestMain.c TestMain_Runner.c
)
add_subdirectory(mocks)
add_executable(test_meh_app
        TestMain.c
        ../src/main.c
        ../src/main.h
        TestMain_Runner.c)

include_directories("../src")

target_link_libraries(test_meh_app cmock mocks unity mocks)

add_test(test_meh test_meh_app)
