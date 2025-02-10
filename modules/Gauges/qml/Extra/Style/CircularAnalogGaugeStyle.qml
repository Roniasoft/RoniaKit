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
 * Circular Analog Gauge Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/assets/fonts/fontsFree-Net-DS-DIGI-1.ttf" }

    Component.onCompleted: {
        rangeControl.minorTickVisible = false
        rangeControl.majorTickVisible = false
        rangeControl.labelVisible = false
        theme = RoniaControl.Theme.Dark
    }

    /* Object Properties
     * ****************************************************************************************/
    needleKnob: null
    needle: null
    digitalValueVisibility: false

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: control.height
        implicitWidth: control.width
        color: "transparent"
        anchors.centerIn: parent
        radius: 360
        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/Gauges/assets/images/analougeGauge/backScreen.svg";
            asynchronous: true
            smooth: true;
            antialiasing: true;
            sourceSize {
                width: width
            }
        }
        Image {
            id: outerRingImg;
            source: "qrc:/RoniaKit/Gauges/assets/images/analougeGauge/outerRing.svg";
            anchors.centerIn: parent
            antialiasing: true
            anchors.fill: parent;
        }
        Image {
            id: middleRingImg;
            source: "qrc:/RoniaKit/Gauges/assets/images/analougeGauge/middleRing.svg";
            anchors.centerIn: parent
            antialiasing: true
            anchors.fill: parent;
        }
        Image {
            id: innerRingImg;
            source: "qrc:/RoniaKit/Gauges/assets/images/analougeGauge/innerRing.svg";
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
                ctx.strokeStyle = "#05053c";
                ctx.lineWidth = outerRadius * 0.1
                ctx.arc(outerRadius,
                      outerRadius,
                      outerRadius*0.644 - ctx.lineWidth / 2,
                      degreesToRadians(valueToAngle(control.value-control.rangeControl.minimumValue) - 215.0),
                      degreesToRadians(valueToAngle(rangeControl.maximumValue-control.rangeControl.minimumValue) - 208.0 ));
                ctx.stroke();
            }
        }
    }

    foreground: Item {
        id: foregroundItem1;
        Image {
            id: needleCntr;
            source: "qrc:/RoniaKit/Gauges/assets/images/analougeGauge/topScreen.svg";
            anchors.fill: parent;
            antialiasing: true
        }
        Text {
            id: speedLabelBack
            font.family: webFont.name
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.horizontalCenterOffset: 0;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.verticalCenterOffset: 0;
            text: "888"
            color: "#3d62f4";
            font.pixelSize: outerRadius * 0.35;
            antialiasing: true
            opacity: 0.1
        }
        Text {
            id: speedLabel
            font.family: webFont.name
            anchors.left: speedLabelBack.left
            anchors.verticalCenter: speedLabelBack.verticalCenter
            text: control.value.toFixed(0);
            color: control.value > ((rangeControl.maximumValue-rangeControl.minimumValue) * 4 / 5)
                   ? "#ff5151" : "#3d62f4";
            font.pixelSize: outerRadius * 0.4;
            antialiasing: true
            Behavior on color {ColorAnimation {duration: 200}}
        }
    }

    /* Functions
     * ****************************************************************************************/
    function valueToAngle (value1){
        return value1 * 260.0 /
               Math.abs(rangeControl.maximumValue-rangeControl.minimumValue)
    }

}

