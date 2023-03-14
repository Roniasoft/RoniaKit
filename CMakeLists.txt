cmake_minimum_required(VERSION 3.16)

#The Library name
project(RoniaKit VERSION 1.0 LANGUAGES CXX)

# ##################################################################################################
# Project Settings
# ##################################################################################################


set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (QML_IMPORT_PATH ${CMAKE_CURRENT_SOURCE_DIR})


#message(${QML_IMPORT_PATH})
#Turns on default settings for development of RoniaKit
set(DEVELOPER_DEFAULTS ON)

option(BUILD_TESTING "Build tests" ${DEVELOPER_DEFAULTS})
option(BUILD_EXAMPLES "Build Examples" ${DEVELOPER_DEFAULTS})
option(BUILD_SHARED_LIBS "Build as shared library" ON)
option(BUILD_DEBUG_POSTFIX_D "Append d suffix to debug libraries" OFF)

# ##################################################################################################
# Dependencies
# ##################################################################################################
# Find the Qt libraries
find_package(Qt6 REQUIRED COMPONENTS Quick Core5Compat)

if (NOT (Qt6_FOUND OR Qt5_FOUND))
  message(FATAL_ERRROR "Qt libraries were not found.")
endif()


if (Qt6_FOUND)
  set(Qt Qt)
else()
  set(Qt Qt5)
endif()


# ##################################################################################################
# Project Files
# ##################################################################################################
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

# Library Definition
qt_add_library(RoniaKit STATIC)

# Extra QML File properties
set_source_files_properties(
    PROPERTIES
        QT_QML_SINGLETON_TYPE True
)

qt_add_qml_module(RoniaKit
    URI "RoniaKit"
    VERSION 1.0

    QML_FILES
        resources/Components/HalfDial.qml
        resources/Components/Thermometer.qml
        resources/Components/RoniaControl.qml
        resources/Components/CircularGauge.qml
        resources/Components/CircularGaugeSpeed.qml
        resources/Components/CircularGaugeModern.qml
        resources/Components/FuelGauge.qml
        resources/Components/RangeControl.qml
        resources/Components/CircularRangeControl.qml
        resources/Components/AnalogGauge.qml
        resources/Components/ModernGauge2.qml


    SOURCES
	
    RESOURCES
        resources/Fonts/Font\ Awesome\ 6\ Pro-Regular-400.otf
        resources/Fonts/Font\ Awesome\ 6\ Pro-Solid-900.otf
        resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf
        resources/Images/gauge/Modern/back.png
        resources/Images/gauge/Modern/knob.png
        resources/Images/gauge/needle.png
        resources/Images/gauge/knob.png
        resources/Images/gauge/Speed/backOn.png
        resources/Images/gauge/Speed/backOff.png
        resources/Images/gauge/Speed/needle-on.png
        resources/Images/gauge/AnalougeGauge/backScreen.svg
        resources/Images/gauge/AnalougeGauge/innerRing.svg
        resources/Images/gauge/AnalougeGauge/middleRing.svg
        resources/Images/gauge/AnalougeGauge/outerRing.svg
        resources/Images/gauge/AnalougeGauge/topScreen.svg
        resources/Images/gauge/Modern/blueLight.png
        resources/Images/gauge/Modern/blueNeedle.png


)
	
#Add a library to the project using the specified source file
#add_library(RoniaKit::RoniaKit ALIAS RoniaKit)

target_include_directories(RoniaKit
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/resources>
  PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Source>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/RoniaKit>
)

#Definitions of preprocessor macros
target_compile_definitions(RoniaKit
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(RoniaKit PRIVATE Qt6::Quick Qt6::Core5Compat)

set_target_properties(RoniaKit PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS RoniaKit
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY} CACHE STRING "QtCreator QML Modules Lookup")

if(${BUILD_EXAMPLES})
  add_subdirectory(examples)
endif()

if(BUILD_TESTING)
#  add_subdirectory(test)
endif()
