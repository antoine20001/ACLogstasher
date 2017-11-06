//
//  ACLogger.swift
//  ACLogstasher
//
//  Created by Antoine COINTEPAS on 02/11/2017.
//

import UIKit
import Alamofire

public class ACLogger: NSObject {
    internal enum LogType {
        case debug
        case warning
        case verbose
        case error
        case info
    }
    
    // file conf
    public var logFilename: String?
    
    // logstash conf
    public var logstashHost: String
    public var logstashPort: Int = 31311
    public var logstashIndex: String

    public var logstashTimeout: TimeInterval = 20
    
    public init(host: String = "http://localhost", port: Int = 31311, index: String = "app") {
        self.logstashHost = host
        self.logstashPort = port
        self.logstashIndex = index
    }
    
}

extension ACLogger : Logging {
    public func info(_ message: String, error: NSError?, userInfo: [String : Any]?, _ file: StaticString = #file, _ function: StaticString = #function, _ line: UInt = #line) {
        self.sendLogMessage(type: .info)
    }
    
    public func error(_ message: String, error: NSError?, userInfo: [String : Any]?, _ file: StaticString = #file, _ function: StaticString = #function, _ line: UInt = #line) {
        self.sendLogMessage(type: .error)
    }
    
    func sendLogMessage(type: LogType, idElastic: String? = nil) {
        let parameters: Parameters = [
            Const.deviceTypeKey: UIDevice.current.model,
            Const.iosVersionKey: UIDevice.current.systemVersion,
            Const.deviceOrientationKey: UIDevice.current.orientation.isPortrait ? "Portrait" : "Landscape",
            Const.deviceBatteryKey: UIDevice.current.batteryLevel,
            Const.appVersionKey: Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "null",
            Const.appBuildVersionKey: Bundle.main.infoDictionary?["CFBundleVersion"] ?? "null",
            Const.appBundleKey: Bundle.main.bundleIdentifier ?? "null",
            Const.appNameKey: Bundle.main.infoDictionary!["CFBundleName"] ?? "",
            Const.deviceLanguageKey: Locale.current.languageCode ?? "",
            Const.deviceRegionKey: Locale.current.regionCode ?? "",
            Const.deviceTimezoneKey: TimeZone.current.identifier,
            Const.deviceUUIDKey : UIDevice.current.identifierForVendor!.uuidString,
            "message": "plop"
        ]
        
        var url = "\(logstashHost):\(logstashPort)/\(logstashIndex)/\(type)"
        if let idElastic = idElastic {
            url.append("/\(idElastic)")
        }
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
    }
}
