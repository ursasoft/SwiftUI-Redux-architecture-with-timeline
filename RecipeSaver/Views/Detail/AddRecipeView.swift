import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var store: Store<RecipeState>
    @State private var navigateToRecipe: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let name = Binding<String>(
            get: { self.store.state.currentRecipe.name },
            set: { name in
                let recipe = self.store.state.currentRecipe.update(name: name)
                self.store.dispatch(event: .changeRecipe(recipe))
            }
        )
        
        let image = Binding<String>(
            get: { self.store.state.currentRecipe.image },
            set: { image in
                let recipe = self.store.state.currentRecipe.update(image: image)
                self.store.dispatch(event: .changeRecipe(recipe))
            }
        )
        
        let selectedCategory = Binding<String>(
            get: { self.store.state.currentRecipe.category },
            set: { category in
                let recipe = self.store.state.currentRecipe.update(category: category)
                self.store.dispatch(event: .changeRecipe(recipe))
            }
        )
        
        let description = Binding<String>(
            get: { self.store.state.currentRecipe.description },
            set: { description in
                let recipe = self.store.state.currentRecipe.update(description: description)
                self.store.dispatch(event: .changeRecipe(recipe))
            }
        )
        
        let ingredients = Binding<String>(
            get: { self.store.state.currentRecipe.ingredients },
            set: { ingredients in
                let recipe = self.store.state.currentRecipe.update(ingredients: ingredients)
                self.store.dispatch(event: .changeRecipe(recipe))
            }
        )
        
        let directions = Binding<String>(
            get: { self.store.state.currentRecipe.directions },
            set: { directions in
                let recipe = self.store.state.currentRecipe.update(directions: directions)
                self.store.dispatch(event: .changeRecipe(recipe))
            }
        )
        
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Recipe name", text: name)
                }
                Section(header: Text("Image")) {
                    TextField("Image URL", text: image)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: selectedCategory) {
                        ForEach (Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: description)
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: ingredients)
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.store.dispatch(event: .cancelCreatingRecipe)
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem {
                    NavigationLink(isActive: $navigateToRecipe, destination: {
                        RecipeView(recipe: store.state.recipes.sorted { $0.datePublished > $1.datePublished }[0])
                            .navigationBarHidden(true)
                    }, label: {
                        Button {
                            self.store.dispatch(event: .addRecipe)
                            navigateToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    })
                    .disabled(self.store.state.currentRecipe.name.isEmpty)
                }
            })
            .navigationTitle("New recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
