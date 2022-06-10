import Combine
import Foundation

func GetCurrentDate() -> String {
    let date = Date()
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd", options: 0, locale: Locale(identifier: "ja_JP"))
    return dateformatter.string(from: date)
}


func GetCurrentDatetime() -> String {
    let date = Date()
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
    return dateformatter.string(from: date)
}

func GetCurrentDatetimeFilename() -> String {
    let date = Date()
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
    var dateformatterstring = dateformatter.string(from: date)
    dateformatterstring = dateformatterstring.replace("/", "")
    dateformatterstring = dateformatterstring.replace(" ", "")
    dateformatterstring = dateformatterstring.replace(":", "")
    return dateformatterstring
}

extension String {
    func replace(_ from: String,_ to: String) -> String {
        var replacedString = self
        replacedString = replacedString.replacingOccurrences(of: from, with: to)
        return replacedString
    }
}
