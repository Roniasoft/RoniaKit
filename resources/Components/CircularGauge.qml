import QtQuick
import QtQuick.Controls

/*! ***********************************************************************************************
 * Base Circular Gauge
 * ************************************************************************************************/
RoniaControl {
    id: control



    /* Property Declarations
     * ****************************************************************************************/

    property CircularRangeControl circularRangeControl: CircularRangeControl {}

    /*! The distance from the center of the gauge to the outer edge of the
        gauge.

        This property is useful for determining the size of the various
        components of the style, in order to ensure that they are scaled
        proportionately when the gauge is resized. */
    readonly property real outerRadius: Math.min(control.width, control.height) * 0.5

    //! This property holds the rotation of the needle in degrees.
    property real needleRotation: {
        var percentage = (control.value - rangeControl.minimumValue) /
                         ( rangeControl.maximumValue -  rangeControl.minimumValue);
        rangeControl.startAngle + percentage *
                Math.abs(rangeControl.endAngle -  rangeControl.startAngle);
    }

    property real minorInsetRadius: outerRadius - rangeControl.minorTickmarkInset

    property real majorInsetRadius: outerRadius - rangeControl.tickmarkInset

    property real labelInsetRadius: outerRadius - rangeControl.labelInset

    /* Object Properties
     * ****************************************************************************************/
    rangeControl: circularRangeControl
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

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: parent.height
        implicitWidth: parent.width
        color: "#1e1e1e"
        anchors.centerIn: parent
        radius: width / 2
    }

    needle : Item {
        implicitWidth: 0.08 * outerRadius
        implicitHeight: 0.9 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/needle.png"
        }
    }

//    tickmarkLabel: Text{
//        text: labelLoader.index
//    }

    needleKnob : Item {
        Image {
            source: "qrc:/RoniaKit/resources/Images/gauge/knob.png"
            anchors.centerIn: parent
        }
    }


    //! Major TickMark Loader
    Loader {
        id: majorTickLoader
        active: rangeControl.majorTickVisible
        width: control.majorInsetRadius * 2
        height: control.majorInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: tickmarkRepeater
            property real p: Math.abs(rangeControl.endAngle  - rangeControl.startAngle)
                             / (tickmarkRepeater.model - 1)
            model: rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: tickmarkLoader
                x: control.majorInsetRadius
                y: control.majorInsetRadius
                sourceComponent: control.tickmark
                transform: [
                    Rotation{
                        angle: (rangeControl.startAngle + 360 + (index * p) )
                    },
                    Translate {
                        x: Math.sin((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius * -1
                        y: Math.cos((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius
                    }
                ]
            }
        }
    }

    //! Minor TickMark Loader
    Loader {
        active: true //rangeControl.minorTickVisible
        width: control.minorInsetRadius * 2
        height: control.minorInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: minortickmarkRepeater
            property real p: Math.abs(rangeControl.endAngle  - rangeControl.startAngle)
                             / (minortickmarkRepeater.model - 1)
            model: (rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: minorTickmarkLoader
                x: control.minorInsetRadius
                y: control.minorInsetRadius
                visible: !(index%(control.rangeControl.minorTickCount+1)===0)
                sourceComponent: control.minorTickmark
                transform: [
                    Rotation{
                        angle: (rangeControl.startAngle + 360 + (index * p))
                    },
                    Translate {
                        x: Math.sin((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.minorInsetRadius * -1
                        y: Math.cos((rangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.minorInsetRadius
                    }
                ]
            }
        }
    }

    Loader {
        active: true //rangeControl.minorTickVisible
        width: control.labelInsetRadius * 2
        height: control.labelInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: labelRepeater
            property real p: Math.abs(rangeControl.endAngle  - rangeControl.startAngle)
                             / (labelRepeater.model - 1)
            model: rangeControl.majorTickCount
            anchors.fill: parent

            delegate: Loader {
                id: labelLoader
                x: control.labelInsetRadius
                y: control.labelInsetRadius

                sourceComponent: Text{
                    font.pixelSize: Math.max(6, 0.12 * outerRadius)
                    text: Math.round(((rangeControl.maximumValue
                                       - rangeControl.minimumValue)
                                       / (rangeControl.majorTickCount - 1)
                                       * index + Number.EPSILON) * 10) / 10
                    color: "#c8c8c8"
                    antialiasing: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                transform: [
                    Rotation{
                        angle: (rangeControl.startAngle - 3 + 360 + (index * p))
                    },
                    Translate {
                        x: Math.sin((rangeControl.startAngle - 3 + 180 + index * p)
                                    * (Math.PI/180)) * control.labelInsetRadius * -1
                        y: Math.cos((rangeControl.startAngle - 3 + 180 + index * p )
                                    * (Math.PI/180)) * control.labelInsetRadius
                    }
                ]
            }
        }
    }

    //! Needle Knob
    Loader {
        sourceComponent: needleKnob
        anchors.fill: parent
    }

    //! Digital Value
    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: outerRadius/2 + outerRadius/5
        text: Math.round((control.value + Number.EPSILON) * 100) / 100
        font.family: webFont.name
        font.pixelSize: 40
        color: "white"
    }

    //! Needle Loader
    Loader {
        id: needleLoader
        sourceComponent: control.needle
        transform: [
            Rotation {
                angle: needleRotation
                origin.x: needleLoader.width / 2
                origin.y: needleLoader.height
            },
            Translate {
                x: control.width / 2 - needleLoader.width / 2
                y: control.height / 2 - needleLoader.height
            }
        ]
    }

    /* Functions
     * ****************************************************************************************/

}
