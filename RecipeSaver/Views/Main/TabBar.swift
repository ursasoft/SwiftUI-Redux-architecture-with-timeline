import SwiftUI

enum TabBarItems: String {
    case home = "Home"
    case categories = "Categories"
    case newRecipe = "New"
    case settings = "Settings"
    
    func systemImage() -> String {
        switch self {
        case .home:
            return "house"
        case .categories:
            return "square.fill.text.grid.1x2"
        case .newRecipe:
            return "plus"
        case .settings:
            return "gear"
        }
    }
}

struct TabBar: View {
    @EnvironmentObject var store: Store<RecipeState>
    
    var body: some View {
        let selection = Binding<String>(
            get: { self.store.state.selectedTab },
            set: { self.store.dispatch(event: .selectTab($0)) }
        )
        
        TabView(selection: selection) {
            HomeView()
                .tabItem {
                    let item = TabBarItems.home
                    Label(item.rawValue, systemImage: item.systemImage())
                }
                .tag(TabBarItems.home.rawValue)
            CategoriesView()
                .tabItem {
                    let item = TabBarItems.categories
                    Label(item.rawValue, systemImage: item.systemImage())
                }
                .tag(TabBarItems.categories.rawValue)
            NewRecipeView()
                .tabItem {
                    let item = TabBarItems.newRecipe
                    Label(item.rawValue, systemImage: item.systemImage())
                }
                .tag(TabBarItems.newRecipe.rawValue)
            SettingsView()
                .tabItem {
                    let item = TabBarItems.settings
                    Label(item.rawValue, systemImage: item.systemImage())
                }
                .tag(TabBarItems.settings.rawValue)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
