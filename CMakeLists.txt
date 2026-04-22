cmake_minimum_required(VERSION 3.16)
project(ford_app VERSION 0.1 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
SET(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Positioning Location QuickEffects Quick WebView WebEngineQuick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appford_app
    main.cpp
)
qt_add_qml_module(appford_app
    URI ford_app
    QML_FILES
        Main.qml
        init/AppConfig.qml
        ui/ColorScheme.qml
        ui/CarInfo.qml
        ui/TopBar.qml
        ui/TopInfo.qml
        ui/BottomLeftBar.qml
        ui/BottomRightBar.qml
        ui/MediaControl.qml
        ui/MapScreen.qml
        ui/custom/CustomText.qml
    RESOURCES
        shaders/vfd.frag
        shaders/vfd.frag.qsb
        RESOURCES resources.qrc
        RESOURCES misc/colors.md
        RESOURCES .env
        RESOURCES ui/qmldir
)

set_target_properties(appford_app PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appford_app PRIVATE
    Qt6::Quick
    Qt6::Location
    Qt6::QuickEffects
    Qt6::WebView
    Qt6::WebEngineQuick
)
set_source_files_properties(ui/ColorScheme.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

include(GNUInstallDirs)
install(TARGETS appford_app
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)