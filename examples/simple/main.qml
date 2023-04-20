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

import QtQuick
import RoniaKit
import QtQuick.Controls
import QtQuick.Controls.Material

Window {

    id: window
    width: 1680
    height: 960
    visible: true
    title: qsTr("Simple RoniaKit Example")
    color: "#3E3E3E"

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    Item {
        id: leftHalf
        width: parent.width / 2 - 2
        height: parent.height * 0.8
        anchors.top: parent.top
        anchors.right: middleLine.left
        anchors.left: parent.left

        Rectangle {
            id: textRec1
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            color: "transparent"
            border.color: "white"
            border.width: 2
            Text {
                anchors.centerIn: parent
                text: "Light"
                font.pixelSize: 15
                color: "white"
            }
        }
        Grid {
            id: lightGauge
            anchors.top: textRec1.bottom
            columns: 3
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            LevelGauge {
                id: levelgauge
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                width: 100
                height: 200
                theme: RoniaControl.Theme.Light
                rangeControl {
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularGauge {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Light
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularBasicGauge {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Light
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularModernGauge1 {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularSpeedGauge {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularAnalogGauge {
                width: 200
                height: 200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    labelInset: sliderForlabelInset.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularModernGauge2 {
                width: 200
                height: 200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

        }
    }


    Rectangle {
        id: middleLine
        width: 4
        height: parent.height * 0.8
        anchors.right: rightHalf.left
        anchors.top: parent.top

        color: "white"
    }

    Item {
        id: rightHalf
        width: parent.width / 2 - 2
        height: parent.height * 0.8
        anchors.top: parent.top
        anchors.right: parent.right
        Rectangle  {
            id: textRec2
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            color: "transparent"
            border.color: "white"
            border.width: 2
            Text {
                anchors.centerIn: parent
                text: "Dark"
                font.pixelSize: 15
                color: "white"
            }
        }
        Grid {
            id: darkGauge
            anchors.top: textRec2.bottom
            columns: 3
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            LevelGauge{
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                width: 100
                height: 200
                theme: RoniaControl.Theme.Dark
                rangeControl {
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }
            CircularGauge {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularBasicGauge {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularModernGauge1 {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularSpeedGauge {
                width: 200
                height:200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    startAngle: sliderForStartAngle.value
                    endAngle: sliderForEndAngle.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

            CircularAnalogGauge {
                width: 200
                height: 200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    labelInset: sliderForlabelInset.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }
            CircularModernGauge2 {
                width: 200
                height: 200
                value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
                theme: RoniaControl.Theme.Dark
                rangeControl: CircularRangeControl{
                    majorTickCount: sliderForMajorTickCount.value
                    minorTickCount: sliderForMinorTickCount.value
                    tickmarkInset: sliderForMajorInset.value
                    minorTickmarkInset: sliderForMinorInset.value
                    labelInset: sliderForlabelInset.value
                    minimumValue: sliderForMinVal.value
                    maximumValue: sliderForMaxVal.value
                }
            }

        }
    }


    Grid {
        id: slideGrid

        columns: 3
        spacing: 2

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: middleLine.bottom
        Slider {
            id: sliderForValue
            width: 300
            from: 0
            to: 300
            Text{ text: "Value Count" }
            value: 70
        }
        Slider {
            id: sliderForMajorTickCount
            width: 300
            from: 3
            to: 10
            Text{ text: "Major Tick Count" }
            value: 6
        }

        Slider {
            id: sliderForMinorTickCount
            width: 300
            from: 0
            to: 10
            Text{ text: "Minor Tick Count" }
            value: 3

        }
        Slider {
            id: sliderForMinorInset
            width: 300
            from: 20
            to: 80
            Text{ text: "Minor Inset" }
        }
        Slider {
            id: sliderForMajorInset
            width: 300
            from: 20
            to: 80
            Text{ text: "Major Inset" }
        }
        Slider {
            id: sliderForlabelInset
            width: 300
            from: 30
            to: 80
            Text{ text: "label Inset" }
        }
        Slider {
            id: sliderForStartAngle
            width: 300
            from: -180
            to: 0
            Text{ text: "Start Angle" }
            value: -135
        }
        Slider {
            id: sliderForEndAngle
            width: 300
            from: 0
            to: 180
            Text{ text: "End Angle" }
            value: 135
        }
        Slider {
            id: sliderForMinVal
            width: 300
            from: 0
            to: 180
            Text{ text: "Min val" }
            value: 70
        }
        Slider {
            id: sliderForMaxVal
            width: 300
            from: 50
            to: 200
            Text{ text: "Max Val" }
            value: 150
        }

    }

    function boundControl(value,minimum,maximum){
        if(value > maximum)
            return maximum
        else if(value < minimum)
            return minimum
        else
            return value
    }
}
