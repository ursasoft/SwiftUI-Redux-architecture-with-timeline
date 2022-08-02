import SwiftUI

struct NewRecipeView: View {
    @EnvironmentObject var store: Store<RecipeState>
    
    var body: some View {
        let isCreatingRecipe = Binding<Bool>(
            get: { self.store.state.isCreatingRecipe },
            set: { _ in }
        )
        
        NavigationView {
            Button("Add recipe") {
                self.store.dispatch(event: .startCreatingRecipe)
            }
            .navigationTitle("New recipe")
        }
        .navigationViewStyle(.stack)
        .navigate(to: AddRecipeView(), when: isCreatingRecipe)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
