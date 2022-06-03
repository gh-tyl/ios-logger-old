import Foundation
import SwiftUI

struct SensorItemModel {
    var id = UUID()
    var itemNameEN: String
    var itemNameJA: String
    var isRecord: Bool
    var classMethod: Any?
    var function: Any?
    var variable: String?
}

let SensorItemsList = [
    SensorItemModel(itemNameEN: "DateTime", itemNameJA: "日時", isRecord: false, classMethod: nil, function: GetCurrentDatetime(), variable: ""),
    SensorItemModel(itemNameEN: "Atmospheric Pressure", itemNameJA: "気圧", isRecord: false, classMethod: AtmosphericPressureManager(), function: AtmosphericPressureManager().startRelativeAltitudeUpdates(), variable: ""),

    SensorItemModel(itemNameEN: "Relative Altitude", itemNameJA: "高度", isRecord: false, classMethod: AtmosphericPressureManager(), function: AtmosphericPressureManager().startAbsoluteAltitudeUpdate(), variable: ""),
    SensorItemModel(itemNameEN: "Screen Brightness", itemNameJA: "輝度", isRecord: false, classMethod: ScreenBrightnessManager(), function: ScreenBrightnessManager().startScreenBrightness(), variable: "brightnessString"),
]

//let SensorItemsDict: [Any] = [
//    [
//        "itemNameEN": "DateTime",
//        "itemNameJA": "日時",
//        "isRecord": false,
//        "class": "",
//        "function": GetCurrentDatetime(),
//        "variable": "",
//    ],
//    [
//        "itemNameEN": "AtmosphericPressure",
//        "itemNameJA": "気圧",
//        "isRecord": false,
//        "class": AtmosphericPressureManager(),
//        "function": AtmosphericPressureManager(),
//        "variable": "pressureString",
//    ],
//    [
//        "itemNameEN": "AtmosphericPressure",
//        "itemNameJA": "高度",
//        "isRecord": false,
//        "class": AtmosphericPressureManager(),
//        "function": AtmosphericPressureManager(),
//        "variable": "absaltitudeString",
//    ],
//    [
//        "itemNameEN": "AtmosphericPressure",
//        "itemNameJA": "輝度",
//        "isRecord": false,
//        "class": ScreenBrightnessManager(),
//        "function": ScreenBrightnessManager(),
//        "variable": "brightnessString",
//    ],
//]
