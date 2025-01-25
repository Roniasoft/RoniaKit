# RoniaKit

Introduction
============
The Ronia Kit is a collection of custom gauge components for Qt Quick applications. This library includes a variety of gauges, such as circular gauges, level gauges, thermometers, and speed gauges, that can be easily integrated into your QML projects.

With this library, you can create beautiful and informative gauges to display data in a visually appealing way. The gauges are highly customizable, allowing you to adjust the appearance, colors, and behavior of each gauge to suit your needs.


Usage
=============
To use a gauge component, simply add it to your QML file and set its properties as desired:

```qml
import QtQuick 2.0
import RoniaKit

CircularGauge {
    width: 200
    height: 200
    value: 50
    theme: "Light"
    rangeControl.minimumValue: 0
    rangeControl.maximumValue: 100
}
```

License
=============
This library is licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0). See the [LICENSE](LICENSE) file for details.

Platforms
---------

* Linux (x64, gcc-7.0, clang-7)
* OSX (Apple Clang - LLVM 3.6)
* Windows (Win32, x64, msvc2017, MinGW 5.3)

Dependencies
------------

* Qt > 6.4.0 (Will test on lower version soon)
* CMake 3.8

Current State (v1.0.0 alpha)
==================

Added Components:
* CircularBasicGauge
* CircularGauge
* LevelGauge
* CircularGauge/ModernGauge1
* CircularGauge/ModernGauge2
* CircularGauge/SpeedGauge
* CircularGauge/AnalogGauge

Added Themes:
* Minimal Dark
* Minimal Light


Future Components:
* Half-Dial Gauge
* Speed Gauge
* Fuel Gauge
* Ammeter
* Voltmeter
* Flowmeter
* Thermometer
* MartineDecker Gauge
* Spectrom
* Numeric Gauge
* Battery Level
* Compass

Future Themes:
* Sport Theme
* 3D
* More custom themes


Building
========

Linux
-----

- git clone git@github.com:Roniasoft/RoniaKit.git
- cd RoniaKit
- mkdir build
- cd build
- cmake ..
- make -j && make install
- make -j && make install

Qt Creator
----------

1. Open `CMakeLists.txt` as project.
2. `Build -> Run CMake`
3. `Build -> Build All`
4. Click the button `Run`

**Linking against RoniaKit**
============================


In order to link your QML projects against RoniaKit and use its components, you have numerous options, two of which are as follows:

1. If you go for adding RoniaKit as a sub-project of your own project by using CMake’s "add_subdirectory" command, you can simply assign the same path to the CMake’s "QT_QML_OUTPUT_DIRECTORY" variable in the "CmakeLists.txt" files of both projects; this as a side-effect adds path specified by "QT_QML_OUTPUT_DIRECTORY" variable to the QML import path of your project, which enables the QML engine to find the necessary RoniaKit plugin files, to link your project against RoniaKit at runtime. You can instead pass in the path, into which you want to install the RoniaKit plugin files, as the value for the optional "OUTPUT_DIRECTORY" argument of the "qt_add_qml_module" CMake command in RoniaKit’s "CmakeLists.txt" file, in which case the value of the "QT_QML_OUTPUT_DIRECTORY" variable will be ignored in the RoniaKit project.

2. If you plan to link more than one project of yours against RoniaKit, you may want to install RoniaKit plugin into some other shared path in your system, e.g. via adding CMake’s install(FILES …) command to RoniaKit’s "CmakeLists.txt" file and passing the full paths of the necessary plugin files to copy, namely the “qmldir” and “.qmltypes” files, as arguments plus the chosen installation destination path as the value of the CMake’s “install” command’s “DESTINATION” argument; then if you’ve passed e.g. the path X/RoniaKit as the value of the Cmake’s “install” command’s “DESTINATION” argument in the RoniaKit project’s "CmakeLists.txt" file, where X is an absolute path, then you have to add X to the QML import path of your own projects, by either adding X to your projects CMake’s "QML_IMPORT_PATH" variable or e.g. in case your project is an application project by alternatively calling “QqmlEngine” class’s “addImportPath” method on your “QqmlEngine” or “QQmlApplicationEngine” object instantiated in your project’s main funtion in the main.cpp file and passing in X as the sole argument; also be careful, that if you’ve specified e.g. the name “RoniaKit” as the RoniaKit’s module’s "URI" argument of CMake’s "qt_add_qml_module" in "CmakeLists.txt" file of the RoniaKit’s project, then in our example you definitively have to specify X/RoniaKit as the value of the Cmake’s “install” command’s “DESTINATION” argument in the RoniaKit project’s "CmakeLists.txt" file, otherwise QML engine won’t be able to find the RoniaKit’s necessary plugin files, to link your project against RoniaKit plugin at runtime.
 

Help Needed
===========

Any suggestions are welcome!

Contribution
============

#. Be polite, respectful and collaborative.
#. For submitting a bug:

   #. Describe your environment (Qt version, compiler, OS etc)
   #. Describe steps to reproduce the issue

#. For submitting a pull request:

   #. Create a proposal task first. We can come up with a better design together.
   #. Create a pull-request. If applicable, create a simple example for your
      problem, describe the changes in details, provide use cases.

#. For submitting a development request:

   #. Describe your issue in details
   #. Provide some use cases.

Citing
======

RONIA AB, RoniaKit, (2023), GitHub repository, https://github.com/Roniasoft/RoniaKit

BibTeX::

    @misc{RONIA AB,
      author = {RONIA AB},
      title = {RoniaKit. QML Control Library},
      year = {2023},
      publisher = {GitHub},
      journal = {GitHub repository},
      howpublished = {\url{https://github.com/Roniasoft/RoniaKit}},
      commit = {6ba9c66cdbc8e6d00fd4a8c6b3bde05c616cfa6a}
    }


Showcase
========
RONIA Kit Example (Light Theme):
![image](https://user-images.githubusercontent.com/53909162/233635754-87d08df4-5b11-4010-bf6a-479cbb1c0a8f.png)

RONIA Kit Example (Dark Theme):
![image](https://user-images.githubusercontent.com/53909162/233635891-a4e3a6ce-2577-4e82-98ab-ed94d9fa9fbb.png)



