//
//  Theme.swift
//  ThemeUpdatable
//
//  Created by Mathtender on 19.09.21.
//

import UIKit

class Theme {

    // MARK: - Parameters

    public static let shared = Theme()

    private(set) var currentTheme: ThemeType
    private(set) var statusBarStyle: UIStatusBarStyle = .default
    private(set) var userInterfaceStyle: UIUserInterfaceStyle = .unspecified

    // MARK: - Initialization

    private init() {
        // Load theme from your storage here, example:
        // currentTheme = UserDefaults.appTheme ?? .system
        currentTheme = .system
        updateInterfaceStyle()
    }

    // MARK: - Methods

    func updateInterfaceStyle(_ style: UIUserInterfaceStyle? = nil) {
        if let style = style {
            guard currentTheme == .system, style != userInterfaceStyle else { return }
            userInterfaceStyle = style
            statusBarStyle = style == .light ? .darkContent : .lightContent
        } else {
            switch currentTheme {
            case .system:
                userInterfaceStyle = UITraitCollection.current.userInterfaceStyle
                statusBarStyle = userInterfaceStyle == .light ? .darkContent : .lightContent
            case .light:
                userInterfaceStyle = .light
                statusBarStyle = .darkContent
            case .dark:
                userInterfaceStyle = .dark
                statusBarStyle = .lightContent
            }
        }
        NotificationCenter.default.post(Notification(name: .init("UserInterfaceStyleUpdated")))
    }

    func set(theme: ThemeType, withSaving: Bool = true) {
        guard currentTheme != theme else { return }
        self.currentTheme = theme
        if withSaving {
            // Save theme to your storage here, example:
            // UserDefaults.appTheme = theme
        }

        updateInterfaceStyle()
    }
}
