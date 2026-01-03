//
//  IGFontStyle.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit
enum IGFontStyle: String, CaseIterable {
    case classic     = "Classic"
    case modern      = "Modern"
    case typewriter  = "Typewriter"
    case strong      = "Strong"
    case meme        = "Meme"

    case elegant     = "Elegant"
    case directional = "Directional"
    case literature  = "Literature"

    case signature   = "Signature"
    case editor      = "Editor"
    case bubble      = "Bubble"
    case deco        = "Deco"
    case poster      = "Poster"
    case squeeze     = "Squeeze"
    case rosalia     = "Rosalia"
}

extension IGFontStyle {
    static let sizeDefault: CGFloat = 30
    
    func font(size: CGFloat = IGFontStyle.sizeDefault) -> UIFont {
        switch self {

        case .classic:
            return .systemFont(ofSize: size)

        case .modern:
            return .systemFont(ofSize: size, weight: .medium)

        case .typewriter:
            return UIFont(name: "Courier", size: size)
                ?? .monospacedSystemFont(ofSize: size, weight: .regular)

        case .strong:
            return .boldSystemFont(ofSize: size)

        case .meme:
            return .systemFont(ofSize: size, weight: .black)

        case .elegant:
            return UIFont(name: "Didot", size: size)
                ?? .systemFont(ofSize: size)

        case .directional:
            return .systemFont(ofSize: size, weight: .semibold)

        case .literature:
            return UIFont(name: "TimesNewRomanPSMT", size: size)
                ?? .systemFont(ofSize: size)

        case .signature:
            return UIFont(name: "SnellRoundhand", size: size)
                ?? .italicSystemFont(ofSize: size)

        case .editor:
            return .systemFont(ofSize: size)

        case .bubble:
            return .systemFont(ofSize: size, weight: .heavy)

        case .deco:
            return UIFont(name: "Copperplate", size: size)
                ?? .systemFont(ofSize: size)

        case .poster:
            return .systemFont(ofSize: size, weight: .bold)

        case .squeeze:
            return UIFont(name: "HelveticaNeue-CondensedBold", size: size) ?? .systemFont(ofSize: size)

        case .rosalia:
            return .systemFont(ofSize: size, weight: .light)
        }
    }
}

