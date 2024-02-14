//
//  AppFonts.swift
//  optima
//
//  Created by Islam Temirbek on 10.01.2024.
//

import UIKit

// MARK: - AppFontProtocol
protocol AppFontProtocol {
    var rawValue: String { get }
}

// MARK: - AppFontProtocol Extension
extension AppFontProtocol {
    func s12() -> UIFont {
        return apply(size: 12)
    }
    
    func s13() -> UIFont {
        return apply(size: 13)
    }
    
    func s14() -> UIFont {
        return apply(size: 14)
    }
    
    func s15() -> UIFont {
        return apply(size: 15)
    }
    
    func s16() -> UIFont {
        return apply(size: 15)
    }
    
    func s18() -> UIFont {
        return apply(size: 18)
    }
    
    func s20() -> UIFont {
        return apply(size: 20)
    }
    
    func s22() -> UIFont {
        return apply(size: 22)
    }
    
    func s24() -> UIFont {
        return apply(size: 24)
    }
    
    func s28() -> UIFont {
        return apply(size: 28)
    }
    
    func s32() -> UIFont {
        return apply(size: 32)
    }
    
    func s38() -> UIFont {
        return apply(size: 32)
    }
    
    func s40() -> UIFont {
        return apply(size: 40)
    }
    
    func s48() -> UIFont {
        return apply(size: 48)
    }
}

// MARK: - AppFontProtocol Extension
extension AppFontProtocol {
    private func apply(size value: CGFloat) -> UIFont {
        var font = UIFont.systemFont(ofSize: 14, weight: .regular)
        if rawValue == "regular" {
            font = UIFont.systemFont(ofSize: value, weight: .regular)
        } else if rawValue == "medium" {
            font = UIFont.systemFont(ofSize: value, weight: .medium)
        } else if rawValue == "semibold" {
            font = UIFont.systemFont(ofSize: value, weight: .semibold)
        } else if rawValue == "bold" {
            font = UIFont.systemFont(ofSize: value, weight: .bold)
        }
        return font
    }
}

// MARK: - AppFont enum
enum AppFont: String, AppFontProtocol {
    case regular
    case medium
    case semibold
    case bold
}
