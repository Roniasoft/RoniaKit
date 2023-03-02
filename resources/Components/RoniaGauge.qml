import QtQuick

/*! ***********************************************************************************************
 * This is the abstract type of all gauges definitions
 *
 * ************************************************************************************************/
Item {
    id: root

    /* Property Declarations
     * ****************************************************************************************/
    //! Value
    property double value: 100.0

    //! Minimum
    property double minimum: 0.0

    //! Maximum
    property double maximum: 100.0

    //! Image to be shown in the background
    property string backImagePath: ""

    //! Background
    property Rectangle background


    /* Object Properties
     * ****************************************************************************************/


    /* Children
     * ****************************************************************************************/



    /* Functions
     * ****************************************************************************************/

}
