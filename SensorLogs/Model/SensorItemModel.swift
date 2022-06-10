import Foundation
import Combine

final class SensorItemModelData: ObservableObject {
    @Published var SensorItems: [SensorItemModel] = SensorItemsList
}

struct SensorItemModel {
    var id = UUID()
    var itemNameEN: String
    var itemNameJA: String
    var initClass: Any?
    var isRecord: Bool
}

let SensorItemsList = [
    SensorItemModel(itemNameEN: "Absolute Altitude", itemNameJA: "絶対高度", initClass: nil, isRecord: false),
    SensorItemModel(itemNameEN: "Relative Altitude", itemNameJA: "相対高度", initClass: nil, isRecord: false),
    SensorItemModel(itemNameEN: "Atmospheric Pressure", itemNameJA: "気圧", initClass: nil, isRecord: false),
    SensorItemModel(itemNameEN: "Screen Brightness", itemNameJA: "輝度", initClass: nil, isRecord: false),
]
