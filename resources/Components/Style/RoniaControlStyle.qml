import QtQuick 2.15
import QtQuick.Controls
import RoniaKit

/*! ***********************************************************************************************
 * Ronia Control Style
 * ************************************************************************************************/
Item {
    id: root

    /* Property Declarations
     * ****************************************************************************************/
    property  var            backgroundMap:            ({})

    property  var            foregroundMap:            ({})

    property  var            majorTickmarkMap:         ({})

    property  var            minorTickmarkMap:         ({})

    property  var            labelMap:                 ({})

    property  var            needleMap:                ({})

    property  var            needleKnobMap:            ({})

    property string          theme;

    required property double value

    property real            outerRadius

    /* Font Loader
     * ****************************************************************************************/
    FontLoader {id: webFont; source: "qrc:/RoniaKit/resources/Fonts/FontsFree-Net-DS-DIGI-1.ttf" }


    /* Children
     * ****************************************************************************************/

    property Component background: Rectangle {
        implicitHeight: root.height
        implicitWidth: root.width
        color: "#1e1e1e"
        anchors.centerIn: parent
    }

    //! Major Tickmarks
    property Component tickmark: Rectangle {
            implicitWidth: outerRadius * 0.02
            antialiasing: true
            implicitHeight: outerRadius * 0.06
            color: "#c8c8c8"
            visible: true
        }

    //! Minor Tickmars
    property Component minorTickmark: Rectangle {
            implicitWidth: outerRadius * 0.01
            antialiasing: true
            implicitHeight: outerRadius * 0.03
            color: "#c8c8c8"
            visible: true
        }

    //! Tickmar Labels (major)
    property Component tickmarkLabel: Text {
            font.pixelSize: Math.max(6, 0.12 * outerRadius)
            color: "#c8c8c8"
            antialiasing: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

    //! Needle
    property Component needle: null

    //! Needle Knob
    property Component needleKnob: null

    //! Foreground
    property Component foreground:  null

    Behavior on value {
        NumberAnimation {
            easing.overshoot: 1.2
            duration: 800
            easing.type: Easing.OutBack
        }
    }

}
