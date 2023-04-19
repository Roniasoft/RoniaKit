import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Level Gauge Style
 * ************************************************************************************************/
RoniaControlStyle {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    required property RangeControl rangeControl;

    property          real         tickmarkSpacing: outerRadius/20

    property          real         labelSpacing:    3*outerRadius/14

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    Component.onCompleted: {
        backgroundMap["Light"] = "#dce2e2"
        backgroundMap["Dark"] = "white"
        labelMap["Light"] = "black"
        labelMap["Dark"] = "white"
        majorTickmarkMap["Dark"] = "#dce2e2"
        majorTickmarkMap["Light"] = "#cccccc"
        minorTickmarkMap["Dark"] = "#dce2e2"
        minorTickmarkMap["Light"] = "#cccccc"
        backgroundMapChanged();
        majorTickmarkMapChanged();
        minorTickmarkMapChanged();
        labelMapChanged();
    }

    /* Children
     * ****************************************************************************************/
    tickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            antialiasing: true
            implicitHeight: outerRadius * 0.06
            color: majorTickmarkMap[theme]
            visible: true
            radius: 5
        }

    minorTickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            antialiasing: true
            implicitHeight: outerRadius * 0.03
            color: minorTickmarkMap[theme]
            visible: true
            radius: 5
    }

    background: Rectangle {
        id: background
        height: parent.height
        width: parent.width
        color: "transparent"
        anchors.centerIn: parent

        property int startval: rangeControl.minimumValue
        property int endval: rangeControl.maximumValue
        property int sliderHeight: parent.height

       implicitHeight:  sliderHeight
       implicitWidth: slider.width
       Slider {
            id: slider
            stepSize: 1
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: tickmarkSpacing
            snapMode: Slider.SnapOnRelease
            height: background.sliderHeight
            from: background.startval
            to: background.endval
            orientation: Qt.Vertical
            value: control.value
            handle:  Rectangle {
                id: handleId
                x: (slider.width - width) / 2
                y:  slider.visualPosition * (slider.height - height)
                width: outerRadius/13
                height: outerRadius/13
                radius: outerRadius/13
                color: "green"
            }
            background: Rectangle {
                x: (slider.width - width) / 2
                width: outerRadius/40
                radius: outerRadius/40
                color: backgroundMap[theme]
                Rectangle {
                    id: innerRect
                    width: parent.width
                    height: slider.visualPosition * parent.height
                    color: "black"
                    border.color: backgroundMap[theme]
                    border.width: 1
                    radius: 5
                }
            }
        }

    }
    foreground: Rectangle {

        height: parent.height
        width: parent.width
        color: "transparent"
        anchors.centerIn: parent

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
        active: control.rangeControl.majorTickVisible
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: tickmarkRepeater
            model: control.rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: tickmarkLoader
                x: 0
                y: control.height/2 - outerRadius/25
                sourceComponent: control.tickmark
                transform: [
                    Rotation{
                        angle: 90
                    },
                    Translate {
                        y: index * -((control.height-outerRadius/15)/(control.rangeControl.majorTickCount-1))
                    }
                ]
            }
        }
    }

    Loader {
        active: rangeControl.minorTickVisible
        anchors.centerIn: parent
        sourceComponent: Repeater {
            id: minortickmarkRepeater
            model: (rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: minorTickmarkLoader
                x: 0
                y: control.height/2 - outerRadius/25
                visible: !(index%(control.rangeControl.minorTickCount+1)===0)
                sourceComponent: control.minorTickmark
                transform: [
                    Rotation{
                        angle: 90
                    },
                    Translate {
                        y: index * -((control.height-outerRadius/15)/
                                     ((rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount-1))
                    }
                ]
            }
        }
    }

    Loader {
        active: true //rangeControl.labelVisible
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: labelRepeater
            model: rangeControl.majorTickCount
            anchors.fill: parent

            delegate: Loader {
                id: labelLoader
                x: (labelSpacing - tickmarkSpacing)*-1
                y: control.height/2 - outerRadius/15

                sourceComponent: Text{
                    font.pixelSize: Math.max(6, 0.04 * control.outerRadius)
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
                    Translate {
                       y: index * -((control.height-outerRadius/15)/(control.rangeControl.majorTickCount-1))
                    }
                ]
            }
        }
    }
}