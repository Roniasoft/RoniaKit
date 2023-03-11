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
        columns: 2
        spacing: 2

        CircularGaugeSpeed {
            id: gauge
            width: 400
            height: 500
            value: sliderForValue.value
            rangeControl: CircularRangeControl{
                labelInset: sliderForlabelInset.value + 35
                majorTickCount: 7
            }
        }

        AnalogGauge{
            id: gauge1
            width: 400
            height: 500
            value: sliderForValue.value
            rangeControl: CircularRangeControl{
                labelInset: sliderForlabelInset.value
            }
        }

        CircularGaugeModern {
            width: 400
            height: 500
            x: 500
            value: sliderForValue.value
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
            x: 1000
            value: sliderForValue.value
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
    }

    Slider {
        id: sliderForValue
        anchors.bottom: parent.bottom
        anchors.left: gaugeGrid.right
        width: 300
        from: 0
        to: 200
        Text{ text: "Value Count" }
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


}
