//
//  Array+Only.swift
//  Card Game
//
//  Created by Moazam Mir on 5/22/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
