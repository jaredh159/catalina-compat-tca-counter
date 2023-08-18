import ComposableArchitecture
import SwiftUI

struct CounterFeature: Reducer {
  struct State {
    var count = 0
  }

  enum Action {
    case incrButtonTapped
    case decrButtonTapped
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .incrButtonTapped:
        state.count += 1
        return .none

      case .decrButtonTapped:
        state.count -= 1
        return .none
      }
    }
  }
}

struct ContentView: View {
  var store: StoreOf<CounterFeature>

  var body: some View {
    WithViewStore(self.store, observe: \.count) { viewStore in
      HStack {
        Button("-") { viewStore.send(.decrButtonTapped) }
        Text("\(viewStore.state)").padding()
        Button("+") { viewStore.send(.incrButtonTapped) }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(store: Store(initialState: CounterFeature.State()) {
      CounterFeature()
    })
  }
}
