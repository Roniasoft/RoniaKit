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
 * Factory class to create object dynamically
 *
 * ************************************************************************************************/
QtObject {

    /* Property Declarations
     * ****************************************************************************************/
    property ViewModel viewModel


    /* Children
     * ****************************************************************************************/
    function createGauge(gaugeType: int, parentObj) {
        var component = null;
        switch (gaugeType) {
            case RoniaControl.GaugeType.CircularBasic: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/CircularBasicGauge.qml");
            } break;
            case RoniaControl.GaugeType.Circular: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/CircularGauge.qml");
            } break;
            case RoniaControl.GaugeType.Level: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/LevelGauge.qml");
            } break;
            case RoniaControl.GaugeType.Fuel: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/FuelGauge.qml");
            } break;
            case RoniaControl.GaugeType.CircularAnalog: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/Extra/CircularAnalogGauge.qml");
            } break;
            case RoniaControl.GaugeType.CircularModern1: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/Extra/CircularModernGauge1.qml");
            } break;
            case RoniaControl.GaugeType.CircularModern2: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/Extra/CircularModernGauge2.qml");
            } break;
            case RoniaControl.GaugeType.CircularSpeed: {
                component = Qt.createComponent("qrc:/RoniaKit/resources/Components/Gauges/Extra/CircularSpeedGauge.qml");
            } break;
        }

        var obj = null;
        if (component.status === Component.Ready) {
            obj = component.createObject(parentObj);

            obj.value =                           Qt.binding(function() { return viewModel.value })
            obj.theme =                           Qt.binding(function() { return viewModel.theme })
            obj.rangeControl.majorTickCount =     Qt.binding(function() { return viewModel.majorTickCount })
            obj.rangeControl.minorTickCount =     Qt.binding(function() { return viewModel.minorTickCount })
            obj.rangeControl.tickmarkInset =      Qt.binding(function() { return viewModel.majorInset })
            obj.rangeControl.minorTickmarkInset = Qt.binding(function() { return viewModel.minorInset })
            obj.rangeControl.labelInset =         Qt.binding(function() { return viewModel.labelInset })
            obj.rangeControl.startAngle =         Qt.binding(function() { return viewModel.startAngle })
            obj.rangeControl.endAngle =           Qt.binding(function() { return viewModel.endAngle })
            obj.rangeControl.minimumValue =       Qt.binding(function() { return viewModel.minimumValue })
            obj.rangeControl.maximumValue =       Qt.binding(function() { return viewModel.maximumValue })
        }

        else if(component.status === Component.Error)
            console.log("$$$$$$ " + component.errorString() + " $$$$$$")

        return obj;
    }
}
