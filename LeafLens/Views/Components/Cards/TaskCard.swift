//
//  TaskCard.swift
//  LeafLens
//
//  Created by William German on 6/5/25.
//

import SwiftUI

enum TaskType {
    case watering, pruning, fertilizing
    
    var title: String {
        switch self {
        case .watering: return "Watering"
        case .pruning: return "Pruning"
        case .fertilizing: return "Fertilizing"
        }
    }
    
    var imageName: String {
        switch self {
        case .watering: return "wateringPlant"
        case .fertilizing: return "fertilizingPlant"
        case .pruning: return "pruningPlant"
        }
    }
}
struct TaskCard: View {
    let taskType: TaskType
    @Binding var isCompleted: Bool
    let date: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(taskType.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .cornerRadius(50)
                .padding(0)
            VStack(alignment: .leading, spacing: 3){
                Text(date)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                
                Text(taskType.title)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
            }
            Spacer()
            Toggle("", isOn: $isCompleted )
                .toggleStyle(CheckboxStyles())
                .padding(.trailing)
        }
        .frame(maxWidth: .infinity, maxHeight: 80)
        .background(Color(.white))
        .cornerRadius(15)
//        .padding()
    }
}


struct CheckboxStyles: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle()  }) {
            ZStack {
                if configuration.isOn {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color("BackgroundGreenApp"))
                        .frame(width: 20, height: 20)
                    
                } else {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color.clear)
                        .frame(width: 20, height: 20)
                }
                if configuration.isOn {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Color.black)
                }
                
            }
        }
    }
}

#Preview {
    @Previewable @State var dummyToggle = true
    TaskCard(taskType: .watering, isCompleted: $dummyToggle, date: "Today")
}
