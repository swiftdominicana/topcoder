//
//  CardView.swift
//  CardView
//
//  Created by Libranner Leonel Santos Espinal on 21/8/21.
//

import SwiftUI

struct CardView: View {
  @State private var message = ""
  @State private var recipient = ""
  @State var showRecipient: Bool = false
  @State var sent: Bool = false
  @State var viewState = CGSize.zero

  var body: some View {
    VStack(alignment: .center, spacing: 40) {
      if !sent {
        Text("TODO: Add views")
      }
      else {
        VStack(alignment: .center) {
          Image(systemName: "paperplane")
          Text("Your card has been sent")
        }
      }
    }
  }

  private func animateView(showRecipient: Bool) {
    withAnimation(.spring(response: 1.5, dampingFraction: 0.9, blendDuration: 0)) {
      self.showRecipient = showRecipient
    }
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
