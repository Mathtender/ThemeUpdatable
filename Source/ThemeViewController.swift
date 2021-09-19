//
//  ThemeViewController.swift
//  ThemeUpdatable
//
//  Created by Mathtender on 19.09.21.
//

import UIKit

class ThemeViewController: UIViewController, ThemeUpdatable {

    // MARK: - Parameters

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userInterfaceStyleUpdated),
            name: .init("UserInterfaceStyleUpdated"),
            object: nil)
        userInterfaceStyleUpdated()
    }

    // MARK: - Theme 

    @objc func userInterfaceStyleUpdated() {
        self.setNeedsStatusBarAppearanceUpdate()

        // Apply new style here
        switch userInterfaceStyle {
        case .dark:
            view.backgroundColor = .black
        case .light:
            view.backgroundColor = .white
        case .unspecified:
            view.backgroundColor = .red
        }
    }
}

// MARK: - Dark mode switching

extension ThemeViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            Theme.shared.updateInterfaceStyle(traitCollection.userInterfaceStyle)
        }
    }
}
