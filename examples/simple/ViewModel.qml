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
