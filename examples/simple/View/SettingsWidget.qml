import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import simple

/*! ***********************************************************************************************
 * Settings widget for the ui
 *
 * ************************************************************************************************/
Flickable {

    /* Property Declarations
     * ****************************************************************************************/
    property ViewModel viewModel

    /* Object Properties
     * ****************************************************************************************/


    /* Children
     * ****************************************************************************************/
    Column {
        anchors.fill: parent
        spacing: 20

        //! Value
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            text: "Value:"
            slider.from: 0
            slider.to: 100
            slider.value: viewModel.value
            slider.onValueChanged: viewModel.value =  slider.value
        }

        //! Major Tick Count
        SettingsControl {
            width: parent.width
            height: 30
            slider.from: 0
            slider.to: 10
            spacing: 15
            text: "Major Tick Count:"
            slider.value: viewModel.majorTickCount
            slider.onValueChanged: viewModel.majorTickCount =  slider.value
        }


        //! Minor Tick Count
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            slider.from: 0
            slider.to: 10
            text: "Minor Tick Count:"
            slider.value: viewModel.minorTickCount
            slider.onValueChanged: viewModel.minorTickCount =  slider.value
        }


        //! Minor Inset
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            slider.from: 0
            slider.to: 50
            text: "Minor Inset:"
            slider.value: viewModel.minorInset
            slider.onValueChanged: viewModel.minorInset =  slider.value
        }

        //! Major Inset
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            slider.from: 0
            slider.to: 50
            text: "Major Inset:"
            slider.value: viewModel.majorInset
            slider.onValueChanged: viewModel.majorInset =  slider.value
        }

        //! Label Inset
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            slider.from: 0
            slider.to: 50
            text: "Label Inset:"
            slider.value: viewModel.labelInset
            slider.onValueChanged: viewModel.labelInset =  slider.value
        }

        //! Start Angle
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            text: "Start Angle:"
            slider.from: -180
            slider.to: 0
            slider.value: viewModel.startAngle
            slider.onValueChanged: viewModel.startAngle =  slider.value
        }

        //! End Angle
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            text: "End Angle:"
            slider.from: 0
            slider.to: 180
            slider.value: viewModel.endAngle
            slider.onValueChanged: viewModel.endAngle =  slider.value
        }

        //! Minimum
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            text: "Minimum:"
            slider.from: 0
            slider.to: 100
            slider.value: viewModel.minimumValue
            slider.onValueChanged: viewModel.minimumValue =  slider.value
        }

        //! Maximum
        SettingsControl {
            width: parent.width
            height: 30
            spacing: 15
            text: "Maximum:"
            slider.from: 0
            slider.to: 100
            slider.value: viewModel.maximumValue
            slider.onValueChanged: viewModel.maximumValue =  slider.value
        }

        //! Theme
        ColumnLayout {
            width: parent.width
            spacing: 15
            Text {
                color: "#A9A9A9"
                text: "Theme"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            ComboBox {
                id: comboTheme
                Layout.fillHeight: true
                Layout.fillWidth: true
                model: ["Light", "Dark"]
                currentIndex: viewModel.theme
                onCurrentIndexChanged: viewModel.theme = currentIndex
            }
        }
    }
}
