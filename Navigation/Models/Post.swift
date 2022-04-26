//
//  Post.swift
//  Navigation
//
//  Created by Роман on 23.02.2022.
//

import Foundation

struct Posts: Equatable {
    let author, description, image, id: String
    var likes, views: Int
}

var dataSource: [Posts] = []
