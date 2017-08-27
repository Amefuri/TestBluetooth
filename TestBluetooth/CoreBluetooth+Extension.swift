//
//  CoreBluetooth+Extension.swift
//  TestBluetooth
//
//  Created by peerapat atawatana on 5/26/2560 BE.
//  Copyright © 2560 DaydreamClover. All rights reserved.
//

import CoreBluetooth

@available(iOS 10.0, *)
extension CBManagerState: CustomStringConvertible {
    public var description:String {
        switch self {
        case .unknown:
            return "unknown"
        case .resetting:
            return "resetting"
        case .unsupported:
            return "unsupported"
        case .unauthorized:
            return "unauthorized"
        case .poweredOff:
            return "poweredOff"
        case .poweredOn:
            return "poweredOn"
        }
    }
}
