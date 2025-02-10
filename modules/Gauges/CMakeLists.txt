set( RONIA_KIT_GAUGES_LIB "RoniaKitGauges" CACHE INTERNAL "RoniaKitGauges")
set( QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR} )

qt_add_library( ${RONIA_KIT_GAUGES_LIB} STATIC )

# Find all QML files in the Gauges module
file(GLOB_RECURSE Gauges_QML_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "qml/*.qml")

# Define the QML module for Gauges
qt_add_qml_module(${RONIA_KIT_GAUGES_LIB}
    URI RoniaKit.Gauges
    VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES ${Gauges_QML_FILES}
    RESOURCES
        assets/images/analougeGauge/backScreen.svg
        assets/images/analougeGauge/innerRing.svg
        assets/images/analougeGauge/middleRing.svg
        assets/images/analougeGauge/outerRing.svg
        assets/images/analougeGauge/topScreen.svg
        assets/images/fuel/back.png
        assets/images/fuel/fuel-station-green.png
        assets/images/fuel/fuel-station-red.png
        assets/images/fuel/fuel-station-yellow.png
        assets/images/modern/back.png
        assets/images/modern/blueLight.png
        assets/images/modern/blueNeedle.png
        assets/images/modern/knob.png
        assets/images/speed/backOff.png
        assets/images/speed/backOn.png
        assets/images/speed/needle-on.png
        assets/images/knob.png
        assets/images/needle.png
        assets/images/redNeedle2.png
        assets/images/redNeedle3.png
    NO_PLUGIN
)
