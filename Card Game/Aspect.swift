//
//  Aspect.swift
//  Card Game
//
//  Created by Moazam Mir on 5/21/21.
//

import SwiftUI

struct Aspect: View {
    var body: some View {
        Color.black
            .ignoresSafeArea()
            .aspectRatio(2/1, contentMode: .fit)
    }
}

struct Aspect_Previews: PreviewProvider {
    static var previews: some View {
        Aspect()
    }
}
