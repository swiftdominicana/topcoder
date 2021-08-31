//
//  DeveloperDetailView.swift
//  DeveloperDetailView
//
//  Created by Libranner Leonel Santos Espinal on 22/8/21.
//

import SwiftUI

struct DeveloperDetailView: View {
  let developer: Developer
  var body: some View {
    ZStack {

    }
  }
}

struct DeveloperDetailView_Previews: PreviewProvider {
  static var previews: some View {
    DeveloperDetailView(developer: Developer(id: 1, name: "Test Dev", stars: 3, imageURL: nil))
      .preferredColorScheme(.dark)
  }
}
