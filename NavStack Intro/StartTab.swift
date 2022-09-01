//
// Created for NavStackIntro1
// by Stewart Lynch on 2022-08-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView() {
            IntroView()
                .tabItem {
                    Label("Introduction",systemImage: "1.circle.fill")
                }
            Intro2View()
                .tabItem {
                    Label("NavigationLinks",systemImage: "2.circle.fill")
                }
        }
    }
}

struct StartTab_Previews: PreviewProvider {
    static var previews: some View {
        StartTab()
    }
}
