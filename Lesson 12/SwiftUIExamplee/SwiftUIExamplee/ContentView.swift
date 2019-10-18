//
//  ContentView.swift
//  SwiftUIExamplee
//
//  Created by Hayden Do on 14/10/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import SwiftUI

struct MyList: Identifiable {
    var id: Int
    let word: String
}

struct ContentView: View {
    let fruitList: [Fruit] = [Fruit(id: 0, fruitEmoji: "🍉", name: "Watermelon", description: "This is a watermelon", price: "10.50"), Fruit(id: 1, fruitEmoji: "🍇", name: "Grapes", description: "Got any grapes?", price: "5.30"), Fruit(id: 2, fruitEmoji: "🥝", name: "Kiwi Fruit", description: "This is a kiwi fruit", price: "3.20"), Fruit(id: 3, fruitEmoji: "🍓", name: "Strawberry", description: "This is a strawberry", price: "9.90")]
    
    var body: some View {
        NavigationView {
            List(fruitList) { fruit in
                NavigationLink(destination: FruitDetails(fruit: fruit)) {
                    HStack {
                        Text(fruit.fruitEmoji).font(.system(size: 50)).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                        VStack(alignment: .leading) {
                            Text(fruit.name).font(.headline)
                            Text(fruit.description).font(.body)
                        }
                    }
                }
            }.navigationBarTitle(Text("Fruit List"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Fruit: Identifiable {
    let id: Int
    let fruitEmoji: String
    let name: String
    let description: String
    let price: String
}
