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
import QtQuick.Shapes

/*! ***********************************************************************************************
 * Circular Thermometer Style
 * ************************************************************************************************/
RoniaControlStyle {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property real                 minorInsetRadius:        outerRadius - rangeControl.minorTickmarkInset

    property real                 majorInsetRadius:        outerRadius - rangeControl.tickmarkInset

    property real                 labelInsetRadius:        outerRadius - rangeControl.labelInset

    property bool                 digitalValueVisibility : true

    property real needleRotation: {
        var percentage = (control._value - rangeControl.minimumValue) /
                         ( rangeControl.maximumValue -  rangeControl.minimumValue);
        rangeControl.startAngle + percentage *
                Math.abs(rangeControl.endAngle -  rangeControl.startAngle);
    }

    /* Object Properties
     * ****************************************************************************************/
    width: 250
    height: 250
    backgroundMap:      {0: "#dddddd"   , 1: "white"}
    labelMap:           {0: "black"     , 1: "white"}
    majorTickmarkMap:   {0: "#c8d0d0"   , 1: "#e5e5e5"}
    minorTickmarkMap:   {0: "#c8d0d0"   , 1: "#e5e5e5"}
    needleMap:          {0: "qrc:/RoniaKit/resources/Images/gauge/redNeedle3.png",
                         1: "qrc:/RoniaKit/resources/Images/gauge/redNeedle2.png"}
    needleKnobMap:      {0: "#ff6861"   , 1: "#ff2c2c"}

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

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
        property real value: control.value
        property var drawPoint: null
        property real startA: control.rangeControl.startAngle
        property real endA: control.rangeControl.endAngle
        implicitHeight: parent.height
        implicitWidth: parent.width
        color: "transparent"
        anchors.centerIn: parent
        radius: width / 2
        onDrawPointChanged: canvas.requestPaint()
        onValueChanged: {
            drawPoint = !drawPoint
        }
        onStartAChanged: {
            drawPoint = !drawPoint
        }
        onEndAChanged: {
            drawPoint = !drawPoint
        }
        Canvas {
            id: canvas
            property real greenStart:(360+(control.rangeControl.startAngle-90))*Math.PI/180
            property real greenEnd:  (control.value>=control.rangeControl.minimumValue) ? (greenStart + ((((control.rangeControl.endAngle-control.rangeControl.startAngle)
                                                  /(control.rangeControl.maximumValue-control.rangeControl.minimumValue)) * (control.value))*Math.PI/180))
                                                        : (greenStart + ((((control.rangeControl.endAngle-control.rangeControl.startAngle)
                                                                           /(control.rangeControl.maximumValue-control.rangeControl.minimumValue)) * (0))*Math.PI/180))
            property real whiteEnd: ((control.rangeControl.endAngle-90) * Math.PI/180)
            height: parent.height
            width: parent.width

            onPaint: {
                var ctx = getContext("2d");
                ctx.clearRect(0, 0, width, height);

                ctx.lineWidth = 2
                ctx.beginPath();
                ctx.strokeStyle = "green";
                ctx.arc(width/2, height/2, width/2-2, greenStart,
                        greenEnd+Math.PI*0.05/180, false);
                ctx.stroke();

                ctx.beginPath();
                ctx.strokeStyle = majorTickmarkMap[theme];
                ctx.arc(width/2, height/2, width/2-2, greenEnd+Math.PI*0.05/180, whiteEnd);
                ctx.stroke();
            }
        }

        Rectangle {
            implicitHeight: parent.height/2
            implicitWidth: parent.width/2
            color: "transparent"
            anchors.centerIn: parent
            radius: width / 2
            border.color: backgroundMap[theme]
            border.width: 1

            Rectangle {
                id: filledCircle
                anchors.centerIn: parent
                width: parent.width * 0.7
                height: parent.width * 0.7
                radius: parent.width/2
                color: backgroundMap[theme]

                //! \todo: encapsulate the label component
                Text {
                    id: speedLabel
                    font.family: webFont.name
                    anchors.centerIn: parent
                    text: control.value.toFixed(0) + " C";
                    color: "grey"
                    font.pixelSize: parent.width * 0.4;
                    antialiasing: true
                    Behavior on color {ColorAnimation {duration: 200}}

                    ColorAnimation on color {
                        id: blinkAnimation
                        from: "grey"
                        to: "red"
                        duration: 1000
                        easing.type: Easing.OutQuad
                        loops: Animation.Infinite
                        running: (value > rangeControl.maximumValue || value < rangeControl.minimumValue)
                        onStopped: speedLabel.color = "grey"
                    }
                }
            }
        }
    }

    Loader {
        id: backgroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: background
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

    //! Lablel Loader
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
                    font.pixelSize: Math.max(6, 0.1 * outerRadius)
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

    //! Foreground loader
    Loader {
        id: foregroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: foreground
    }


}
