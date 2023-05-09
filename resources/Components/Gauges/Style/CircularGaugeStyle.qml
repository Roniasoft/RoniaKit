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
 * Circular Gauge Style
 * ************************************************************************************************/
RoniaControlStyle {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property real                 minorInsetRadius:        outerRadius - rangeControl.minorTickmarkInset

    property real                 majorInsetRadius:        outerRadius - rangeControl.tickmarkInset

    property real                 labelInsetRadius:        outerRadius - rangeControl.labelInset

    property bool                 digitalValueVisibility: true

    property real needleRotation: {
        var percentage = (control._value - rangeControl.minimumValue) /
                         ( rangeControl.maximumValue -  rangeControl.minimumValue);
        rangeControl.startAngle + percentage *
                Math.abs(rangeControl.endAngle -  rangeControl.startAngle);
    }


    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    /* Object Properties
     * ****************************************************************************************/
    width: 250
    height: 250

    Component.onCompleted: {
        backgroundMap[RoniaControl.Theme.Light] = "#ffffff"
        backgroundMap[RoniaControl.Theme.Dark] = "#333333"
        labelMap[RoniaControl.Theme.Light] = "black"
        labelMap[RoniaControl.Theme.Dark] = "white"
        majorTickmarkMap[RoniaControl.Theme.Dark] = "#e5e5e5"
        majorTickmarkMap[RoniaControl.Theme.Light] = "#c8d0d0"
        minorTickmarkMap[RoniaControl.Theme.Dark] = "#e5e5e5"
        minorTickmarkMap[RoniaControl.Theme.Light] = "#c8d0d0"
        backgroundMapChanged();
        majorTickmarkMapChanged();
        minorTickmarkMapChanged();
        labelMapChanged();
    }

    /* Children
     * ****************************************************************************************/
    tickmark: Rectangle {
        implicitWidth: outerRadius * 0.02
        antialiasing: true
        implicitHeight: outerRadius * 0.06
        color: majorTickmarkMap[theme]
        visible: true
    }

    //! Minor Tickmars
    minorTickmark: Rectangle {
        implicitWidth: outerRadius * 0.01
        antialiasing: true
        implicitHeight: outerRadius * 0.03
        color: minorTickmarkMap[theme]
        visible: true
    }

    background: Rectangle {
        implicitHeight: parent.height
        implicitWidth: parent.width
        color: backgroundMap[theme]
        anchors.centerIn: parent
        radius: width / 2
    }
    Loader {
        id: backgroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: background
    }

    needle : Item {
        implicitWidth: 0.08 * outerRadius
        implicitHeight: 0.9 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/needle.png"
        }
    }

    needleKnob : Item {
        implicitWidth: 0.05 * outerRadius
        implicitHeight: 0.05 * outerRadius
        Image {
            source: "qrc:/RoniaKit/resources/Images/gauge/knob.png"
            anchors.centerIn: parent
        }
    }

    //! Major TickMark Loader
    Loader {
        id: majorTickLoader
        active: rangeControl.majorTickVisible
        width: control.majorInsetRadius * 2
        height: control.majorInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: tickmarkRepeater
            property real p: Math.abs(rangeControl.endAngle  - rangeControl.startAngle)
                             / (tickmarkRepeater.model - 1)
            model: rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: tickmarkLoader
                x: control.majorInsetRadius
                y: control.majorInsetRadius
                sourceComponent: control.tickmark
                transform: [
                    Rotation{
                        angle: (rangeControl.startAngle + 360 + (index * p) )
                    },
                    Translate {
                        x: Math.sin((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius * -1
                        y: Math.cos((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius
                    }
                ]
            }
        }
    }

    //! Minor TickMark Loader
    Loader {
        active: rangeControl.minorTickVisible
        width: control.minorInsetRadius * 2
        height: control.minorInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: minortickmarkRepeater
            property real p: Math.abs(rangeControl.endAngle  - rangeControl.startAngle)
                             / (minortickmarkRepeater.model - 1)
            model: (rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: minorTickmarkLoader
                x: control.minorInsetRadius
                y: control.minorInsetRadius
                visible: !(index%(control.rangeControl.minorTickCount+1)===0)
                sourceComponent: control.minorTickmark
                transform: [
                    Rotation{
                        angle: (rangeControl.startAngle + 360 + (index * p))
                    },
                    Translate {
                        x: Math.sin((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.minorInsetRadius * -1
                        y: Math.cos((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.minorInsetRadius
                    }
                ]
            }
        }
    }

    //! Label Loader
    Loader {
        active: rangeControl.labelVisible
        width: control.labelInsetRadius * 2
        height: control.labelInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: labelRepeater
            property real p: Math.abs(rangeControl.endAngle  - rangeControl.startAngle)
                             / (labelRepeater.model - 1)
            model: rangeControl.majorTickCount
            anchors.fill: parent

            delegate: Loader {
                id: labelLoader
                x: control.labelInsetRadius
                y: control.labelInsetRadius

                sourceComponent: Text {
                    font.pixelSize: Math.max(6, 0.12 * outerRadius)
                    text: Math.round((rangeControl.maximumValue
                                      - rangeControl.minimumValue)
                                      / (rangeControl.majorTickCount - 1)
                                      * index + rangeControl.minimumValue)
                    color: labelMap[theme] ?? "white"
                    antialiasing: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                transform: [
                    Rotation{
                        angle: (rangeControl.startAngle - 3 + 360 + (index * p))
                    },
                    Translate {
                        x: Math.sin((rangeControl.startAngle - 3 + 180 + index * p)
                                    * (Math.PI/180)) * control.labelInsetRadius * -1
                        y: Math.cos((rangeControl.startAngle - 3 + 180 + index * p )
                                    * (Math.PI/180)) * control.labelInsetRadius
                    }
                ]
            }
        }
    }

    //! Digital Value
    Text {
        id: valueText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/2 - 5*Math.min(parent.height,parent.width)/16
        text: parseFloat(control.value.toFixed(rangeControl.decimalPoint))
        font.family: webFont.name
        font.pixelSize: outerRadius * 0.2
        color: labelMap[theme]
        visible: digitalValueVisibility

        ColorAnimation on color {
            id: blinkAnimation
            from: "white"
            to: "red"
            duration: 1000
            easing.type: Easing.OutQuad
            loops: Animation.Infinite
            running: (value > rangeControl.maximumValue || value < rangeControl.minimumValue)
            onStopped: valueText.color = labelMap[theme]
        }
    }

    //! Needle Loader
    Loader {
        id: needleLoader
        sourceComponent: control.needle
        transform: [
            Rotation {
                angle: needleRotation
                origin.x: needleLoader.width / 2
                origin.y: needleLoader.height
            },
            Translate {
                x: control.width / 2 - needleLoader.width / 2
                y: control.height / 2 - needleLoader.height
            }
        ]
    }

    //! Needle Knob
    Loader {
        sourceComponent: needleKnob
        anchors.fill: parent
    }

    //! Foreground loader
    Loader {
        id: foregroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: foreground
    }

}
