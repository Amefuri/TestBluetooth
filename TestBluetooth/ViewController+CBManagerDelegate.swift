//
//  ViewController+CBManagerDelegate.swift
//  TestBluetooth
//
//  Created by peerapat atawatana on 5/26/2560 BE.
//  Copyright © 2560 DaydreamClover. All rights reserved.
//

import CoreBluetooth

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("State = \(central.state)")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //print("peripheral: \(peripheral)")
        
        
        guard peripheral.name != nil else { return }
        
        let uuid = peripheral.identifier.uuidString
        if !deviceList.contains(where: { (key, value) -> Bool in
            return key == uuid
        }) {
            deviceList[uuid] = peripheral
            tableView.reloadData()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to : " + (peripheral.name ?? "Unknown"))
    }
}
