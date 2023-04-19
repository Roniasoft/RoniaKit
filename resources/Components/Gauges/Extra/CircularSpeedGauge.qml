/*
 * Project: RoniaKit
 * Version: 0.0.1
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

/*! ***********************************************************************************************
 * Circular Speed Gauge
 * ************************************************************************************************/
CircularGauge {
    id: control

    /* Property Declarations
     * ****************************************************************************************/
    property          CircularRangeControl circularRangeControl: CircularRangeControl {}

    readonly property real                 outerRadius:          Math.min(control.width, control.height) * 0.5

    property          string               theme;

    /* Object Properties
     * ****************************************************************************************/
    rangeControl: circularRangeControl
    width: 250
    height: 250

    /* Children
     * ****************************************************************************************/
    style: CircularSpeedGaugeStyle {
        anchors.fill: parent
        rangeControl: control.rangeControl
        outerRadius: control.outerRadius
        name: control.name
        theme: control.theme
        value: control.value
    }

}
