import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Circular Gauge Modern Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    property string name;

    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    Component.onCompleted: {
        theme = "Dark"
    }

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

        Image {
            id: glowingCircle;
            source: "qrc:/RoniaKit/resources/Images/gauge/Modern/blueLight.png";
            anchors.centerIn: parent
            antialiasing: true
            anchors.fill: parent;
        }
        Canvas {
            property int value: control.value
            anchors.fill: parent
            onValueChanged: {
                if(visible)
                    requestPaint();
            }
            function degreesToRadians(degrees) {
              return degrees * (Math.PI / 180.0);
            }
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.beginPath();
                ctx.strokeStyle = "#0d151b";
                ctx.lineWidth = outerRadius * 0.75
                ctx.arc(outerRadius,
                      outerRadius,
                      outerRadius*0.9 - ctx.lineWidth / 2,
                      degreesToRadians(valueToAngle(control.value-control.rangeControl.minimumValue)
                                       - control.rangeControl.startAngle *-1 - 92),
                      degreesToRadians(valueToAngle(control.rangeControl.maximumValue-control.rangeControl.minimumValue)
                                       - control.rangeControl.endAngle - 88));
                ctx.stroke();
            }
        }
    }
    needle: Item {
        implicitWidth: 0.15 * outerRadius
        implicitHeight: 0.8 * outerRadius

        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/Modern/blueNeedle.png"
        }

    }

    foreground: Item {
        id: foregroundItem1;
        Rectangle{
            width: 3*outerRadius/4
            height: 3*outerRadius/4
            radius: width/2
            anchors.centerIn: parent
            color: "#0d151b"
            border.color: "#5f6975"
            border.width: 4
            Text{
                anchors.centerIn: parent
                text: parseFloat(control.value.toFixed(rangeControl.decimalPoint))
                font.family: webFont.name
                font.pixelSize: outerRadius * 0.2
                color: "white"
            }
        }
    }

    needleKnob: null
    digitalValueVisibility: false
    function valueToAngle (value1){
        return value1 * Math.abs(control.rangeControl.endAngle - control.rangeControl.startAngle) /
               Math.abs(control.rangeControl.maximumValue-control.rangeControl.minimumValue)
    }
}

