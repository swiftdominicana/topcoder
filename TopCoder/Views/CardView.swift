//
//  ProfileView.swift
//  ProfileView
//
//  Created by Libranner Leonel Santos Espinal on 21/8/21.
//

import SwiftUI

struct CardView: View {
  enum Field: Hashable {
    case messageField
    case recipientField
  }
  @State private var message = ""
  @State private var recipient = ""
  @State var showRecipient: Bool = false
  @State var sent: Bool = false
  @State var viewState = CGSize.zero
  @FocusState private var focusedField: Field?

  var body: some View {
    VStack(alignment: .center, spacing: 40) {
      if !sent {
        ZStack(alignment: .center) {
          Text(message)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            .opacity(focusedField == .messageField ? 1 : 0)

          Text(recipient)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
            .padding()
            .opacity(focusedField == .recipientField ? 1 : 0)
        }
        .zIndex(1)
        .frame(maxWidth: 300, maxHeight: 200)
        .background(showRecipient ? Color.indigo : Color.cyan)
        .cornerRadius(20)
        .shadow(color: Color(.gray).opacity(0.3), radius: 5, x: 10, y: 10)
        .rotation3DEffect(.degrees(showRecipient ? 180.0 : 0.0), axis: (x: 0, y: -1, z: 0))
        .offset(x: viewState.width, y: viewState.height)
        .onTapGesture {
          withAnimation(.spring(response: 1.5, dampingFraction: 0.9, blendDuration: 0)) {
            showRecipient.toggle()
            focusedField = showRecipient ? .recipientField : .messageField
          }
        }
        VStack(spacing: 20) {
          TextField("Message", text: $message)
            .focused($focusedField, equals: .messageField)
            .textFieldStyle(.roundedBorder)
            .submitScope(message.count > 1)
            .onSubmit {
              focusedField = .recipientField
            }
            .onTapGesture {
              animateView(showRecipient: false)
            }

          TextField("Recipient", text: $recipient)
            .focused($focusedField, equals: .recipientField)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
              focusedField = .messageField
            }
            .onTapGesture {
              animateView(showRecipient: true)
            }
        }
        .padding([.leading, .trailing], 40)

        Button(action: sendCard) {
          Label("Send", systemImage: "paperplane")
            .labelStyle(.titleAndIcon)
        }
        .tint(.teal)
        .buttonStyle(.borderedProminent)
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

  private func sendCard() {
    guard !message.isEmpty else {
      focusedField = .messageField
      animateView(showRecipient: false)
      return
    }

    guard !recipient.isEmpty else {
      focusedField = .recipientField
      animateView(showRecipient: true)
      return
    }

    sent = true
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
  }
}
