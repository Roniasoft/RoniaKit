import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Circular Modern Gauge 1 Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property string name;

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    Component.onCompleted: {
        theme = "Dark"
    }

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

    //! Gauge Name
    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/2 - 4*Math.min(parent.height,parent.width)/16
        text: control.name
        font.family: webFont.name
        font.pixelSize: control.outerRadius * 0.15
        color: "white"
    }

}

