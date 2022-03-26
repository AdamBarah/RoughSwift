//
//  Drawable.swift
//  RoughSwift
//
//  Created by khoa on 19/03/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import Foundation

/// Information from Generator about the drawble to render
public struct Drawable {
    public let shape: String
    public let sets: [OperationSet]
    public let options: Options
}

public extension Drawable {
    init?(dictionary: JSONDictionary) {
        guard
            let shape = dictionary["shape"] as? String,
            let sets = dictionary["sets"] as? JSONArray,
            let options = dictionary["options"] as? JSONDictionary
        else {
            return nil
        }

        self.init(
            shape: shape,
            sets: sets.compactMap({ OperationSet.from(dictionary: $0) }),
            options: Options(dictionary: options)
        )
    }
}