import Foundation
import CoreData

func CreateCsv(filename: String, fileArrData: [[String]]) {
    let filePath = NSHomeDirectory() + "/Documents/" + filename + ".csv"
    print("filePath : \(filePath)")
    var fileStrData:String = ""

    for singleArray in fileArrData{
        for singleString in singleArray{
            fileStrData += "\"" + singleString + "\""
            if singleString != singleArray[singleArray.count-1]{
                fileStrData += ","
            }
        }
        fileStrData += "\n"
    }
    print("fileStrData : \(fileStrData)")
    
    do{
        try fileStrData.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        print("Success to Wite the File")
    }catch let error as NSError{
        print("Failure to Write File\n\(error)")
    }
}
