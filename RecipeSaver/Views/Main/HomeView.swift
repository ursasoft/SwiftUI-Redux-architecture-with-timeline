import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: Store<RecipeState>
    
    var body: some View {
        let isShowingRecipeDetails = Binding<Bool>(
            get: { self.store.state.isShowingRecipeDetails != nil },
            set: { _ in }
        )
        
        NavigationView {
            ScrollView {
                RecipeList(recipes: store.state.recipes)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
        .navigate(to: RecipeView(recipe: self.store.state.isShowingRecipeDetails ?? Recipe.empty), when: isShowingRecipeDetails)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
