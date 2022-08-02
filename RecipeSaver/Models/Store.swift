import SwiftUI
import Combine

public final class Store<StateType>: ObservableObject where StateType: StateMachine {
    
    private let initialState: StateType
    private var subsequentStates: [StateType] = []

    public let objectWillChange = PassthroughSubject<Void, Never>()
    
    public init(state: StateType) {
        initialState = state
    }
    
    var allStates: [StateType] {
        [[initialState], subsequentStates].flatMap({ $0 })
    }
    
    var stateCount: Int {
        1 + subsequentStates.count
    }
    
    var sliderEditing: Bool = false
    
    var currentStateIndex: Int = 0 {
        didSet {
            withAnimation {
                objectWillChange.send(())
            }
        }
    }
    
    public var state: StateType {
        return allStates[currentStateIndex]
    }
    
    public func dispatch(event: StateType.Event) {
        var newState = state
        newState.update(with: event)
        if (!sliderEditing) {
            subsequentStates.append(newState)
            currentStateIndex = stateCount - 1
        }
    }
    
}
