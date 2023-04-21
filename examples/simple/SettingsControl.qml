import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ColumnLayout {
    id: root

    property alias slider: slider

    property string text: "name: "

    Text {
        color: "#A9A9A9"
        text: root.text
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
    Slider {
        id: slider
        from: 0
        to: 300
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
