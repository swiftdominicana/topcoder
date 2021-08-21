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
              Text("Repo List")
                  .tabItem {
                      Image(systemName: "list.dash")
                      Text("Repositories")
                  }
              Text("Dashboard")
                  .tabItem {
                      Image(systemName: "chart.bar")
                      Text("Dashboard")
                  }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
          }

        }
    }
}
