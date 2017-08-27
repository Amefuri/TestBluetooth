//
//  ViewController+TableView.swift
//  TestBluetooth
//
//  Created by peerapat atawatana on 5/26/2560 BE.
//  Copyright © 2560 DaydreamClover. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoundDeviceCell", for: indexPath)
        if let device = deviceList[Array(deviceList.keys)[indexPath.row]] {
            if let name = device.name {
                cell.textLabel?.text = "\(name) (\(device.identifier.uuidString))"
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        /*if let device = deviceList[Array(deviceList.keys)[indexPath.row]] {
            startDiscovery(peripheral: device)
        }*/
        //connect(to: peripheral)
    }
}
