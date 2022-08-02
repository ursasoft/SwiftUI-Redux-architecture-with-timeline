public protocol StateMachine {
    associatedtype Event
    mutating func update(with event: Event)
}
