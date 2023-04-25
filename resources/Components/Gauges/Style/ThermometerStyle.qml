/*
 * Project: RoniaKit
 * Version: 1.0.0
 * License: Apache 2.0
 *
 * Copyright (c) 2023 Ronia AB
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Level Gauge Style
 * ************************************************************************************************/
RoniaControlStyle {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    required property RangeControl rangeControl;

    property          real         tickmarkSpacing: outerRadius/20

    property          real         labelSpacing:    3*outerRadius/14

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    Component.onCompleted: {
        backgroundMap[RoniaControl.Theme.Light] = "#dce2e2"
        backgroundMap[RoniaControl.Theme.Dark] = "white"
        labelMap[RoniaControl.Theme.Light] = "black"
        labelMap[RoniaControl.Theme.Dark] = "white"
        majorTickmarkMap[RoniaControl.Theme.Dark] = "#dce2e2"
        majorTickmarkMap[RoniaControl.Theme.Light] = "#cccccc"
        minorTickmarkMap[RoniaControl.Theme.Dark] = "#dce2e2"
        minorTickmarkMap[RoniaControl.Theme.Light] = "#cccccc"
        backgroundMapChanged();
        majorTickmarkMapChanged();
        minorTickmarkMapChanged();
        labelMapChanged();
    }

    /* Children
     * ****************************************************************************************/
    tickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            antialiasing: true
            implicitHeight: outerRadius * 0.06
            color: majorTickmarkMap[theme]
            visible: true
            radius: 5
        }

    minorTickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            antialiasing: true
            implicitHeight: outerRadius * 0.03
            color: minorTickmarkMap[theme]
            visible: true
            radius: 5
    }

    background: Rectangle {
        id: background
        height: parent.height
        width: parent.width
        color: "transparent"
        anchors.centerIn: parent
        property real outerWidth: outer.width;

        Image {
            id: outer
            anchors.centerIn : background
            source: "qrc:/RoniaKit/resources/Images/gauge/Thermometer/dark/thermometerDarkOuter.png";
            asynchronous: true
            smooth: true;
            antialiasing: true;
            sourceSize {
                width: background.width / 2
                height: background.height
            }

        }
        Image {
            id: inner
            source: "qrc:/RoniaKit/resources/Images/gauge/Thermometer/dark/thermometerDarkInner.png";
            anchors.bottom: outer.bottom
            anchors.horizontalCenter: outer.horizontalCenter
            anchors.bottomMargin: outer.height * 0.08
            asynchronous: true
            smooth: true;
            antialiasing: true;
            sourceSize {
                width: outer.width
                height: outer.height
            }
            Image {
                id: innerFilled
                source: "qrc:/RoniaKit/resources/Images/gauge/Thermometer/dark/thermometerDarkInnerFilled.png";
                anchors.fill: parent
                asynchronous: true
                smooth: true;
                antialiasing: true;
                clip: true
                Component.onCompleted: {
                    console.log(innerFilled.height * 0.7,rangeControl.minimumValue,rangeControl.maximumValue)
                }
            }
            Rectangle {
                id: thermometer
                width: innerFilled.width* 0.38
                height: innerFilled.height * 0.7 - ( control.value * innerFilled.height * 0.7 /
                                                   ( rangeControl.maximumValue - rangeControl.minimumValue)
                                                    )
                anchors.horizontalCenter: innerFilled.horizontalCenter
                anchors.top: innerFilled.top
                anchors.topMargin: 2
                radius: innerFilled.width/6
                color: "#303030"
                visible: !(control.value === rangeControl.maximumValue)
            }

            Rectangle {
                id: filledCircle
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.width
                radius: parent.width/2
                color: backgroundMap[theme]
            }
            Rectangle {
              id: squareRect
              color: "#303030"
              height: thermometer.radius + 1
              anchors.bottom : thermometer.bottom
              anchors.bottomMargin: -1
              anchors.left : thermometer.left
              anchors.right : thermometer.right
              visible: (control.value === rangeControl.maximumValue) ? false : true

            }
        }




    }
    foreground: Rectangle {

        height: parent.height
        width: parent.width
        color: "transparent"
        anchors.centerIn: parent

    }

    Loader {
        id: backgroundLoader
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        sourceComponent: background
    }

    Loader {
        id: foregroundLoader
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        sourceComponent: foreground
    }

    Loader {
        id: majorTickLoader
        active: control.rangeControl.majorTickVisible
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: tickmarkRepeater
            model: 2
            anchors.fill: parent
            delegate: Loader {
                id: tickmarkLoader
                x: control.outerRadius * 0.18
                y: 0
                sourceComponent: control.tickmark
                transform: [
                    Rotation{
                        angle: 90
                    },
                    Translate {
//                        y: index * -((control.height-outerRadius/15)/(control.rangeControl.majorTickCount-1))
                    }
                ]
            }
        }
    }

//    Loader {
//        active: rangeControl.minorTickVisible
//        anchors.centerIn: parent
//        sourceComponent: Repeater {
//            id: minortickmarkRepeater
//            model: (rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount
//            anchors.fill: parent
//            delegate: Loader {
//                id: minorTickmarkLoader
//                x: 0
//                y: control.height/2 - outerRadius/25
//                visible: !(index%(control.rangeControl.minorTickCount+1)===0)
//                sourceComponent: control.minorTickmark
//                transform: [
//                    Rotation{
//                        angle: 90
//                    },
//                    Translate {
//                        y: index * -((control.height-outerRadius/15)/
//                                     ((rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount-1))
//                    }
//                ]
//            }
//        }
//    }

//    Loader {
//        active: true //rangeControl.labelVisible
//        anchors.centerIn: parent

//        sourceComponent: Repeater {
//            id: labelRepeater
//            model: rangeControl.majorTickCount
//            anchors.fill: parent

//            delegate: Loader {
//                id: labelLoader
//                x: (labelSpacing - tickmarkSpacing)*-1
//                y: control.height/2 - outerRadius/15

//                sourceComponent: Text{
//                    font.pixelSize: Math.max(6, 0.04 * control.outerRadius)
//                    text: Math.round((rangeControl.maximumValue
//                                      - rangeControl.minimumValue)
//                                      / (rangeControl.majorTickCount - 1)
//                                      * index + rangeControl.minimumValue)
//                    color: labelMap[theme] ?? "white"
//                    antialiasing: true
//                    horizontalAlignment: Text.AlignHCenter
//                    verticalAlignment: Text.AlignVCenter

//                }

//                transform: [
//                    Translate {
//                       y: index * -((control.height-outerRadius/15)/(control.rangeControl.majorTickCount-1))
//                    }
//                ]
//            }
//        }
//    }
}
