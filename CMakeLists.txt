set( RONIA_KIT_LIB "RoniaKit" CACHE INTERNAL "RoniaKit")
set( QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )

file( GLOB_RECURSE RONIA_KIT_QML_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "qml/*.qml" )

qt_add_library( ${RONIA_KIT_LIB} STATIC )

qt_add_qml_module( ${RONIA_KIT_LIB}
    URI RoniaKit
    RESOURCE_PREFIX /
    QML_FILES ${RONIA_KIT_QML_FILES}
    RESOURCES
        assets/fonts/fontAwesome6-Pro-Regular-400.otf
        assets/fonts/fontAwesome6-Pro-Solid-900.otf
        assets/fonts/fontsFree-Net-DS-DIGI-1.ttf
    NO_PLUGIN
)

add_subdirectory(modules/Gauges)
