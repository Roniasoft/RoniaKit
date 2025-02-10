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

import RoniaKit.Gauges

import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Shapes 1.8


/*! ***********************************************************************************************
 * Fuel Gauge Style
 * ************************************************************************************************/
RoniaControlStyle
{
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property RangeControl         rangeControl

    property real                 majorInsetRadius:        outerRadius / 1.95 - rangeControl.tickmarkInset

    property bool                 digitalValueVisibility:  true

    property int                  chunksCount:              24

    property double               chunksInnerRadius:        outerRadius * 0.5

    property double               chunksOuterRadius:        outerRadius * 0.69

    property double               chunksSweepedAngel:       9.9

    property double               angelBetweenChunks:       1.2

    property double               chunksStartAngel:         -222.5

    property double               chunksEndAngel:           43.15


    /* Object Properties
     * ****************************************************************************************/
    width: 250
    height: 250

    /* Children
     * ****************************************************************************************/

    background: Item
    {
        Image
        {
            source: "qrc:/RoniaKit/Gauges/assets/images/fuel/back.png";
            anchors.fill: parent;
            antialiasing: true
            smooth: true
            asynchronous: true
        }

        Shape
        {
            id: chunksShape

            visible: true
            anchors.fill: parent
            smooth: true
            antialiasing: true
        }

        Component.onCompleted:
        {
            for(let i= 0; i < control.chunksCount; ++i)
                chunksShape.data.push(chunk.createObject(chunksShape, {"index": i}))
        }
    }

    property Component chunk: ShapePath
    {
        id: paths

        required property int index
        property double startAngel:  control.chunksStartAngel + index * (control.chunksSweepedAngel + control.angelBetweenChunks)
        property double startXCoord: control.outerRadius + 1 + control.chunksInnerRadius * Math.cos(degreesToRadians(360 + paths.startAngel))
        property double startYCoord: control.outerRadius + control.chunksInnerRadius * Math.sin(degreesToRadians(360 + paths.startAngel))

        property color color:
        {
            if(index >= 0 && index <= 2)
                return "#b32626";

            if(index >= 3 && index <= 5)
                return "#bda633";

            return "#45874b";
        }

        strokeWidth: 0
        strokeColor: "transparent"
        fillColor: control.value >= (control.rangeControl.maximumValue - control.rangeControl.minimumValue) * (index + 1) / control.chunksCount ? paths.color : "transparent"
        fillRule: ShapePath.OddEvenFill


        Behavior on fillColor
        {
            ColorAnimation
            {
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }

        startX: paths.startXCoord
        startY: paths.startYCoord

        PathArc
        {
            radiusX: control.chunksInnerRadius;
            radiusY: control.chunksInnerRadius;
            relativeX: control.chunksInnerRadius *
                       (Math.cos(degreesToRadians(360 + paths.startAngel + control.chunksSweepedAngel)) - Math.cos(degreesToRadians(360 + paths.startAngel)))
            relativeY: control.chunksInnerRadius *
                       (Math.sin(degreesToRadians(360 + paths.startAngel + control.chunksSweepedAngel)) - Math.sin(degreesToRadians(360 + paths.startAngel)))
        }

        PathLine
        {
            relativeX: (control.chunksOuterRadius - control.chunksInnerRadius) * Math.cos(degreesToRadians(360 + paths.startAngel + control.chunksSweepedAngel))
            relativeY: (control.chunksOuterRadius - control.chunksInnerRadius) * Math.sin(degreesToRadians(360 + paths.startAngel + control.chunksSweepedAngel))
        }

        PathArc
        {
            radiusX:   control.chunksOuterRadius
            radiusY:   control.chunksOuterRadius
            relativeX: control.chunksOuterRadius *
                       (Math.cos(degreesToRadians(360 + paths.startAngel)) - Math.cos(degreesToRadians(360 + paths.startAngel + control.chunksSweepedAngel)))
            relativeY: control.chunksOuterRadius *
                       (Math.sin(degreesToRadians(360 + paths.startAngel)) - Math.sin(degreesToRadians(360 + paths.startAngel + control.chunksSweepedAngel)))
            direction: PathArc.Counterclockwise
        }

       PathLine
        {
            x: paths.startXCoord
            y: paths.startYCoord
        }
    }

    Loader
    {
        id: backgroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: background
    }

    tickmark: Rectangle
    {
        implicitWidth: outerRadius * 0.02
        antialiasing: true
        smooth: true
        implicitHeight: outerRadius * 0.06
        color: "#e0e0e0"
        visible: true
    }

    //! Major TickMark Loader
    Loader
    {
        id: majorTickLoader

        active: rangeControl.majorTickVisible
        width: control.majorInsetRadius * 2
        height: control.majorInsetRadius * 2
        anchors.centerIn: parent

        property double majorTicksStartAngel: -133.55
        property double majorTicksEndAngel: 130.5

        sourceComponent: Repeater
        {
            id: tickmarkRepeater

            property real p: Math.abs(majorTickLoader.majorTicksEndAngel  - majorTickLoader.majorTicksStartAngel)
                             / (tickmarkRepeater.model - 1)

            model: 5
            anchors.fill: parent

            delegate: Loader
            {
                id: tickmarkLoader

                x: control.majorInsetRadius
                y: control.majorInsetRadius

                sourceComponent: control.tickmark

                transform:
                [
                    Rotation
                    {
                        angle: (majorTickLoader.majorTicksStartAngel + 360 + (index * p) )
                    },

                    Translate
                    {
                        x: Math.sin((majorTickLoader.majorTicksStartAngel + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius * -1

                        y: Math.cos((majorTickLoader.majorTicksStartAngel + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius
                    }
                ]
            }
        }
    }

    //! Fuel Station
    Image
    {
        id: station

        width: control.outerRadius / 4
        height: width

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 2 - 5 * Math.min(parent.height,parent.width) / 16
        antialiasing: true
        smooth: true
        source: stationSource()

        property bool blinking: false

        onBlinkingChanged:
        {
            if(blinking)
                stationTimer.start();

            else
            {
                stationTimer.stop();
                station.opacity = 1;
            }
        }

        Timer
        {
            id: stationTimer

            interval: 1000
            repeat: true

            onTriggered: station.opacity = 1 - station.opacity
        }

        Behavior on opacity
        {
            NumberAnimation
            {
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }

        function stationSource()
        {
            if(control.value >=0 && control.value <= (control.rangeControl.maximumValue - control.rangeControl.minimumValue) * 1.0 /6)
            {
                station.blinking = true;
                return "qrc:/RoniaKit/Gauges/assets/images/fuel/fuel-station-red.png";
            }

            else
                station.blinking = false;

            if(control.value < (control.rangeControl.maximumValue - control.rangeControl.minimumValue) * 7.0 / 24)
                return "qrc:/RoniaKit/Gauges/assets/images/fuel/fuel-station-yellow.png";

            return "qrc:/RoniaKit/Gauges/assets/images/fuel/fuel-station-green.png";
        }
    }

    /* Functions
     * ****************************************************************************************/
    function valueToAngle (value1)
    {
        return value1 * 260.0 /
               Math.abs(rangeControl.maximumValue-rangeControl.minimumValue)
    }

    function degreesToRadians(degrees)
    {
      return degrees * (Math.PI / 180.0);
    }
}
