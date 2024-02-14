//
//  UITableViewCell+Reusable.swift
//  optima
//
//  Created by Mariya Aliyeva on 11.12.2023.
//

import Foundation
import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
	
	static var reuseID: String {
		return String(describing: self)
	}
}
