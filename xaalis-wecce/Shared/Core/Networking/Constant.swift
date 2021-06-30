//
//  Constant.swift
//  xaalis-wecce (iOS)
//
//  Created by Mouhamed Dieye on 30/06/2021.
//

import Foundation

public enum Constant: String, CaseIterable {
    case development
    case staging
    case production
}

extension Constant {
    var baseUrl: String {
        switch self {
        case .development:
            return "https://api.exchangerate.host"
        case .staging:
            return "https://api.exchangerate.host"
        case .production:
            return "https://api.exchangerate.host"
        }
    }
}
