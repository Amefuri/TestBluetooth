//
//  ViewController.swift
//  TestBluetooth
//
//  Created by peerapat atawatana on 5/26/2560 BE.
//  Copyright © 2560 DaydreamClover. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    // MARK: Propetry
    
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    var deviceList:Dictionary<String,CBPeripheral> = [:]
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView:UITableView!
    
    // MARK: IBAction
    
    @IBAction func didClickOnStart() {
        print("Start Scan")
        startScan()
    }
    
    @IBAction func didClickOnStop() {
        print("Stop Scan")
        stopScan()
        deviceList = [:]
        tableView.reloadData()
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBluetoothManager()
    }

    // MARK: Setup
    
    func setupBluetoothManager() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: Function

    func startScan() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopScan() {
        centralManager.stopScan()
    }
    
    func connect(to peripheral:CBPeripheral) {
        centralManager.connect(peripheral, options: nil)
    }
    
    func disconnect(from peripheral:CBPeripheral) {
        centralManager.cancelPeripheralConnection(peripheral)
    }
    
    func startDiscovery(peripheral:CBPeripheral) {
        peripheral.discoverServices(nil)
    }
}

