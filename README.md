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
import RoniaKit.Gauges

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



