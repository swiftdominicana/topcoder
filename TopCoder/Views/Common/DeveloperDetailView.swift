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
      VStack {
        CoderProfileImageView(imageURL: developer.imageURL)
        Text(developer.name)
        HStack {
          ForEach(0..<5) { i in
            Image(systemName: developer.stars >= i ? "star.fill" : "star")
          }
        }
      }
      .foregroundColor(.secondary)
      .padding()
    }
    .frame(maxWidth: 300, maxHeight: 200)
    .background(.ultraThinMaterial)
    .cornerRadius(20)
    .shadow(color: Color(.gray).opacity(0.3), radius: 6, x: 0, y: 5)
  }
}

struct DeveloperDetailView_Previews: PreviewProvider {
  static var previews: some View {
    DeveloperDetailView(developer: Developer(id: 1, name: "Test Dev", stars: 3, imageURL: nil))
  }
}
