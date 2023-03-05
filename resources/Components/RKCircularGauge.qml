import QtQuick
import QtQuick.Controls


RKControl {
    id: roniaGauge

    /* Object Properties
     * ****************************************************************************************/
    width: 250
    height: 250

    Behavior on value {
        NumberAnimation {
            easing.overshoot: 1.2
            duration: 800
            easing.type: Easing.OutBack
        }
    }

    /* Children
     * ****************************************************************************************/


    /* Functions
     * ****************************************************************************************/

}
