//
//  FirstFeature.swift
//  TestSwiftUI
//

import ComposableArchitecture
import Foundation

public struct FirstFeature: ReducerProtocol {

   public struct State: Equatable {
      var path: StackState<Path.State> = StackState()

      var alert: AlertState<Action>?
      var isRequestInFlight = false

      public init() {

      }
   }

   public enum Action: Equatable {
      case path(StackAction<Path.State, Path.Action>)
      case showSecond
      case showThird
   }

   public var body: some ReducerProtocolOf<Self> {

      Reduce { state, action in
         switch action {
         case .showSecond:
            state.path.append(.second())
            return .none

         case .showThird:
            state.path.append(.third())
            return .none

         case let .path(.element(id: _, action: .second(.delegate(action)))):
            switch action {
            case .thirdRequested:
               state.path.popLast()
               state.path.append(.third())
            }
            return .none

         case .path:
            return .none
         }

      }
      .forEach(\.path, action: /Action.path) {
         Path()
      }

   }

   public struct Path: ReducerProtocol {

      public enum State: Equatable {
         case second(SecondFeature.State = .init())
         case third(ThirdFeature.State = .init())
      }

      public enum Action: Equatable {
         case second(SecondFeature.Action)
         case third(ThirdFeature.Action)
      }

      public var body: some ReducerProtocolOf<Self> {
         Scope(state: /State.second, action: /Action.second) {
            SecondFeature()
         }
         Scope(state: /State.third, action: /Action.third) {
            ThirdFeature()
         }
      }

   }

}
