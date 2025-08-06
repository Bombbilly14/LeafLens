//
//  CalendarView.swift
//  LeafLens
//
//  Created by William German on 7/28/25.
//

import SwiftUI

struct TaskModel: Identifiable {
    let id = UUID()
    let plantName: String
    let taskType: String
    let date: Date
}

struct CalendarView: View {
    
    @State private var currentDate = Date()
    @State private var selectedDate = Date()
    @State private var isExpanded = false
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    private var monthYearFormat: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy MMM"
        return df
    }
    
    private let weekdaySymbols = Calendar.current.veryShortWeekdaySymbols
    //TODO: change to veryShortWeekdaySymbols ^^
    
    private func generateDays() -> [Date?] {
        let calendar = Calendar.current
        guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {return []}
        
        guard let range = calendar.range(of: .day, in: .month, for: currentDate) else {return []}
        let numDays = range.count
        
        let firstWeekdayIndex = calendar.component(.weekday, from: startOfMonth) - 1
        
        var days: [Date?] = Array(repeating: nil, count: firstWeekdayIndex)
        
        for day in 1...numDays {
            if let date = calendar.date(byAdding: .day, value: day - 1, to: startOfMonth) {
                days.append(date)
            }
        }
        
        
        return days
    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(spacing: 16) {
                    HStack {
                        //TODO: add button to select month
                        Text(monthYearFormat.string(from: currentDate))
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .padding(.leading)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    .padding(.vertical)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(weekdaySymbols.indices, id: \.self) {index in
                            Text(weekdaySymbols[index])
                                .foregroundStyle(Color.white)
                                .font(.headline)
                                .bold()
                                .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .padding(.horizontal)
                    Divider()
                        .frame(height: 0.5)
                        .background(Color.white.opacity(0.4))
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(generateDays(), id: \.self) { date in
                            if let date = date {
                                let day = Calendar.current.component(.day, from: date)
                                Text("\(day)")
                                    .frame(maxWidth: .infinity, minHeight: 45)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                
                                    .background(calendarCellBackground(date: date))
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedDate = date
                                    }
                            } else {
                                Text("")
                                    .frame(maxWidth: .infinity, minHeight: 40)
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                .frame(height: geometry.size.height * 0.55)
                //TODO: idk about this height, check during build
                ZStack(alignment: .bottomTrailing) {
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("\(formattedDate(selectedDate))")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                //TODO: navigate or pull up a page that lets them add a task for any of their plants on that specified day
                                print("add reminder pushed")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 32))
                                    .foregroundStyle(Color.primaryGreen)
                            }
                        }
                        
                        Divider()
                        if hasPlaceholderTask(on: selectedDate) {
                            ScrollView(.vertical, showsIndicators: true){
                                VStack(alignment: .leading, spacing: 8) {
                                    ForEach(placeholderTasks) { task in
                                        TimelineTaskView(task: task)
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            }
                        } else {
                            VStack {
                                Image(systemName: "tray")
                                    .font(.largeTitle)
                                    .opacity(0.3)
                                Text("No tasks")
                                    .padding(.bottom, 64)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(32)
                .ignoresSafeArea()
                .background(Color("Card5"))
                .cornerRadius(48)
                .shadow(radius: 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(edges: .bottom)
            .background(Color("TestAccentColor3"))
        }
    }
    private func calendarCellBackground(date: Date) -> Color {
        if Calendar.current.isDate(date, inSameDayAs: selectedDate) {
            return Color.primaryGreen
        } else if Calendar.current.isDate(date, inSameDayAs: Date()) {
            return Color.primaryGreen.opacity(0.5)
        }
        return Color.clear
        
    }
    
    private func formattedDate(_ date: Date) -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        return df.string(from: date)
    }
    
    
    //TODO: placeholder task
    private func hasPlaceholderTask(on date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: Date())
    }
    
    private var placeholderTasks: [TaskModel] {
            [
                TaskModel(plantName: "Monstera Deliciosa", taskType: "Water", date: Date()),
                TaskModel(plantName: "Peace Lily", taskType: "Mist Leaves", date: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!),
                TaskModel(plantName: "ZZ Plant", taskType: "Fertilize", date: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!),
                TaskModel(plantName: "Orchid", taskType: "Repot", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
                TaskModel(plantName: "Spider Plant", taskType: "Prune Brown Tips", date: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!)
            ]
        }
    
    struct TimelineTaskView: View {
        let task: TaskModel
        var body: some View {
            VStack(alignment: .leading, spacing: 0.8) {
                HStack {
                    Circle()
                        .fill(Color.secondaryYellow)
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading){
                        Text(task.plantName)
                            .font(.system(size: 16))
                            .foregroundColor(Color.black)
                        Text(task.taskType)
                            .font(.caption)
                            .foregroundColor(Color.black)
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<3) { _ in
                        Text("|")
                            .foregroundStyle(Color.secondaryYellow)
                            .frame(width: 5, height: 8)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    CalendarView()
}
