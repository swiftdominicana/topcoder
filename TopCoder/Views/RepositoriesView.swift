//
//  RepositoriesView.swift
//  RepositoriesView
//
//  Created by Libranner Leonel Santos Espinal on 22/8/21.
//

import SwiftUI

enum Origin: String {
  case apple
  case libranner
}

struct RepositoriesView: View {
  @State private var repositories = [Repository]()
  @State private var origin: Origin = .libranner

  var body: some View {
    NavigationView {
      VStack {

      }
      .navigationTitle("Repositories")
    }
  }
}

struct RepositoriesView_Previews: PreviewProvider {
  static var previews: some View {
    RepositoriesView()
  }
}
