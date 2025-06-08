//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Maël Colomé on 08/06/2025.
//

import SwiftUI

struct ModifyMainInformationView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    @Binding var mainInformation: MainInformation

    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(
                selection: $mainInformation.category,
                label: HStack {
                    Text("Category")
                    Spacer()
                    Text(mainInformation.category.rawValue)
                }
            ) {
                ForEach(MainInformation.Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(listTextColor)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var info = MainInformation(
            name: "Pizza",
            description: "Delicious cheese pizza.",
            author: "Maël",
            category: .breakfast // adapte selon ton enum
        )
        var body: some View {
            ModifyMainInformationView(mainInformation: $info)
        }
    }
    return PreviewWrapper()
}
