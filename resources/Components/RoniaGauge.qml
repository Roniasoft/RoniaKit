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
        implicitHeight: control.size
        implicitWidth: control.size
        color: "#CCCCCC"
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
            source: "qrc:/RoniaGauges/resources/Images/gauge/needle.png"
        }
    }

    //! Overlay on the needled (behind the foreground)
    property Component needleOverlay: null

    //! Foreground
    property Component foreground:  null

    /*!
        The distance from the center of the gauge to the outer edge of the
        gauge.

        This property is useful for determining the size of the various
        components of the style, in order to ensure that they are scaled
        proportionately when the gauge is resized.
    */
    readonly property real outerRadius: Math.min(control.width, control.height) * 0.5

    property real minimumValueAngle: -145
    property real maximumValueAngle: 145

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


    /* Functions
     * ****************************************************************************************/

}
