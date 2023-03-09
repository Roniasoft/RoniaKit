import QtQuick

/*! ***********************************************************************************************
 * Modern Circular Gauge
 * ************************************************************************************************/
CircularGauge {
    id: control

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: control.outerRadius * 2
        implicitWidth: control.outerRadius * 2
        color: "#CCCCCC"
        anchors.centerIn: parent
        radius: width / 2

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/Modern/back.png"
            asynchronous: true
            sourceSize {
                width: width
            }
        }
    }
}
