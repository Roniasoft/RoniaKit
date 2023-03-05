import QtQuick

/*! ***********************************************************************************************
 * This is the abstract type of all gauges definitions
 *
 * ************************************************************************************************/
Item {
    id: root

    /* Property Declarations
     * ****************************************************************************************/


    //! Value
    property double value: 100.0

    //! Minimum
    property double minimumValue: 0.0

    //! Maximum
    property double maximumValue: 100.0

    //! Background
    property Component background: Rectangle {
        implicitHeight: root.height
        implicitWidth: root.width
        color: "#1e1e1e"
        anchors.centerIn: parent
        radius: width / 2
    }

    //! Major Tickmarks
    property Component tickmark: null

    //! Minor Tickmars
    property Component minorTickmark: null

    //! Tickmar Labels (major)
    property Component tickmarkLabel: null

    //! Needle
    property Component needle: Item {
        implicitWidth: 0.08 * outerRadius
        implicitHeight: 0.9 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/needle.png"
        }
    }

    //! Needle Knob
    property Component needleKnob: Item {
        Image {
            source: "qrc:/RoniaKit/resources/Images/gauge/knob.png"
            anchors.centerIn: parent
        }
    }

    //! Foreground
    property Component foreground:  null

    /*!
        The distance from the center of the gauge to the outer edge of the
        gauge.

        This property is useful for determining the size of the various
        components of the style, in order to ensure that they are scaled
        proportionately when the gauge is resized.
    */
    readonly property real outerRadius: Math.min(root.width, root.height) * 0.5

    property real minimumValueAngle: -135
    property real maximumValueAngle: 135

    //! This property holds the rotation of the needle in degrees.
    property real needleRotation: {
        var percentage = (root.value - root.minimumValue) / (root.maximumValue - root.minimumValue);
        minimumValueAngle + percentage * 270;
    }

    /* Object Properties
     * ****************************************************************************************/


    /* Children
     * ****************************************************************************************/

    //! Background Loader
    Loader {
        id: backgroundLoader
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: background
    }


    //! Needle Loader
    Loader {
        id: needleLoader
        sourceComponent: root.needle
        transform: [
            Rotation {
                angle: needleRotation
                origin.x: needleLoader.width / 2
                origin.y: needleLoader.height
            },
            Translate {
                x: root.width / 2 - needleLoader.width / 2
                y: root.height / 2 - needleLoader.height
            }
        ]
    }

    //! Needle Knob
    Loader {
        sourceComponent: needleKnob
        anchors.fill: backgroundLoader
    }


    /* Functions
     * ****************************************************************************************/

}
