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
import RoniaKit.Gauges

/*! ***********************************************************************************************
 * Circular Modern Gauge 2 Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    /* Object Properties
     * ****************************************************************************************/
    needleKnob: null
    theme: RoniaControl.Theme.Dark
    digitalValueVisibility: false

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/assets/fonts/fontsFree-Net-DS-DIGI-1.ttf" }


    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: control.outerRadius * 2
        implicitWidth: control.outerRadius * 2
        color: "#CCCCCC"
        anchors.centerIn: parent
        radius: width / 2

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/Gauges/assets/images/modern/back.png"
            asynchronous: true
            sourceSize {
                width: width
            }
        }

        Image {
            id: glowingCircle;
            source: "qrc:/RoniaKit/Gauges/assets/images/modern/blueLight.png";
            anchors.centerIn: parent
            antialiasing: true
            anchors.fill: parent;
        }
        Canvas {
            property int value: control.value
            anchors.fill: parent
            onValueChanged: {
                if(visible)
                    requestPaint();
            }
            function degreesToRadians(degrees) {
              return degrees * (Math.PI / 180.0);
            }
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.beginPath();
                ctx.strokeStyle = "#0d151b";
                ctx.lineWidth = outerRadius * 0.75
                ctx.arc(outerRadius,
                      outerRadius,
                      outerRadius*0.9 - ctx.lineWidth / 2,
                      degreesToRadians(valueToAngle(control.value-control.rangeControl.minimumValue)
                                       - control.rangeControl.startAngle *-1 - 92),
                      degreesToRadians(valueToAngle(control.rangeControl.maximumValue-control.rangeControl.minimumValue)
                                       - control.rangeControl.endAngle - 88));
                ctx.stroke();
            }
        }
    }

    needle: Item {
        implicitWidth: 0.15 * outerRadius
        implicitHeight: 0.8 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/Gauges/assets/images/modern/blueNeedle.png"
        }

    }

    foreground: Item {
        id: foregroundItem1;
        Rectangle{
            width: 3*outerRadius/4
            height: 3*outerRadius/4
            radius: width/2
            anchors.centerIn: parent
            color: "#0d151b"
            border.color: "#5f6975"
            border.width: 4
            Text{
                anchors.centerIn: parent
                text: parseFloat(control.value.toFixed(rangeControl.decimalPoint))
                font.family: webFont.name
                font.pixelSize: outerRadius * 0.2
                color: "white"
            }
        }
    }

    /* functions
     * ****************************************************************************************/
    function valueToAngle (value1){
        return value1 * Math.abs(control.rangeControl.endAngle - control.rangeControl.startAngle) /
               Math.abs(control.rangeControl.maximumValue-control.rangeControl.minimumValue)
    }
}

