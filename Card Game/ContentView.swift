//
//  ContentView.swift
//  Card Game
//
//  Created by Moazam Mir on 2/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            ForEach(0..<4){ index in
                HStack
                {
                
                    ForEach(0..<4) { index in
                        CardView(isFaceUp: true)
                    }
                }
            }
         }
   
        .foregroundColor(.orange)
        .padding()
    }
    
    
}

struct CardView : View {
    var isFaceUp : Bool
    var body : some View
    {
        ZStack {
            if isFaceUp
            {
                            RoundedRectangle(cornerRadius: 10).fill(Color.white)
                            RoundedRectangle(cornerRadius: 10).stroke()
                            Text("👻").font(Font.largeTitle)
            }
            else
            {
                RoundedRectangle(cornerRadius: 10).fill()

            }
            



            }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
