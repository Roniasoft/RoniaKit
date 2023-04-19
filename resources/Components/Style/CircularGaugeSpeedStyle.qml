import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Circular Gauge Speed Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    property string name;

    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

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

    //! Gauge Name
    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/2 - 4*Math.min(parent.height,parent.width)/16
        text: control.name
        font.family: webFont.name
        font.pixelSize: outerRadius * 0.15
        color: "white"
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

    //!Custome gauges don't need tickmarks
    Component.onCompleted:{
        rangeControl.minorTickVisible = false
        rangeControl.majorTickVisible = false
        rangeControl.labelVisible = false
        theme = "Dark"
    }

}

