//
//  TabModel.swift
//  ScrollTabbar
//
//  Created by Зверик Борис Станиславович on 22.04.2024.
//

import Foundation

struct TabModel: Identifiable {
    private(set) var id: Tab
    var size: CGSize = .zero
    var minX: CGFloat = .zero
    
    enum Tab: String, CaseIterable {
        case research = "Research"
        case deployment = "Deployment"
        case analytics = "Analytics"
        case audience = "Audience"
        case privacy = "Pricacy"
    }
}
