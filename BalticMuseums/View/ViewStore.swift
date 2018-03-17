//
//  ViewStore.swift
//  BalticMuseums
//
//  Created by Kamil Szuba on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import Foundation
import Snapify

class ViewStore: DependencyStore {
    internal static let shared = ViewStore()

    internal required init() {
        super.init()
        registerModule(DefaultViewStoreModule())
    }
}

// ----------------------------------------------------------------------------------------------------------------
// MARK: - Default Module
// ----------------------------------------------------------------------------------------------------------------

private class DefaultViewStoreModule: IDependencyStoreModule {
    fileprivate func load(to dependencyStore: DependencyStore) {
        dependencyStore.bind(closure: { () -> Tab1ViewController in
            let vc = Tab1ViewController.instantiate()
            vc.presenter = Tab1Presenter(Tab1Navigator(vc))
            return vc
        })

        dependencyStore.bind(closure: { () -> Tab2ViewController in
            let vc = Tab2ViewController.instantiate()
            vc.presenter = Tab2Presenter(Tab2Navigator(vc))
            return vc
        })

        dependencyStore.bind(closure: { () -> Tab3ViewController in
            let vc = Tab3ViewController.instantiate()
            return vc
        })

        dependencyStore.bind(closure: { () -> Tab4ViewController in
            let vc = Tab4ViewController.instantiate()
            vc.presenter = Tab4Presenter(Tab4Navigator(vc))
            return vc
        })
    }
}
