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

/*! ***********************************************************************************************
 * A view model for the UI
 *
 * ************************************************************************************************/
QtObject {

    property int    selectedGauge:      RoniaControl.GaugeType.UNDEFINED

    //! The current value
    property double value:              0.0

    //! Major tick count
    property int    majorTickCount:     7

    //! Minor tick count
    property int    minorTickCount:     4

    //! Major inset (the outer margins for the major ticks)
    property int    majorInset:         20

    //! Minor inset (the outer margins for the minor ticks)
    property int    minorInset:         20

    //! Label inset
    property int    labelInset:         30

    //! Start angle (for circular gauges)
    property int    startAngle:         -135

    //! End angle (for circular gauges)
    property int    endAngle:           135

    //! Theme (light, dark)
    property int    theme:              RoniaControl.Theme.Light

    //! Minimum value of the gauge
    property double minimumValue:       0.0

    //! Maximum value of the gauge
    property double maximumValue:       100.0
}
