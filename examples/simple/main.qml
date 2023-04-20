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
import QtQuick.Layouts

Window {

    id: window
    width: 1680
    height: 960
    visible: true
    title: qsTr("Simple RoniaKit Example")
    color: "#3E3E3E"

    Material.theme: Material.Dark
    Material.accent: Material.BlueGrey


    /* Issues: 1- components don't disappear once they're made, we need to make it so that when a new gauge is clicked, previous gauges automatically
     * get deleted from the main screen
     * 2- rangeControl bindings are not done
    */
    property CircularBasicGauge circularBasicGauge0: CircularBasicGauge{
        id: circularBasicGauge
        width: 180
        height:180
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
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var circularBasicGauge3 = Qt.createQmlObject('import QtQuick; import RoniaKit; CircularBasicGauge {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(circularBasicGauge0,circularBasicGauge3)
            }
        }

    }
    property CircularGauge circularGauge0: CircularGauge {
        id: circularGauge
        width: 180
        height:180
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
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var circularGauge3 = Qt.createQmlObject('import QtQuick; import RoniaKit; CircularGauge {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(circularGauge0,circularGauge3)
            }
        }
    }
    property CircularModernGauge1 circularModernGauge10: CircularModernGauge1 {
        id: modernGauge1
        width: 180
        height:180
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
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var circularModernGauge13 = Qt.createQmlObject('import QtQuick; import RoniaKit; CircularModernGauge1 {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(circularModernGauge10,circularModernGauge13)
            }
        }
    }

    property CircularSpeedGauge circularSpeedGauge0: CircularSpeedGauge {
        width: 180
        height:180
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
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var circularSpeedGauge3 = Qt.createQmlObject('import QtQuick; import RoniaKit; CircularSpeedGauge {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(circularSpeedGauge0,circularSpeedGauge3)
            }
        }
    }

    property CircularAnalogGauge circularAnalogGauge0: CircularAnalogGauge {
        width: 180
        height: 180
        value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
        theme: RoniaControl.Theme.Dark
        rangeControl: CircularRangeControl{
            labelInset: sliderForlabelInset.value
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var circularAnalogGauge3 = Qt.createQmlObject('import QtQuick; import RoniaKit; CircularAnalogGauge {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(circularAnalogGauge0,circularAnalogGauge3)
            }
        }
    }

    property CircularModernGauge2 circularModernGauge20: CircularModernGauge2 {
        width: 180
        height: 180
        value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
        theme: RoniaControl.Theme.Dark
        rangeControl: CircularRangeControl{
            majorTickCount: sliderForMajorTickCount.value
            minorTickCount: sliderForMinorTickCount.value
            tickmarkInset: sliderForMajorInset.value
            minorTickmarkInset: sliderForMinorInset.value
            labelInset: sliderForlabelInset.value
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var circularModernGauge23 = Qt.createQmlObject('import QtQuick; import RoniaKit; CircularModernGauge2 {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(circularModernGauge20,circularModernGauge23)
            }
        }
    }
    property LevelGauge levelGauge0: LevelGauge {
        id: levelGauge
        value: boundControl(sliderForValue.value,rangeControl.minimumValue,rangeControl.maximumValue)
        width: 80
        height: 180
        theme: RoniaControl.Theme.Dark
        rangeControl {
//            minimumValue: sliderForMinVal.value
//            maximumValue: sliderForMaxVal.value
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var levelGauge3 = Qt.createQmlObject('import QtQuick; import RoniaKit; LevelGauge {
                anchors.centerIn: parent
                width: 500
                height:500}', item3Rect);
                binder(levelGauge0,levelGauge3)
            }
        }
    }

    property var model1 : [circularBasicGauge0,circularGauge0,circularModernGauge10,circularSpeedGauge0,circularAnalogGauge0
        ,circularModernGauge20, levelGauge0]




    Item {
        id: settings
        property string sliderTextColor: "#A9A9A9"
        Rectangle {
            id: item1Rect
            anchors.fill: parent
            color: "#2e2f30"
        }
        anchors.right: parent.right
        anchors.top: parent.top
        width: parent.width / 8
        height: parent.height
        Flickable {
            width: parent.width
            height: parent.height * 0.8
            anchors.right: parent.right
            anchors.top: parent.top
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20

                Slider {
                    id: sliderForValue
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 0
                    to: 300
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "Value Count"
                    }
                    value: 70
                }
                Slider {
                    id: sliderForMajorTickCount
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 3
                    to: 10
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "Major Tick Count"
                    }
                    value: 6
                }

                Slider {
                    id: sliderForMinorTickCount
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 0
                    to: 10
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "Minor Tick Count"
                    }
                    value: 3

                }
                Slider {
                    id: sliderForMinorInset
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 20
                    to: 80
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "Minor Inset"
                    }
                }
                Slider {
                    id: sliderForMajorInset
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 20
                    to: 80
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "Major Inset"
                    }
                }
                Slider {
                    id: sliderForlabelInset
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 30
                    to: 80
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "label Inset"
                    }
                }
                Slider {
                    id: sliderForStartAngle
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: -180
                    to: 0
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "Start Angle"
                    }
                    value: -135
                }
                Slider {
                    id: sliderForEndAngle
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    from: 0
                    to: 180
                    Text{
                        anchors.left: parent.left
                        anchors.bottom: parent.top
                        anchors.leftMargin: 5
                        color: settings.sliderTextColor
                        text: "End Angle"
                    }
                    value: 135
                }
