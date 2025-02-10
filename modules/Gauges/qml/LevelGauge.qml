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
import QtQuick.Shapes
import RoniaKit.Gauges

/*! ***********************************************************************************************
 * Level Gauge
 * ************************************************************************************************/
RoniaControl {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property RangeControl rangeControl: RangeControl {
        minorTickCount: 1
        majorTickCount: 10
    }

    /* Object Properties
     * ****************************************************************************************/
    outerRadius: Math.min(3 * control.width,control.height)
    type: RoniaControl.GaugeType.Level
    width: 250
    height: 250

    /* Children
     * ****************************************************************************************/
    style: LevelGaugeStyle {
        id: levelGauge
        anchors.fill: parent
        rangeControl: control.rangeControl
        outerRadius: control.outerRadius
        theme: control.theme
        value: control.value
    }
}
