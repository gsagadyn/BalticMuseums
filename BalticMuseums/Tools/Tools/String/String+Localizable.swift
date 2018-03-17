//
//  String+Localizable.swift
//  SwiftyLocalizable
//
//  Created by Grzegorz Sagadyn on 22.01.2018.
//

import Foundation

public extension String {
    public static var defaultLocalizedDirectory = "Localizable"
    
    public func localized(bundle: Bundle = .main,
                          locale: Locale = .current,
                          directory: String = .defaultLocalizedDirectory,
                          quantity: Double,
                          arguments: CVarArg...) -> String {
        let tableName = createTableName(bundle: bundle, locale: locale, directory: directory)
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
        
        var args = arguments
        args.insert(quantity, at: 0)
        
        return String(format: format, locale: locale, arguments: args)
    }
    
    public func localized(bundle: Bundle = .main,
                          locale: Locale = .current,
                          directory: String = .defaultLocalizedDirectory,
                          quantity: Double) -> String {
        
        let tableName = createTableName(bundle: bundle, locale: locale, directory: directory)
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
        
        return String(format: format, locale: locale, arguments: [quantity])
    }
    
    public func localized(bundle: Bundle = .main,
                          locale: Locale = .current,
                          directory: String = .defaultLocalizedDirectory,
                          quantity: Int,
                          arguments: CVarArg...) -> String {
        
        let tableName = createTableName(bundle: bundle, locale: locale, directory: directory)
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
        
        var args = arguments
        args.insert(quantity, at: 0)
        
        return String(format: format, locale: locale, arguments: args)
    }
    
    public func localized(bundle: Bundle = .main,
                          locale: Locale = .current,
                          directory: String = .defaultLocalizedDirectory,
                          quantity: Int) -> String {
        
        let tableName = createTableName(bundle: bundle, locale: locale, directory: directory)
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
        
        return String(format: format, locale: locale, arguments: [quantity])
    }
    
    public func localized(bundle: Bundle = .main,
                          locale: Locale = .current,
                          directory: String = .defaultLocalizedDirectory,
                          arguments: CVarArg...) -> String {
        
        let tableName = createTableName(bundle: bundle, locale: locale, directory: directory)
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
        
        return String(format: format, locale: locale, arguments: arguments)
    }
    
    public func localized(bundle: Bundle = .main,
                          locale: Locale = .current,
                          directory: String = .defaultLocalizedDirectory) -> String {
        
        let tableName = createTableName(bundle: bundle, locale: locale, directory: directory)
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "", comment: "")
        
        return String(format: format, locale: locale)
    }
    
    private func createTableName(bundle: Bundle, locale: Locale, directory: String) -> String {
        var identifiers = [String]()
        identifiers.append(locale.identifier)
        identifiers.append(contentsOf: locale.identifier.split(separator: "_").map { String($0) })
        
        let names = identifiers.filter {
            bundle.path(forResource: (directory + "/" + $0.lowercased()), ofType: "stringsdict") != nil
        }
        
        return directory + "/" + String(names.first ?? "base")
    }
}
