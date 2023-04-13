/*
 * Project: RoniaKit
 * Version: 0.0.1
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

import QtQuick
import QtQuick.Controls

/*! ***********************************************************************************************
 * Base Circular Gauge
 * ************************************************************************************************/
RoniaControl {
    id: control

    /* Property Declarations
     * ****************************************************************************************/

    property CircularRangeControl circularRangeControl: CircularRangeControl {}

    /*! The distance from the center of the gauge to the outer edge of the
        gauge.

        This property is useful for determining the size of the various
        components of the style, in order to ensure that they are scaled
        proportionately when the gauge is resized. */
    readonly property real outerRadius: Math.min(control.width, control.height) * 0.5

    //! This property holds the rotation of the needle in degrees.
    property real needleRotation: {
        var percentage = (control.value - rangeControl.minimumValue) /
                         ( rangeControl.maximumValue -  rangeControl.minimumValue);
        rangeControl.startAngle + percentage *
                Math.abs(rangeControl.endAngle -  rangeControl.startAngle);
    }

    property real minorInsetRadius: outerRadius - rangeControl.minorTickmarkInset

    property real majorInsetRadius: outerRadius - rangeControl.tickmarkInset

    property real labelInsetRadius: outerRadius - rangeControl.labelInset

    property bool digitalValueVisibility : true

    /* Object Properties
     * ****************************************************************************************/
    rangeControl: circularRangeControl
    width: 250
    height: 250

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    Behavior on value {
        NumberAnimation {
            easing.overshoot: 1.2
            duration: 800
            easing.type: Easing.OutBack
        }
    }

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: parent.height
        implicitWidth: parent.width
        color: "#1e1e1e"
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

//    tickmarkLabel: Text{
//        text: labelLoader.index
//    }

    needleKnob : Item {
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

                sourceComponent: Text{
                    font.pixelSize: Math.max(6, 0.12 * outerRadius)
                    text: Math.round((rangeControl.maximumValue
                                      - rangeControl.minimumValue)
                                      / (rangeControl.majorTickCount - 1)
                                      * index + rangeControl.minimumValue)
                    color: "#c8c8c8"
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
    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        anchors.bottomMargin: parent.height/2 - 5*Math.min(parent.height,parent.width)/16
        text: parseFloat(control.value.toFixed(rangeControl.decimalPoint))
        font.family: webFont.name
        font.pixelSize: outerRadius * 0.2
        color: "white"
        visible: digitalValueVisibility
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
    Loader {
        id: foregroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: foreground
    }

    /* Functions
     * ****************************************************************************************/

}
