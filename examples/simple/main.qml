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

    Grid{
        id: gaugeGrid
        columns: 3
        spacing: 2

        CircularGaugeSpeed {
            id: gauge
            width: 200
            height: 300
            value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
            rangeControl: CircularRangeControl{
                labelInset: sliderForlabelInset.value + 35
                majorTickCount: 7
            }
        }

        AnalogGauge {
            id: gauge1
            width: 200
            height: 300
            value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
            rangeControl: CircularRangeControl{
                labelInset: sliderForlabelInset.value
            }
        }

        CircularGaugeModern {
            width: 400
            height: 500
            value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
            rangeControl: CircularRangeControl{
                majorTickCount: sliderForMajorTickCount.value
                minorTickCount: sliderForMinorTickCount.value
                tickmarkInset: sliderForMajorInset.value
                minorTickmarkInset: sliderForMinorInset.value
                labelInset: sliderForlabelInset.value
                startAngle: sliderForStartAngle.value
                endAngle: sliderForEndAngle.value
            }
        }

        CircularGauge {
            id:simpleGauge
            width: 400
            height: 500
            value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
            rangeControl: CircularRangeControl{
                majorTickCount: sliderForMajorTickCount.value
                minorTickCount: sliderForMinorTickCount.value
                tickmarkInset: sliderForMajorInset.value
                minorTickmarkInset: sliderForMinorInset.value
                labelInset: sliderForlabelInset.value
                startAngle: sliderForStartAngle.value
                endAngle: sliderForEndAngle.value
            }
        }
        ModernGauge2 {
            width: 400
            height: 500
            value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
            rangeControl: CircularRangeControl{
                majorTickCount: sliderForMajorTickCount.value
                minorTickCount: sliderForMinorTickCount.value
                tickmarkInset: sliderForMajorInset.value
                minorTickmarkInset: sliderForMinorInset.value
                labelInset: sliderForlabelInset.value
            }
        }
    }

    Slider {
        id: sliderForValue
        anchors.bottom: parent.bottom
        anchors.left: gaugeGrid.right
        width: 300
        from: 70
        to: 150
        Text{ text: "Value Count" }
        value: 70
    }
    Slider {
        id: sliderForMajorTickCount
        anchors.bottom: sliderForValue.top
        width: 300
        anchors.left: gaugeGrid.right
        from: 3
        to: 10
        Text{ text: "Major Tick Count" }
        value: 6
    }

    Slider {
        id: sliderForMinorTickCount
        anchors.bottom: sliderForMajorTickCount.top
        width: 300
        anchors.left: gaugeGrid.right
        from: 0
        to: 10
        Text{ text: "Minor Tick Count" }
        value: 3

    }
    Slider {
        id: sliderForMinorInset
        anchors.bottom: sliderForMinorTickCount.top
        width: 300
        anchors.left: gaugeGrid.right
        from: 20
        to: 80
        Text{ text: "Minor Inset" }
    }
    Slider {
        id: sliderForMajorInset
        anchors.bottom: sliderForMinorInset.top
        width: 300
        anchors.left: gaugeGrid.right
        from: 20
        to: 80
        Text{ text: "Major Inset" }
    }
    Slider {
        id: sliderForlabelInset
        anchors.bottom: sliderForMajorInset.top
        width: 300
        anchors.left: gaugeGrid.right
        from: 30
        to: 80
        Text{ text: "label Inset" }
    }
    Slider {
        id: sliderForStartAngle
        anchors.bottom: sliderForlabelInset.top
        width: 300
        anchors.left: gaugeGrid.right
        from: -180
        to: 0
        Text{ text: "Start Angle" }
        value: -135
    }
    Slider {
        id: sliderForEndAngle
        anchors.bottom: sliderForStartAngle.top
        width: 300
        anchors.left: gaugeGrid.right
        from: 0
        to: 180
        Text{ text: "End Angle" }
        value: 135
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
