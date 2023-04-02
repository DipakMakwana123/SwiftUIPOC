//
//  Defaults.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/03/23.
//

import Foundation
class Defaults {

    //MARK: Shared Instance

    static let shared = Defaults(name: Constants.Defaults.fileName, type: Constants.Defaults.fileType)

    //MARK: Properties

    private var name: String!
    private var type: String!

    private var sourcePath: String!
    private var destinationPath: String!
    private var fileManager = FileManager.default

    //MARK: Lifecycle

    convenience init(name: String, type: String) {
        let sourcePath = Bundle.main.path(forResource: name, ofType: type)
        let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let destinationPath = (directory as NSString).appendingPathComponent("\(name).\(type)")
        self.init(name: name, type: type, sourcePath: sourcePath!, destinationPath: destinationPath)
    }

    init(name: String, type: String, sourcePath: String, destinationPath: String) {
        self.name = name
        self.type = type
        self.sourcePath = sourcePath
        self.destinationPath = destinationPath

        if !fileManager.fileExists(atPath: destinationPath) {
            do {
                try fileManager.copyItem(atPath: sourcePath, toPath: destinationPath)
            } catch let error {
                debugLog("Unable to copy file. ERROR: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Persistence

    func set(string: String, forKey key: String) {
        set(value: string, forKey: key)
    }

    func set(int: Int, forKey key: String) {
        set(value: int, forKey: key)
    }

    func set(float: Float, forKey key: String) {
        set(value: float, forKey: key)
    }

    func set(double: Double, forKey key: String) {
        set(value: double, forKey: key)
    }

    func set(bool: Bool, forKey key: String) {
        set(value: bool, forKey: key)
    }

    func set(date: Date?, forKey key: String) {
        set(value: date, forKey: key)
    }

    func set(data: Data?, forKey key: String) {
        set(value: data, forKey: key)
    }

    func set(dictionary: [AnyHashable: Any?], forKey key: String) {
        set(value: dictionary, forKey: key)
    }

    func set(array: [Any], forKey key: String) {
        set(value: array, forKey: key)
    }

    // MARK: - Retrieval

    func string(forKey key: String) -> String? {
        return value(forKey: key) as? String
    }

    func int(forKey key: String) -> Int {
        return value(forKey: key) as? Int ?? -1
    }

    func float(forKey key: String) -> Float {
        return value(forKey: key) as? Float ?? 0.0
    }

    func double(forKey key: String) -> Double {
        return value(forKey: key) as? Double ?? 0.0
    }

    func bool(forKey key: String, defaultValue: Bool = false) -> Bool {
      return value(forKey: key) as? Bool ?? defaultValue
    }

    func date(forKey key: String) -> Date? {
        return value(forKey: key) as? Date
    }

    func data(forKey key: String) -> Data? {
        return value(forKey: key) as? Data
    }

    func dictionary(forKey key: String) -> [AnyHashable: Any]? {
        return value(forKey: key) as? [AnyHashable: Any]
    }

    func array(forKey key: String) -> [Any]? {
        return value(forKey: key) as? [Any]
    }

    private func value(forKey key: String) -> Any? {
        return values()?[key]
    }

    // MARK: - Operations

    private func set(value: Any?, forKey key: String) {
        if let value = value {
            if let values = mutableValues() {
                values[key] = value
                set(values: values)
            } else {
                debugLog(Defaults.self, message: "Unable to set value for \(key)")
            }
        } else {
            removeValue(forKey: key)
        }
    }

    func removeValue(forKey key: String) {
        if let values = mutableValues() {
            values.removeObject(forKey: key)
            set(values: values)
        } else {
            debugLog(Defaults.self, message: "Unable to remove value for \(key)")
        }
    }

    func removeAllValues() {
        if let values = mutableValues() {
            values.removeAllObjects()
            set(values: values)
        } else {
            debugLog(Defaults.self, message: "Unable to remove all values")
        }
    }

    func values() -> NSDictionary? {
        guard fileExistsAtDestination() else {
            debugLog(Defaults.self, message: Constants.Defaults.doesNotExist)
            return nil
        }

        return NSDictionary(contentsOfFile: destinationPath)
    }

    private func mutableValues() -> NSMutableDictionary? {
        guard fileExistsAtDestination() else {
            debugLog(Defaults.self, message: Constants.Defaults.doesNotExist)
            return nil
        }

        return NSMutableDictionary(contentsOfFile: destinationPath)
    }

    private func set(values dictionary: NSDictionary) {
        guard fileExistsAtDestination() else {
            debugLog(Defaults.self, message: Constants.Defaults.doesNotExist)
            return
        }

        if !dictionary.write(toFile: destinationPath, atomically: true) {
            debugLog(Defaults.self, message: "Failed to write file")
        }
    }

    private func fileExistsAtDestination() -> Bool {
        return fileManager.fileExists(atPath: destinationPath)
    }

}
