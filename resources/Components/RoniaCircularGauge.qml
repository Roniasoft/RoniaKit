import QtQuick
import QtQuick.Controls


RoniaGauge {
    id: roniaGauge

    //! Size of the gauge
    property int size: 250

    /* Object Properties
     * ****************************************************************************************/
    width: size
    height: size

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
        parent: roniaGauge
        implicitHeight: roniaGauge.size
        implicitWidth: roniaGauge.size
        color: "#CCCCCC"
        anchors.centerIn: parent
        radius: width / 2

        Image {
            anchors.fill: parent
            source: backImagePath
            asynchronous: true
            sourceSize {
                width: width
            }
        }
    }

    /* Functions
     * ****************************************************************************************/

}
