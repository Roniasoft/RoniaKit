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
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import RoniaKit
import simple

/*! ***********************************************************************************************
 * A list view to display all gauges preview
 *
 * ************************************************************************************************/
Rectangle {
    id: root

    /* Property Declarations
     * ****************************************************************************************/
    property var        gauges:     []

    property ViewModel viewModel

    /* Object Properties
     * ****************************************************************************************/
    color: Qt.darker(Material.background, 1.2) // use the default background color


    /* Children
     * ****************************************************************************************/
    ListView {
        model: root.gauges
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
