import Foundation

func GetCurrentDatetime() -> String {
    let date = Date()
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))

    print(dateformatter.string(from: date))
    return dateformatter.string(from: date)
}
