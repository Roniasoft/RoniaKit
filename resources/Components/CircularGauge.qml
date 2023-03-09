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
        circularRangeControl.startAngle + percentage * 270;
    }

    property real minorInsetRadius: outerRadius - circularRangeControl.minorTickmarkInset

    property real majorInsetRadius: outerRadius - circularRangeControl.tickmarkInset

    /* Object Properties
     * ****************************************************************************************/
    rangeControl: circularRangeControl
    width: 250
    height: 250


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

    needleKnob : Item {
        Image {
            source: "qrc:/RoniaKit/resources/Images/gauge/knob.png"
            anchors.centerIn: parent
        }
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

    //! Major TickMark Loader
    Loader {
        id: majorTickLoader
        active: rangeControl.majorTickVisible
        width: control.majorInsetRadius * 2
        height: control.majorInsetRadius * 2
        anchors.centerIn: parent

        sourceComponent: Repeater {
            id: tickmarkRepeater
            property real p: Math.abs(circularRangeControl.endAngle  - circularRangeControl.startAngle)
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
                        angle: (circularRangeControl.startAngle + 360 + (index * p) )
                    },
                    Translate {
                        x: Math.sin((circularRangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.majorInsetRadius * -1
                        y: Math.cos((circularRangeControl.startAngle + 180 + index * p)
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
            property real p: Math.abs(circularRangeControl.endAngle  - circularRangeControl.startAngle)
                             / (minortickmarkRepeater.model - 1)
            model: (rangeControl.majorTickCount - 1) * rangeControl.minorTickCount + rangeControl.majorTickCount
            anchors.fill: parent
            delegate: Loader {
                id: minorTickmarkLoader
                x: control.minorInsetRadius
                y: control.minorInsetRadius
                sourceComponent: control.minorTickmark
                transform: [
                    Rotation{
                        angle: (circularRangeControl.startAngle + 360 + (index * p))
                    },
                    Translate {
                        x: Math.sin((circularRangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.minorInsetRadius * -1
                        y: Math.cos((circularRangeControl.startAngle + 180 + index * p)
                                    * (Math.PI/180)) * control.minorInsetRadius
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

    /* Functions
     * ****************************************************************************************/

}
