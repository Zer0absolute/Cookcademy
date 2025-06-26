//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 07/06/2025.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @Environment(RecipeData.self) private var recipeData
    
    var body: some View {
        let columns: [GridItem] = [GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(destination: RecipesListView(viewStyle: .singleCategory(category)),
                            label: {
                                CategoryView(category: category)
                        })
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.5)
            Text(category.rawValue)
                .font(.title)
                .padding(5)
                .background(.white)
                .cornerRadius(10)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCategoryGridView()
        .environment(RecipeData())
  }
}
