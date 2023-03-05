import QtQuick
import RoniaKit
import QtQuick.Controls
import QtQuick.Controls.Material

Window {
    id: window
    width: 1680
    height: 960
    visible: true
    title: qsTr("Simple RoniaKit Example")
    color: "#3E3E3E"

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    RKCircularGaugeSpeed {
        id: gauge
        width: 400
        height: 500
        value: slider.value
    }


    RKCircularGaugeModern {
        width: 400
        height: 500
        x: 500
        value: slider.value
    }


    RKCircularGauge {
        width: 400
        height: 500
        x: 1000
        value: slider.value
    }

    Slider {
        id: slider
        anchors.bottom: parent.bottom
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        from: 0
        to: 100

    }
}
