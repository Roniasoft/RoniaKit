import QtQuick
import RoniaKit
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: centralWidget

    /* Property Declarations
     * ****************************************************************************************/
    property ViewModel      viewModel

    property RoniaControl   centerObject : null

    Connections {
        target: viewModel
        function onSelectedGaugeChanged() {
            if (centralWidget.centerObject) {
                centralWidget.centerObject.destroy();
            }

            centralWidget.centerObject = gaugeFactory.createGauge(viewModel.selectedGauge, centralWidget);
            centralWidget.centerObject.anchors.fill = centralWidget
            centralWidget.centerObject.anchors.margins = 50
        }
    }
}
