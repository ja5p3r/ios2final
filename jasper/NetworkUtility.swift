//
//  NetworkUtility.swift
//  jasper
//
//  Created by User14 on 2020/1/14.
//  Copyright © 2020 User07. All rights reserved.
//

import UIKit

struct NetworkUtility {
    static func downloadImage(url: URL, handler: @escaping (UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                handler(image)
            } else {
                handler(nil)
            }
        }
        task.resume()
    }
}
