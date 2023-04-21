import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import RoniaKit
import simple

Rectangle {
    id: gaugePreview

    property var gauges: []

    property ViewModel viewModel

    color: "#303030"

    ListView {
        model: window.gauges
        anchors.fill: parent
        orientation: ListView.Horizontal
        spacing: 10
        clip: true
        delegate: Rectangle {
            id: rect

            property RoniaControl gauge

            color: "transparent"
            height: ListView.view.height
            width: height
            scale: mouseArea.containsMouse ? 1.05 : 1.0

            Behavior on scale {NumberAnimation{duration: 100}}
            Component.onCompleted: {
                gauge = modelData;
                gauge.parent = rect;
                gauge.anchors.fill = rect
                gauge.anchors.margins = 10
            }

            MouseArea {
                id: mouseArea
                hoverEnabled: true
                anchors.fill: parent
                onClicked: viewModel.selectedGauge = gauge.type;
            }
        }
    }
}
