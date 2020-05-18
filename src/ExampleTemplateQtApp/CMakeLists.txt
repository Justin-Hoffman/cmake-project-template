#cmake_minimum_required(VERSION 3.9)
#
#project(ExampleTemplateQtApp VERSION 1.0 DESCRIPTION "A CMake Build Template Library" LANGUAGES C CXX)
#
## TODO: This may be problematic on non GNU platforms
#include(GNUInstallDirs)

# Automatically run Qt build tools
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Find the QtWidgets library
find_package(Qt5 REQUIRED COMPONENTS Widgets Qml Quick ) 

# Create Application 
if(ANDROID)
  # On Android the activity entrypoint for "typical" application is Java
  # We'll build our UI application as a shared library and let the QT tools 
  # a user facing application with java entrypoint. 
  add_library(ExampleTemplateQtApp SHARED ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)
 else()
  # On other platforms create a first class executable
  add_executable(ExampleTemplateQtApp ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)
endif()

target_sources(ExampleTemplateQtApp
 PRIVATE
   ${CMAKE_CURRENT_SOURCE_DIR}/src/resources.qrc
 )

# Add the Qt5 Widgets for linking
target_link_libraries(ExampleTemplateQtApp Qt5::Widgets Qt5::Qml Qt5::Quick)

target_include_directories(ExampleTemplateQtApp
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
  PRIVATE 
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src/res>
    ./src
  )
set_property(TARGET ExampleTemplateQtApp 
  PROPERTY 
    AUTOMOC ON)
target_compile_options(ExampleTemplateQtApp PRIVATE -Wall -Werror)
