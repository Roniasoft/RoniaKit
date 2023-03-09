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
    property bool   minorTickVisible: null

    //! Major ticks visibility
    property bool   majorTickVisible: null

    //! Labels ticks visibility
    property bool   labelVisible:     null

    //! Step size
    property int    stepSize:         null

    //! MajorTick Number
    property int    majorTickCount:   7


}
