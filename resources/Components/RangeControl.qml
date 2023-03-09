import QtQuick

/*! ***********************************************************************************************
 * Range Controller (for all gauges)
 * ************************************************************************************************/
QtObject {

    /* Property Declarations
     * ****************************************************************************************/

    //! Minimum
    property double minimumValue:     0.0


    readonly property int tickmarkCount: 10

    //! Maximum
    property double maximumValue:     100.0

    //! Minor ticks visibility
    property bool   minorTickVisible: true

    //! Major ticks visibility
    property bool   majorTickVisible: true

    //! Labels ticks visibility
    property bool   labelVisible:     false

    //! Step size
    property int    stepSize:         0

    //! MajorTick Number
    property int    majorTickCount:   7


}
