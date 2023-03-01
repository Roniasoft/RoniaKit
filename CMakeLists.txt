cmake_minimum_required(VERSION 3.16)

#The Library name
project(RoniaGauges VERSION 1.0 LANGUAGES CXX)

# ##################################################################################################
# Project Settings
# ##################################################################################################


set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (QML_IMPORT_PATH ${CMAKE_CURRENT_SOURCE_DIR})


#message(${QML_IMPORT_PATH})
#Turns on default settings for development of RoniaGauges 
set(DEVELOPER_DEFAULTS ON)

option(BUILD_TESTING "Build tests" ${DEVELOPER_DEFAULTS})
option(BUILD_EXAMPLES "Build Examples" ${DEVELOPER_DEFAULTS})
option(BUILD_SHARED_LIBS "Build as shared library" ON)
option(BUILD_DEBUG_POSTFIX_D "Append d suffix to debug libraries" OFF)

# ##################################################################################################
# Dependencies
# ##################################################################################################
# Find the Qt libraries
find_package(Qt6
  COMPONENTS
   Quick
)

if (NOT Qt6_FOUND)
  find_package(Qt5 QUIET
    COMPONENTS
    Quick
  )
endif()


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
qt_add_library(RoniaGauges STATIC)

# Extra QML File properties
set_source_files_properties(
    PROPERTIES
        QT_QML_SINGLETON_TYPE True
)

qt_add_qml_module(RoniaGauges
    URI "RoniaGauges"
    VERSION 1.0

    QML_FILES


    SOURCES
	
    RESOURCES
        resources/fonts/Font\ Awesome\ 6\ Pro-Regular-400.otf

)
	
#Add a library to the project using the specified source file
#add_library(RoniaGauges::RoniaGauges ALIAS RoniaGauges)

target_include_directories(RoniaGauges
  PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/resources>
  PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Source>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/RoniaGauges>
)

#Definitions of preprocessor macros
target_compile_definitions(RoniaGauges
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(RoniaGauges
  PRIVATE
    ${Qt}::Quick
)

set_target_properties(RoniaGauges PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS RoniaGauges
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY} CACHE STRING "QtCreator QML Modules Lookup")

if(${BUILD_EXAMPLES})
  add_subdirectory(examples)
endif()

if(BUILD_TESTING)
#  add_subdirectory(test)
endif()
