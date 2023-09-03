import SwiftUI

struct TimePickerView: View {
    @State private var selectedDate = Date()
    @State private var timeRemaining: TimeInterval = 0
    @StateObject private var timerManager: TimerManager = TimerManager(updateInterval: 1)
    @State private var timer: Timer?
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
          
            Color.black.opacity(0.5).cornerRadius(12)
            VStack{
                HStack(alignment: .firstTextBaseline){
                    
                    Text("End goal time").font(.system(size: 14)).fontWeight(.black).frame(maxWidth: .infinity, alignment: .center ).padding().padding(.top,-20).foregroundColor(Color(red: 0.4117647059, green: 0.5294117647, blue: 0.537254902, opacity: 1.0)).lineSpacing(30).multilineTextAlignment(SwiftUI.TextAlignment.leading)
                    
                }.padding(12)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.1725490196, green: 0.2235294118, blue: 0.2274509804, opacity: 1.0))
                            .opacity(0.6) // Adjust opacity as needed
                            .frame(width: 300, height: 120).padding(.top,10)
//                            .overlay(
                                
                                VStack {
                                  
                                    DatePicker("Select Goal Date", selection: $selectedDate, in: Date()...).datePickerStyle(CompactDatePickerStyle()).environment(\.colorScheme, .dark)
                                        .labelsHidden().padding(.top)
                           
                                    VStack{
                                        HStack{
                                            Text("Time until goal reached ").font(.system(size: 12)).fontWeight(.thin)
                                                .frame(width: 400).foregroundColor(Color.white) // Set the text color
                                   
                                        }.padding(.top, 2)
                           
                                        HStack{
                                            Text("\(formattedTimeRemaining)").font(.system(size: 17)).fontWeight(.bold)
                                                .frame(width: 400).foregroundColor(Color.white)
                                        }.padding(.all, 2)
                                    }
                                }
//                            )
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
        if (formatter.string(from: timeRemaining) == "0s"){
            return "Fuck yeah! You did it!"
        }else{
            return formatter.string(from: timeRemaining) ?? ""
        }
        
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

