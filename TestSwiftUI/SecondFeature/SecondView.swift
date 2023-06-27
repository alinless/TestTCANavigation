//
//  SecondView.swift
//  TestSwiftUI
//

import ComposableArchitecture
import SwiftUI

public struct SecondView: View {

   var store: StoreOf<SecondFeature>

   public init(store: StoreOf<SecondFeature>) {
      self.store = store
   }

   public var body: some View {
      ZStack {
         Color.red.ignoresSafeArea()
         WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
               Text("SecondView")
               Button {
                  viewStore.send(.showThird)
               } label: {
                  Text("to third view")
               }

            }
         }
      }
   }
}

// MARK: - Preview
struct SecondView_Previews: PreviewProvider {
   static var previews: some View {
      SecondView(
         store: .init(
            initialState: .init(),
            reducer: SecondFeature()
         )
      )
   }
}
