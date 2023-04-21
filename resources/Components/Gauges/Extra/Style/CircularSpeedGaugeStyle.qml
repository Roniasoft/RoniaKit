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
 * Circular Speed Gauge Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property string name;

    /* Object Properties
     * ****************************************************************************************/

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    Component.onCompleted: {
        rangeControl.minorTickVisible = false
        rangeControl.majorTickVisible = false
        rangeControl.labelVisible = false
        theme = RoniaControl.Theme.Dark
    }

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: control.outerRadius * 2
        implicitWidth: control.outerRadius * 2
        color: "transparent"
        anchors.centerIn: parent
        radius: width / 2

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/Speed/backOn.png"
            asynchronous: true
            sourceSize {
                width: width
            }
        }
    }

    //! Gauge Name
    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/2 - 4*Math.min(parent.height,parent.width)/16
        text: control.name
        font.family: webFont.name
        font.pixelSize: outerRadius * 0.15
        color: "white"
    }

    //! Needle
    needle: Item {
        implicitWidth: 0.15 * outerRadius
        implicitHeight: 0.8 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/Speed/needle-on.png"
        }
    }    

}

