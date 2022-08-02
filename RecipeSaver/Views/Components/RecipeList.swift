import SwiftUI

struct RecipeList: View {
    @EnvironmentObject var store: Store<RecipeState>
    
    var recipes: [Recipe]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "Recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    Button(action: {
                        self.store.dispatch(event: .startShowingRecipeDetails(recipe))
                    }, label: {
                        RecipeCard(recipe: recipe)
                    })
                }
            }.padding(.top)
            
        }.padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}