//                Slider {
//                    id: sliderForMinVal
//                    implicitWidth: parent.width * 0.8
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    from: 0
//                    to: 180
//                    Text{
//                        anchors.left: parent.left
//                        anchors.bottom: parent.top
//                        anchors.leftMargin: 5
//                        color: settings.sliderTextColor
//                        text: "Min val"
//                    }
//                    value: 70
//                }
//                Slider {
//                    id: sliderForMaxVal
//                    implicitWidth: parent.width * 0.8
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    from: 50
//                    to: 200
//                    Text{
//                        anchors.left: parent.left
//                        anchors.bottom: parent.top
//                        anchors.leftMargin: 5
//                        color: settings.sliderTextColor
//                        text: "Max Val"
//                    }
//                    value: 150
//                }

                Item {
                    implicitWidth: parent.width * 0.8
                    Layout.alignment: Qt.AlignHCenter
                    Text {
                        id: switchText
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: settings.sliderTextColor
                        text: "Theme: "
                    }
                    Switch {
                        implicitWidth: parent.width * 0.6
                        anchors.right: parent.right
                        anchors.verticalCenter: switchText.verticalCenter
                        onToggled: {
                            circularBasicGauge.theme = !circularBasicGauge.theme
                            circularGauge.theme = !circularGauge.theme
                            levelGauge.theme = !levelGauge.theme
                            if(checked){
                                window.Material.theme = Material.Light
                                window.Material.accent = Material.Indigo
                                settings.sliderTextColor = "#3F51B5"
                                item1Rect.color = "#C0C0C0"
                                item2Rect.color = "#E8E8E8"
                                window.color = "#F0F0F0"
                            }
                            else {
                                window.Material.theme = Material.Dark
                                window.Material.accent = Material.BlueGrey
                                settings.sliderTextColor = "#A9A9A9"
                                item1Rect.color = "#2e2f30"
                                item2Rect.color = "#303030"
                                window.color = "#3E3E3E"
                            }

                        }

                    }

                }



            }


        }


    }

    Item {
        id: gaugePreview
        Rectangle {
            id: item2Rect
            anchors.fill: parent
            color: "#303030"
        }
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: settings.left
        height: parent.height / 5
        Flickable {
            anchors.fill: parent
            RowLayout {
                id: rowLayout
                anchors.fill: parent
                anchors.margins: 20
                ListView {
                    model: window.model1
                    delegate: Rectangle {
                        color: "transparent"
                        Component.onCompleted: {
                            modelData.parent = rowLayout
                        }
                    }
                }
            }
        }
    }

    Item {
        id: item3Rect
        anchors.right: settings.left
        anchors.bottom: gaugePreview.top
        width: 7 * parent.width / 8
        height: parent.height * 0.8
    }

    function boundControl(value,minimum,maximum){
        if(value > maximum)
            return maximum
        else if(value < minimum)
            return minimum
        else
            return value
    }
    function boundControlForMin(value,minimum){
        if(value < minimum)
            return value
        else
            return minimum
    }
    function boundControlForMax(value,maximum){
        if(value > maximum)
            return value
        else
            return maximum
    }
    function binder (binder, bindee){
        bindee.value = Qt.binding(function() { return binder.value})
        bindee.theme = Qt.binding(function() { return binder.theme})
    }

}
