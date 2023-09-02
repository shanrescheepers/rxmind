import SwiftUI

struct TimePickerView: View {
    @State private var selectedDate = Date()
    @State private var timeRemaining: TimeInterval = 0
    @StateObject private var timerManager: TimerManager = TimerManager(updateInterval: 1)
    
    init() {
        // Retrieve the previously stored goal date, if available
        if let storedDate = UserDefaults.standard.object(forKey: "goalDate") as? Date {
            _selectedDate = State(initialValue: storedDate)
        }
        
        // Calculate the initial time remaining
        updateTimeRemaining()
    }

    var body: some View {
        ZStack{
          
            Color.black.opacity(0.5).cornerRadius(12) // Adjust opacity as needed
            VStack{
                HStack{
                    
                    Text("Set your goal date below").frame(maxWidth: .infinity, alignment: .leading ).padding(.horizontal).foregroundColor(Color(.sRGB, red: 0x5E / 255.0, green: 0x71 / 255.0, blue: 0x77 / 255.0))
                    
                }.padding(12)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                            .opacity(0.1) // Adjust opacity as needed
                            .frame(width: 300, height: 130)
                            .overlay(
                                
                                VStack {
                                  
                                    DatePicker("Select Goal Date", selection: $selectedDate, in: Date()...).datePickerStyle(CompactDatePickerStyle()).environment(\.colorScheme, .dark)
                                        .labelsHidden().padding(.top)
                           
                                    VStack{
                                        HStack{
                                            Text("Time until goal reached ") .font(.title3).fontWeight(.bold)
                                                .frame(width: 400).foregroundColor(Color(#colorLiteral(red: 0.3568627536, green: 0.2274509817, blue: 0.850980401, alpha: 1))) // Set the text color
                                   
                                        }.padding(.top, 2)
                           
                                        HStack{
                                            Text("\(formattedTimeRemaining)")
                                        }.padding(.all, 2)
                                    }
                                }
                            )
        }
        .onAppear {
            // Start the timer when the view appears
            timerManager.startTimer(updateAction: updateTimeRemaining)
        }
        .onDisappear {
            // Stop the timer when the view disappears to avoid leaks
            timerManager.stopTimer()
        }
       
      
    }

    var formattedTimeRemaining: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timeRemaining) ?? ""
    }

    private func updateTimeRemaining() {
        let currentDate = Date()
        if selectedDate > currentDate {
            timeRemaining = selectedDate.timeIntervalSince(currentDate)
        } else {
            // Handle the case where the goal date has already passed
            timeRemaining = 0
        }
        
        // Save the selected goal date to UserDefaults
        UserDefaults.standard.set(selectedDate, forKey: "goalDate")
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView()
    }
}

class TimerManager: ObservableObject {
    private let updateInterval: TimeInterval
    private var timer: Timer?
    private var updateAction: () -> Void = {}

    init(updateInterval: TimeInterval) {
        self.updateInterval = updateInterval
    }
    
    func startTimer(updateAction: @escaping () -> Void) {
        self.updateAction = updateAction
        timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { _ in
            self.updateAction()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

}

