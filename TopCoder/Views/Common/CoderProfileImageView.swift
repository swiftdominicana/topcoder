//
//  CoderProfileImageView.swift
//  CoderProfileImageView
//
//  Created by Libranner Leonel Santos Espinal on 21/8/21.
//

import SwiftUI

struct CoderProfileImageView: View {
  let imageURL: URL?
  
  var body: some View {
    AsyncImage(url: imageURL, transaction: Transaction(animation: .easeInOut)) { phase in
      switch phase {
      case .empty:
        Image(systemName: "person")
      case .success(let image):
        image
          .resizable()
          .scaledToFill()
          .frame(maxWidth: 40, maxHeight: 40)
          .clipShape(Circle())
          .transition(.scale(scale: 0.1, anchor: .center))
      case .failure:
        Image(systemName: "exclamationmark.icloud")
      @unknown default:
        EmptyView()
      }
    }
  }
}
