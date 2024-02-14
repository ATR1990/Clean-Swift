//
//  AppColors.swift
//  optima
//
//  Created by Islam Temirbek on 10.01.2024.
//

import UIKit

// MARK: - AppColorProtocol
protocol AppColorProtocol {
    var rawValue: String { get }
}

// MARK: - AppColorProtocol Extension
extension AppColorProtocol {
    
    var uiColor: UIColor {
        guard let color = UIColor.init(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return color
    }
    
    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

// MARK: - AppColor enum
enum AppColor: String, AppColorProtocol {
    case black
    case white
    case primaryDark
    case primaryGrey
    case primaryGreyMid
    case primaryGreyLight
    case primaryRed
    case lightThemeGrey
    case secondaryOrange
    case textAccent
    case additionalError
    case textGrey
    case textError
    case backgroundColor
    case primaryBackground
    case primaryButton
    case countLabelBackground
    case secondaryBackground
    case primaryBlack
}
