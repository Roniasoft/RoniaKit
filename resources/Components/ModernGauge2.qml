import QtQuick

/*! ***********************************************************************************************
 * Modern Circular Gauge
 * ************************************************************************************************/
CircularGauge {
    id: control
    property CircularRangeControl circularRangeControl: CircularRangeControl {}
    rangeControl: circularRangeControl
    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

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
                ctx.strokeStyle = "#05053c";
                ctx.lineWidth = outerRadius * 0.75
                ctx.arc(outerRadius,
                      outerRadius,
                      outerRadius*0.9 - ctx.lineWidth / 2,
                      degreesToRadians(valueToAngle(control.value)
                                       - rangeControl.startAngle *-1 - 90),
                      degreesToRadians(valueToAngle(rangeControl.maximumValue)
                                       - rangeControl.endAngle - 90));
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
                font.pixelSize: 40
                color: "white"
            }
        }
    }
    Component.onCompleted:{
        console.log(rangeControl.endAngle)
    }

    needleKnob: null
    digitalValueVisibility: false
    function valueToAngle (value1){
        return value1 * Math.abs(rangeControl.endAngle - rangeControl.startAngle) /
               Math.abs(rangeControl.maximumValue-rangeControl.minimumValue)
    }
}
