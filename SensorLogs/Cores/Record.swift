import Foundation
import Combine

class Record {
    func StartRecording(for SensorItems: [SensorItemModel]) {
        for item in SensorItems {
            if item.isRecord && item.initClass != nil {
                print("Start function")
                print(item.itemNameEN, item.itemNameJA)
                item.initClass
            } else {
            }
        }
    }
    
    func StopRecording(for SensorItems: [SensorItemModel]) {
        for item in SensorItems {
            if item.isRecord && item.initClass != nil {
                print("Stop function")
                print(item.itemNameEN, item.itemNameJA)
            } else {
            }
        }
    }
}
