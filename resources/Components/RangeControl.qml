import QtQuick

/*! ***********************************************************************************************
 * Range Controller (for all gauges)
 * ************************************************************************************************/
QtObject {

    /* Property Declarations
     * ****************************************************************************************/

    //! Minimum
    property double minimumValue:      0.0

    //! Maximum
    property double maximumValue:      100.0

    //! Minor ticks visibility
    property bool   minorTickVisible:  true

    //! Major ticks visibility
    property bool   majorTickVisible:  true

    //! Labels ticks visibility
    property bool   labelVisible:      false

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

}
