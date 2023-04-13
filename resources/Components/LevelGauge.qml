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
    id: root1

    /* Property Declarations
     * ****************************************************************************************/

    property RangeControl rangeControl

    /*! The distance from the center of the gauge to the outer edge of the
        gauge.

        This property is useful for determining the size of the various
        components of the style, in order to ensure that they are scaled
        proportionately when the gauge is resized. */


    readonly property real outerRadius: root1.width

    /* Object Properties
     * ****************************************************************************************/

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

    background: Rectangle {
        height: parent.height
        width: parent.width
        color: "transparent"
        anchors.centerIn: parent

    }
    foreground: Rectangle {
        id: root
        height: parent.height
        width: parent.width
        color: "transparent"
        anchors.centerIn: parent
         property int startval: 0
         property int endval: 0
         property int sliderHeight: parent.height/2.0

        implicitHeight:  sliderHeight
        implicitWidth: control.width + label.width
        Slider {
                id: control
                stepSize: 1
                anchors.centerIn: parent
                snapMode: Slider.SnapOnRelease
                height: root.sliderHeight
                from: root.startval
                to: root.endval
                orientation: Qt.Vertical
                handle: Rectangle {
                    id: handleId
                    x: (control.width - width) / 2
                    y:  control.visualPosition * (control.height - height)
                    width: 15
                    height: 15
                    radius: 15
                    color: "gray"
                }

                background: Rectangle {
                    x: (control.width - width) / 2
                    width: 4
                    radius: 2
                    color: "gray"

                    Rectangle {
                        width: parent.width
                        height: control.visualPosition * parent.height
                        color: "black"
                        radius: 2
                    }
                }
            }
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
        active: rangeControl.majorTickVisible
        width: root1.width
        height: root1.height
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: tickmarkRepeater

            model: rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: tickmarkLoader
                y: tickmarkRepeater.height
                       x: 250 / 2 + index * ((tickmarkRepeater.width - 250) / (tickmarkRepeater.count-1))
                sourceComponent: control.tickmark


            }
        }
    }
}
