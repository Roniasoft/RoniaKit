import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Analog Gauge Style
 * ************************************************************************************************/
CircularGaugeStyle {
    id: control

    property string name;

    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }

    /* Object Properties
     * ****************************************************************************************/
    needleKnob: null
    needle: null



    /* Children
     * ****************************************************************************************/
    background: Rectangle {
        implicitHeight: control.height
        implicitWidth: control.width
        color: "transparent"
        anchors.centerIn: parent
        radius: 360
        Image {
            anchors.fill: parent
            source: "qrc:/RoniaKit/resources/Images/gauge/AnalougeGauge/backScreen.svg";
            asynchronous: true
            smooth: true;
            antialiasing: true;
            sourceSize {
                width: width
            }
        }
        Image {
            id: outerRingImg;
            source: "qrc:/RoniaKit/resources/Images/gauge/AnalougeGauge/outerRing.svg";
            anchors.centerIn: parent
            antialiasing: true
            anchors.fill: parent;
        }
        Image {
            id: middleRingImg;
            source: "qrc:/RoniaKit/resources/Images/gauge/AnalougeGauge/middleRing.svg";
            anchors.centerIn: parent
            antialiasing: true
            anchors.fill: parent;
        }
        Image {
            id: innerRingImg;
            source: "qrc:/RoniaKit/resources/Images/gauge/AnalougeGauge/innerRing.svg";
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
                ctx.lineWidth = outerRadius * 0.1
                ctx.arc(outerRadius,
                      outerRadius,
                      outerRadius*0.644 - ctx.lineWidth / 2,
                      degreesToRadians(valueToAngle(control.value-control.rangeControl.minimumValue) - 215.0),
                      degreesToRadians(valueToAngle(rangeControl.maximumValue-control.rangeControl.minimumValue) - 208.0 ));
                ctx.stroke();
            }
        }
    }

    foreground: Item {
        id: foregroundItem1;
        Image {
            id: needleCntr;
            source: "qrc:/RoniaKit/resources/Images/gauge/AnalougeGauge/topScreen.svg";
            anchors.fill: parent;
            antialiasing: true
        }
        Text {
            id: speedLabelBack
            font.family: webFont.name
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.horizontalCenterOffset: 0;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.verticalCenterOffset: 0;
            text: "888"
            color: "#3d62f4";
            font.pixelSize: outerRadius * 0.35;
            antialiasing: true
            opacity: 0.1
        }
        Text {
            id: speedLabel
            font.family: webFont.name
            anchors.left: speedLabelBack.left
            anchors.verticalCenter: speedLabelBack.verticalCenter
            text: control.value.toFixed(0);
            color: control.value > ((rangeControl.maximumValue-rangeControl.minimumValue) * 4 / 5)
                   ? "#ff5151" : "#3d62f4";
            font.pixelSize: outerRadius * 0.4;
            antialiasing: true
            Behavior on color {ColorAnimation {duration: 200}}
        }
    }
    Loader {
        id: tickMarkLabel
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent
        sourceComponent: tickmarkLabel
    }

    Component.onCompleted:{
        rangeControl.minorTickVisible = false
        rangeControl.majorTickVisible = false
        control.digitalValueVisibility = false
        theme = "Dark"
    }

    /* Functions
     * ****************************************************************************************/
    function valueToAngle (value1){
        return value1 * 260.0 /
               Math.abs(rangeControl.maximumValue-rangeControl.minimumValue)
    }

}

