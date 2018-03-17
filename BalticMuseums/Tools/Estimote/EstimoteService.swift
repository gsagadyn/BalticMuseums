//
//  EstimoteService.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

protocol EstimoteServiceDelegate: class {
    func didChangedAuthorizaiton(status: CLAuthorizationStatus)
    func didFindBeaconZone()
    func didDiscover(beaconId: Int)
    func didLoseBeaconZone()
}

internal class EstimoteService: NSObject {
    weak var delegate: EstimoteServiceDelegate?
    var foundedPlaces = [Int]()
    var latestPlace: Int?

    private let beaconManager = ESTBeaconManager()
    private let regionUUID =  UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
    private lazy var beacons: [CLBeaconRegion] = [
        CLBeaconRegion(proximityUUID: regionUUID,
                       identifier: "ee6a20a898aa"),
        CLBeaconRegion(proximityUUID: regionUUID,
                       identifier: "ca2f6894244e")]

    required override init() {
        super.init()

        beaconManager.delegate = self
        beaconManager.requestAlwaysAuthorization()

        beacons.forEach {
            beaconManager.startMonitoring(for: $0)
            beaconManager.startRangingBeacons(in: $0)
        }
    }
}

extension EstimoteService: ESTBeaconManagerDelegate {
    func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
        delegate?.didFindBeaconZone()
    }

    func beaconManager(_ manager: Any, didExitRegion region: CLBeaconRegion) {
        delegate?.didLoseBeaconZone()
    }

    func beaconManager(_ manager: Any, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        guard let nearestBeacon = beacons.first?.major.intValue else {
            return
        }

        if nearestBeacon != latestPlace {
            latestPlace = nearestBeacon
            print(nearestBeacon)
        }

        guard !foundedPlaces.contains(nearestBeacon) else {
            return
        }
        foundedPlaces.append(nearestBeacon)
        delegate?.didDiscover(beaconId: nearestBeacon)
    }

    func beaconManager(_ manager: Any, didChange status: CLAuthorizationStatus) {
        delegate?.didChangedAuthorizaiton(status: status)
    }
}
