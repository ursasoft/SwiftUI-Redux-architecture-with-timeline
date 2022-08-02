import SwiftUI

struct ContentView: View {
    var body: some View {
        TimeTravelView(initialState: RecipeState()) {
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
