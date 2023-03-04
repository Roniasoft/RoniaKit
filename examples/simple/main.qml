import QtQuick
import RoniaGauges
import QtQuick.Controls
import QtQuick.Controls.Material

Window {
    id: window
    width: 1280
    height: 960
    visible: true
    title: qsTr("Simple RoniaGauges Example")
    color: "#1e1e1e"

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    RoniaSpeedGauge {
        id: gauge
        width: 400
        height: 500
    }


    RoniaSimpleGauge {
        width: 400
        height: 500
        x: 500
    }
}
