import SwiftUI

struct RecipeState {
    var selectedTab: String = TabBarItems.home.rawValue
    var isCreatingRecipe: Bool = false
    var isShowingRecipeDetails: Recipe? = nil
    var currentRecipe: Recipe = Recipe.empty
    var recipes: [Recipe] = Recipe.all
}

extension RecipeState: StateMachine {
    
    enum Event {
        case selectTab(String)
        case startCreatingRecipe
        case cancelCreatingRecipe
        case addRecipe
        case changeRecipe(Recipe)
        case startShowingRecipeDetails(Recipe)
        case cancelShowingRecipeDetails
    }
    
    mutating func update(with event: RecipeState.Event) {
        switch event {
        case .selectTab(let tab):
            selectedTab = tab
        case .startCreatingRecipe:
            isCreatingRecipe = true
            currentRecipe = Recipe.empty
        case .cancelCreatingRecipe:
            isCreatingRecipe = false
        case .addRecipe:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            let recipe = currentRecipe.update(id: UUID(), datePublished: dateFormatter.string(from: Date()))
            recipes.append(recipe)
            isCreatingRecipe = false
        case .changeRecipe(let recipe):
            currentRecipe = recipe
        case .startShowingRecipeDetails(let recipe):
            isShowingRecipeDetails = recipe
        case .cancelShowingRecipeDetails:
            isShowingRecipeDetails = nil
        
        }
    }
    
}
