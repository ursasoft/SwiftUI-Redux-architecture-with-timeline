import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var store: Store<RecipeState>
    
    var category: Category
    
    var recipes: [Recipe] {
        return store.state.recipes.filter { $0.category == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
        }.navigationTitle(category.rawValue + "s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.soup)
    }
}
