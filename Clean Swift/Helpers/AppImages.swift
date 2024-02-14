//
//  AppImages.swift
//  optima
//
//  Created by Islam Temirbek on 10.01.2024.
//

import UIKit

// MARK: - AppImageProtocol
protocol AppImageProtocol {
    var rawValue: String { get }
}

// MARK: - AppImageProtocol Extension
extension AppImageProtocol {
    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

// MARK: - AppImage enum
enum AppImages: String, AppImageProtocol {
    case document
    case done
    case terminal
    case bankomat
    case office
    case sun
    case id = "idImage"
    case face = "smile"
    case hair
    case screen = "fullscreen"
    case glasses = "glasses"
    case flagKG
    case down
}
