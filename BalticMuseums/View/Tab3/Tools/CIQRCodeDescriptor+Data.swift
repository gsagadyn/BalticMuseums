//
//  CIQRCodeDescriptor+Data.swift
//  BalticMuseums
//
//  Created by Grzegorz Sagadyn on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import SceneKit
import ARKit
import Vision

public extension CIQRCodeDescriptor {
    public var data: Data {
        return errorCorrectedPayload.withUnsafeBytes { (pointer: UnsafePointer<UInt8>) in
            var cursor = pointer
            
            let representation = (cursor.pointee >> 4) & 0x0f
            guard representation == 4 else { return Data() }
            
            var count = (cursor.pointee << 4) & 0xf0
            cursor = cursor.successor()
            count |= (cursor.pointee >> 4) & 0x0f
            
            var result = Data(count: Int(count))
            guard count > 0 else { return result }
            
            var prev = (cursor.pointee << 4) & 0xf0
            for i in 2...errorCorrectedPayload.count {
                if (i - 2) == count { break }
                let cursor = pointer.advanced(by: Int(i))
                let byte = cursor.pointee
                let current = prev | ((byte >> 4) & 0x0f)
                result[i - 2] = current
                prev = (cursor.pointee << 4) & 0xf0
            }
            return result
        }
    }
}
