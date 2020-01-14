//
//  FeedData.swift
//  jasper
//
//  Created by User14 on 2020/1/14.
//  Copyright © 2020 User07. All rights reserved.
//

import Foundation

struct Media: Decodable {
    let m: URL
}
struct Item: Decodable {
    let title: String
    let media: Media
}
struct FeedData: Decodable {
    let items: [Item]
}
