import QtQuick

RoniaCircularGauge {
    id: control

    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        parent: control
        implicitHeight: control.outerRadius * 2
        implicitWidth: control.outerRadius * 2
        color: "transparent"
        anchors.centerIn: parent
        radius: width / 2

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaGauges/resources/Images/gauge/Speed/backOn.png"
            asynchronous: true
            sourceSize {
                width: width
            }
        }
    }
}
