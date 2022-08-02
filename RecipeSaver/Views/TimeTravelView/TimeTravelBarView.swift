import SwiftUI

struct TimeTravelBarView : View {
    
    @EnvironmentObject var store: Store<RecipeState>
    
    var body: some View {
        let indexBinding = Binding(
            get: { Double(self.store.currentStateIndex) },
            set: { self.store.currentStateIndex = Int($0) })

        return Slider(value: indexBinding, in: 0...Double(store.stateCount-1)) { editing in
            self.store.sliderEditing = editing
        }
        .background(Color.white)
        .frame(height: 16.0, alignment: .bottom)
        .padding()
    }
}

#if DEBUG
struct TimeTravelBarView_Previews : PreviewProvider {
    static var previews: some View {
        TimeTravelBarView()
    }
}
#endif
