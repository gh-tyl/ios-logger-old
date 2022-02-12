import Foundation
import SwiftUI
import Combine
import CoreData
import CoreMotion

class ScreenBrightnessManager: NSObject, ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    @Published var brightnessString:String = ""

    override init() {
        super.init()
        startUpdate()
    }

    func doReset(){
        startUpdate()
    }

    func startUpdate() {
        if(UIScreen.main.brightness >= 0.0) {
            let brightness:Double = UIScreen.main.brightness
//            self.brightnessString = String(format: "輝度:%.2f", brightness)
            self.brightnessString = String(brightness)
            self.willChange.send()
        }
    }

}
