//
//  Decorator.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit

typealias Decoration<T> = (T) -> Void

struct Decorator<T> {
    
    let object: T
    
    func apply(_ decorations: Decoration<T>...) -> Void {
        decorations.forEach({ $0(object) })
    }
}

protocol DecoratorCompatible {
    associatedtype DecoratorCompatibleType
    var decorator: Decorator<DecoratorCompatibleType> { get }
}

extension DecoratorCompatible {
    var decorator: Decorator<Self> {
        return Decorator(object: self)
    }
}
