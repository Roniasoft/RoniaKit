import QtQuick

/*! ***********************************************************************************************
 * Speed Circular Gauge
 * ************************************************************************************************/
CircularGauge {
    id: control

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: control.outerRadius * 2
        implicitWidth: control.outerRadius * 2
        color: "transparent"
        anchors.centerIn: parent
        radius: width / 2

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/Speed/backOn.png"
            asynchronous: true
            sourceSize {
                width: width
            }
        }
    }

    //! Needle
    needle: Item {
        implicitWidth: 0.15 * outerRadius
        implicitHeight: 0.8 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/Speed/needle-on.png"
        }
    }

//    tickmark: {
//        visible: false
//    }
//    minorTickmark: {
//        visible: false
//    }

    //!Custome gauges don't need tickmarks
//    Component.onCompleted:{
//        control.tickmark.visible = false
//        control.minorTickmark.visibile = false
//    }
}
