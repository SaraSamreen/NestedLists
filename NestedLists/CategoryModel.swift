//
//  Category.swift
//  NestedLists
//
//  Created by Mac on 19/05/2026.
//

struct CategoryItem {
    let imageName: String
}

struct Category {
    let title: String
    let description: String
    let imageName: String
    let items: [CategoryItem]
    var isExpanded: Bool = false
}
