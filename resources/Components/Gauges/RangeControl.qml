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

/*! ***********************************************************************************************
 * Range Controller (for all gauges)
 * ************************************************************************************************/
QtObject {

    /* Property Declarations
     * ****************************************************************************************/

    //! Minimum
    property double minimumValue:      70.0

    //! Maximum
    property double maximumValue:      150.0

    //! Minor ticks visibility
    property bool   minorTickVisible:  true

    //! Major ticks visibility
    property bool   majorTickVisible:  true

    //! Labels ticks visibility
    property bool   labelVisible:      true

    //! Step size
    property int    stepSize:          0

    //! MajorTick count
    property int    majorTickCount:    7

    //! Minot Tick Count (between each two major ticks)
    property int    minorTickCount:    4

    //!Major tickmark inset (modifiable by user)
    property real   tickmarkInset:     20

    //!Minor tickmark inset (modifiable by user)
    property real   minorTickmarkInset:20

    //!Label inset (modifiable by user)
    property real   labelInset:        30

    //! Num of decimal points for digital value displayer
    property int    decimalPoint:       2

    //! Start angle
    property real   startAngle:         -135

    //! End angle
    property real   endAngle:           135

}
