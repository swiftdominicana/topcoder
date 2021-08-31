//
//  TopCoderApp.swift
//  TopCoder
//
//  Created by Libranner Leonel Santos Espinal on 20/8/21.
//

import SwiftUI

@main
struct TopCoderApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        CoderList()
          .tabItem {
            Image(systemName: "person.3")
            Text("Coders")
          }
        RepositoriesView()
          .tabItem {
            Image(systemName: "list.dash")
            Text("Repositories")
          }
        CanvasView()
          .tabItem {
            Image(systemName: "hand.draw")
            Text("Canvas")
          }
        CardView()
          .tabItem {
            Image(systemName: "paperplane")
            Text("Card")
          }
      }
      .onAppear {
        UITabBar.appearance().backgroundColor = UIColor.white
      }
    }
  }
}
