//
//  File.swift
//  DiabetesTracking
//
//  Created by Yu Song on 11/10/15.
//  Copyright © 2015 EFA. All rights reserved.
//

import Foundation
class File{
    class func getFileAbsPathByName(fileName: String) -> String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0].stringByAppendingString(fileName)
    }
    
    class func createFileByName(fileName: String) {
        var str: String! = ""
        let filePath: String! = File.getFileAbsPathByName(fileName)
        do {
            try str.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        }catch{print("File cannot be created!")}
    }
    
    class func writeToFileByName(fileName: String, content: String) {
        let filePath = File.getFileAbsPathByName(fileName)
        do {
            try content.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        }catch{print("File cannot be writen!")}
    }
    
    class func readFileByName(fileName:String ) -> String{
        do{
            return try String(contentsOfFile: File.getFileAbsPathByName(fileName), encoding: NSUTF8StringEncoding)
        }
        catch {
            print("Read file failed!")
            return "";
        }
    }
    
    class func fileExistsByName(fileName: String) -> Bool{
        let fileManager: NSFileManager = NSFileManager.defaultManager()
        return fileManager.fileExistsAtPath(File.getFileAbsPathByName(fileName))
    }
    
    class func deleteFileByName(fileName: String) ->Bool{
        let fileManager = NSFileManager.defaultManager()
        let filePath = File.getFileAbsPathByName(fileName)
        do{
            try fileManager.removeItemAtPath(filePath)
            return true
        }catch{return false}
        
    }
}
