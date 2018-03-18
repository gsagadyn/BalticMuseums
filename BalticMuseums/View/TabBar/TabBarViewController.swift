//
//  TabBarViewController.swift
//  BalticMuseums
//
//  Created by Grzegorz Sagadyn on 16.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class TabBarViewController: UITabBarController, UIStoryboardInstantiate {
    // MARK: - Private Properties

    private let controllersData: [ControllerData] = [
		ControllerData(controller: ViewStore.shared[NewsFeedViewController.self],
					   image: UIImage(named: "if_files-folders-66_808606"),
					   title: "Aktualności",
					   isCustomActionEnabled: false),
		ControllerData(controller: ViewStore.shared[MapViewController.self],
					   image: UIImage(named: "if_map-marker_1608533"),
					   title: "Mapa",
					   isCustomActionEnabled: false),
		ControllerData(controller: ViewStore.shared[Tab3ViewController.self],
					   image: UIImage(named: "if_SVG_LINE_TECHNOLOGY-09_2897342"),
					   title: "AR",
					   isCustomActionEnabled: false),
        ControllerData(controller: ViewStore.shared[QuizNavigationViewController.self],
                       image: UIImage(named: "if_ic_format_list_bulleted_48px_352389"),
                       title: "Quiz",
                       isCustomActionEnabled: false)
    ]

    private struct ControllerData {
        let controller: UIViewController
        let image: UIImage?
        let title: String
        var isCustomActionEnabled: Bool
    }

    // MARK: - Initialization

    internal override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        prepareControllers()
        prepareTabs()
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "main")
        tabBar.unselectedItemTintColor = .gray
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    internal func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        tabBarSlideAnimation(to: viewController)
        return true
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

private extension TabBarViewController {
    private func tabBarSlideAnimation(to viewController: UIViewController) {
        let toView: UIView = viewController.view

        guard let fromView = selectedViewController?.view,
            viewController != selectedViewController,
            let tappedIndex = viewControllers?.index(of: viewController),
            fromView != toView,
            let fromViewSuperview = fromView.superview else {
                return
        }

        fromViewSuperview.addSubview(toView)

        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = tappedIndex > selectedIndex
        let offset = scrollRight ? screenWidth : -screenWidth
        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)

        view.isUserInteractionEnabled = false

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
            toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
        }, completion: { _ in
            fromView.removeFromSuperview()
            self.selectedIndex = tappedIndex
            self.view.isUserInteractionEnabled = true
        })
    }

    private func prepareControllers() {
        let controllers: [UIViewController] = controllersData.map { $0.controller }
        viewControllers = controllers
    }

    private func prepareTabs() {
        let normalTextAttributes: [NSAttributedStringKey: Any] = [.foregroundColor: UIColor.white]

        var selectedTextAttributes: [NSAttributedStringKey: Any] = normalTextAttributes
        selectedTextAttributes[.foregroundColor] = UIColor.gray

        viewControllers?.enumerated().forEach { (index, _) in
            let tabBarItem = tabBar.items?[index]
			tabBarItem?.image = controllersData[index].image?.withRenderingMode(.alwaysTemplate)
            tabBarItem?.title = controllersData[index].title
            tabBarItem?.setTitleTextAttributes(normalTextAttributes, for: .normal)
            tabBarItem?.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        }
    }
}
