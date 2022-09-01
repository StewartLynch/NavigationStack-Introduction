//
// Created for NavStackIntro1
// by Stewart Lynch on 2022-08-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//
import SwiftUI

struct Intro2View: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                NavigationLink(Author.sample[0].name, value: Author.sample[0].name)
                NavigationLink(Author.sample[1].name, value: Author.sample[1].numBooks)
                NavigationLink(Author.sample[2].name, value: Author.sample[2].color)
                NavigationLink(Author.sample[3].name, value: Author.sample[3])
                Button("Random") {
                    let randomAuthor = Author.sample.randomElement()!
                    path.append(randomAuthor)
                }
            }
            .buttonStyle(.bordered)
            .navigationTitle("NavigationLinks")
            .navigationDestination(for: String.self) { stringValue in
                Text(stringValue).font(.largeTitle)
            }
            .navigationDestination(for: Int.self) { intValue in
                Text("\(intValue) books").font(.largeTitle)
            }
            .navigationDestination(for: Color.self) { colorValue in
                colorValue
            }
            .navigationDestination(for: Author.self) { authorValue in
                ZStack {
                    authorValue.color
                    VStack {
                        Text(authorValue.name)
                        Text("\(authorValue.numBooks) books")
                    }
                    .font(.largeTitle)
                }
            }
        }
    }
}

struct Intro2View_Previews: PreviewProvider {
    static var previews: some View {
        Intro2View()
    }
}

struct Author: Identifiable, Hashable {
    let name: String
    let numBooks: Int
    let color: Color
    var id: String {
        name
    }
    
    static var sample: [Author] {
        [
            .init(name: "Mark Twain", numBooks: 28, color: .orange),
            .init(name: "Robert Ludlum", numBooks: 27, color: .red),
            .init(name: "Robert Harris", numBooks: 18, color: .purple),
            .init(name: "Jane Austen", numBooks: 7, color: .cyan),
            .init(name: "Agatha Christie", numBooks: 66, color: .blue)
        ]
    }
}
