//
// Created for NavStackIntro1
// by Stewart Lynch on 2022-08-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct IntroView: View {
    let items = ["🍎", "🍐", "🍋", "🍑", "🍌", "🍉", "🍇", "🍒", "🫐", "🍓"]
    var body: some View {
        NavigationStack {
            VStack {
                List(items, id: \.self) { fruit in
                    NavigationLink("I choose \(fruit)", value: fruit)
                }
                HStack {
                    NavigationLink("Tap to show preferred", value: items[7])
                    NavigationLink(value: "😀") {
                        Text("Other")
                    }
                }
                    .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Fruit of the Day")
            .navigationDestination(for: String.self) { stringValue in
                ChosenView(item: stringValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

struct ChosenView: View {
    let item: String
    var body: some View {
        Text("You chose \(item)")
            .font(.largeTitle)
    }
}
