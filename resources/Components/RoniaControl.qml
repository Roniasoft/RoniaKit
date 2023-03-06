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
    }

    //! Major Tickmarks
    property Component tickmark: null

    //! Minor Tickmars
    property Component minorTickmark: null

    //! Tickmar Labels (major)
    property Component tickmarkLabel: null

    //! Needle
    property Component needle: null

    //! Needle Knob
    property Component needleKnob: null

    //! Foreground
    property Component foreground:  null

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


    /* Functions
     * ****************************************************************************************/

}
