//
//  FirstView.swift
//  TestSwiftUI
//

import ComposableArchitecture
import SwiftUI

public struct FirstView: View {

   var store: StoreOf<FirstFeature>

   public init(store: StoreOf<FirstFeature>) {
      self.store = store
   }

   public var body: some View {
      NavigationStackStore(
         self.store.scope(state: \.path, action: { .path($0) })
      ) {
         ZStack {
            Color.green
            WithViewStore(self.store, observe: { $0 }) { viewStore in
               VStack {
                  Text("FirstView")

                  Button.init {
                     viewStore.send(.showSecond)
                  } label: {
                     Text("To second view")
                  }

               }
            }
         }
      } destination: { state in
         switch state {
         case .second:
            CaseLet(
               state: /FirstFeature.Path.State.second,
               action: FirstFeature.Path.Action.second,
               then: SecondView.init(store:)
            )
         case .third:
            CaseLet(
               state: /FirstFeature.Path.State.third,
               action: FirstFeature.Path.Action.third,
               then: ThirdView.init(store:)
            )
         }
      }
   }
}

struct OneView_Previews: PreviewProvider {
   static var previews: some View {
      FirstView(
         store: .init(
            initialState: .init(),
            reducer: FirstFeature()
         )
      )
   }
}
