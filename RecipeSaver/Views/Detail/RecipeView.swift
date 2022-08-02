import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var store: Store<RecipeState>
    @Environment(\.dismiss) var dismiss
    
    var recipe: Recipe
    
    var body: some View {
        NavigationView {
            ScrollView {
                AsyncImage(url: URL(string: recipe.image), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    }, placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }).frame(height: 300)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
                
                VStack(spacing: 30) {
                    Text(recipe.name)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 30) {
                        if !recipe.description.isEmpty {
                            Text(recipe.description)
                        }
                        
                        if !recipe.ingredients.isEmpty {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Ingredients")
                                    .font(.headline)
                                
                                Text(recipe.ingredients)
                            }
                        }
                        
                        if !recipe.directions.isEmpty {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Directions")
                                    .font(.headline)
                                
                                Text(recipe.directions)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.store.dispatch(event: .cancelShowingRecipeDetails)
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
            })
            .navigationTitle(recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.all[0])
    }
}
