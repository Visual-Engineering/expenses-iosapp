//
//  String+Localized.swift
//  Napptilus Expenses
//
//  Created by Lluis Martinez on 05/03/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
