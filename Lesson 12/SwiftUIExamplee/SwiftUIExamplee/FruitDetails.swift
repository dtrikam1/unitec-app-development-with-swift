//
//  FruitDetails.swift
//  SwiftUIExamplee
//
//  Created by Hayden Do on 15/10/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import SwiftUI

struct FruitDetails: View {
    var fruit: Fruit
    
    var body: some View {
        VStack {
            VStack {
                Text(fruit.fruitEmoji).font(.system(size: 120)).shadow(radius: 10)
            }
            VStack(alignment: .leading) {
                Text(fruit.description).font(.subheadline).foregroundColor(.gray)
                Text("$\(fruit.price)").font(.subheadline).foregroundColor(.gray)
                Spacer()
            }
        }.navigationBarTitle(fruit.name)
    }
}
