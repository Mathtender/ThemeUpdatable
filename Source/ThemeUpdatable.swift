//
//  ThemeUpdatable.swift
//  ThemeUpdatable
//
//  Created by Mathtender on 19.09.21.
//

import UIKit

protocol ThemeUpdatable: AnyObject {
    var userInterfaceStyle: UIUserInterfaceStyle { get }
    var statusBarStyle: UIStatusBarStyle { get }
}

extension ThemeUpdatable {
    var userInterfaceStyle: UIUserInterfaceStyle {
        return Theme.shared.userInterfaceStyle
    }
    var statusBarStyle: UIStatusBarStyle {
        return Theme.shared.statusBarStyle
    }
}
