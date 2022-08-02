import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var store: Store<RecipeState>
    
    var body: some View {
        NavigationView {
            Text("1.0.0")
                .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
