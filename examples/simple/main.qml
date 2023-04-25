/*
 * Project: RoniaKit
 * Version: 1.0.0
 * License: Apache 2.0
 *
 * Copyright (c) 2023 Ronia AB
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import QtQuick
import RoniaKit
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import simple

ApplicationWindow {
    id: window

    /* Property Declarations
     * ****************************************************************************************/
    //! View model
    property ViewModel      viewModel:          ViewModel {}

    //! Gauges factory
    property GaugeFactory   gaugeFactory:       GaugeFactory {
        viewModel: window.viewModel
    }

    //! Preview gauges
    property var            gauges:             []


    /* Object Properties
     * ****************************************************************************************/
    width: 1680
    height: 960
    visible: true
    title: qsTr("Simple RoniaKit Example")

    Material.theme: viewModel.theme === RoniaControl.Theme.Light ? Material.Light : Material.Dark
    Material.accent: Material.BlueGrey


    /* Constructor
     * ****************************************************************************************/
    Component.onCompleted: {
        var gauge1 = gaugeFactory.createGauge(RoniaControl.GaugeType.CircularBasic,      null);
        var gauge2 = gaugeFactory.createGauge(RoniaControl.GaugeType.Circular,           null);
        var gauge3 = gaugeFactory.createGauge(RoniaControl.GaugeType.Level,              null);
        var gauge4 = gaugeFactory.createGauge(RoniaControl.GaugeType.CircularAnalog,     null);
        var gauge5 = gaugeFactory.createGauge(RoniaControl.GaugeType.CircularModern1,    null);
        var gauge6 = gaugeFactory.createGauge(RoniaControl.GaugeType.CircularModern2,    null);
        var gauge7 = gaugeFactory.createGauge(RoniaControl.GaugeType.CircularSpeed,      null);
        var gauge8 = gaugeFactory.createGauge(RoniaControl.GaugeType.Thermometer,        null);
        var gauge9 = gaugeFactory.createGauge(RoniaControl.GaugeType.CircularThermometer,null);

        gauges.push(gauge1);
        gauges.push(gauge2);
        gauges.push(gauge3);
        gauges.push(gauge4);
        gauges.push(gauge5);
        gauges.push(gauge6);
        gauges.push(gauge7);
        gauges.push(gauge8);
        gauges.push(gauge9);

        gaugesChanged();
    }

    /* Children
     * ****************************************************************************************/
    //! Central Widget
    CentralWidget {
        viewModel: window.viewModel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: gaugePreview.top
        anchors.right: settings.left
    }

    //! Settings Widget
    Rectangle {
        id: settings
        color: Qt.darker(Material.background, 1.05)
        anchors.right: parent.right
        anchors.top: parent.top
        width: parent.width / 6
        height: parent.height

        SettingsWidget {
            viewModel: window.viewModel
            anchors.fill: parent
            anchors.margins: 10
        }
    }

    //! Gauges Preview
    GaugesPreview {
        id: gaugePreview
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: settings.left
        height: parent.height / 4
        viewModel: window.viewModel
        gauges: window.gauges
    }
}
