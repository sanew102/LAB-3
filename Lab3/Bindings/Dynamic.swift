//
//  Dynamic.swift
//  Lab3
//
//  Created by Нурым Нагиметов on 23.04.2022.
//

import Foundation
class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(_ v: T) {
        value = v
    }
}
