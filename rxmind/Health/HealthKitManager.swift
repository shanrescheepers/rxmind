//
//  HealthKitManager.swift
//  rxmind
//
//  Created by Mac on 2023/08/09.
//

import Foundation
import HealthKit
import SwiftUI
//Manager to access Health Data
class HealthKitManager: ObservableObject {
    static let sharedHealthKitManager = HealthKitManager()
    let healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
        
    @State private var restingHeartRates: Array<Double> = []
    @State private var lastRestingHeartRate: Double = 0.0
    
    @Published var activities: [Activity] = []
    
    @State private var todaySteps: Int = 0
    @State private var yesterdaySteps: Int = 0
    
    init() {
//        hier pull ek die stored local data, as ek dit link met my foon/ watch is dit real time
        if HKHealthStore.isHealthDataAvailable() {
            let steps = HKObjectType.quantityType(forIdentifier: .stepCount)!
            let calories = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
            let heartRateVariability = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!
            let restingHeartRate = HKObjectType.quantityType(forIdentifier: .restingHeartRate)!
            let currentHeartRate = HKObjectType.quantityType(forIdentifier: .heartRate)!
            let healthTypes: Set<HKObjectType> = [steps, calories, restingHeartRate, heartRateVariability, currentHeartRate]
            
            Task {
                do {
                    try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                    fetchDailySteps()
//                    startHeartRateQuery()
                    fetchRestingHeartRate()
                    fetchHeartRateVariability()
                  
                    
                } catch {
                    print("Error retrieving HealthKit: \(error.localizedDescription)")
                }
            }
        }
    }
    
    //    functions to fetch each
    func fetchDailySteps()
    {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: Calendar.current.startOfDay(for: Date()), end: Date())
    
//         _, : this is  a temporary variable
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate){
            _, result, error in
            
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Error fetching today's steps data:  \(error?.localizedDescription ?? "")")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            print("Total Steps: \(stepCount) ")
            
//            append data into activity arrray
            self.activities.append(Activity(title: "Daily Steps", amount: "\(stepCount.rounded(.towardZero))",
                                            image: "figure.walk.circle.fill", color: .orange))
        }
        healthStore.execute(query)
    }
    
//    HeartRate
//    private func startHeartRateQuery() {
//            let calendar = NSCalendar.current
//
//            var anchorComponents = calendar.dateComponents([.day, .month, .year, .weekday], from: NSDate() as Date)
//
//            anchorComponents.day! -= 6
//
//            guard let anchorDate = Calendar.current.date(from: anchorComponents) else {
//                fatalError("*** unable to create a valid date from the given components ***")
//            }
//
//            let interval = NSDateComponents()
//            interval.day = 1
//
//            let endDate = Date()
//
//            guard let startDate = calendar.date(byAdding: .day, value: -6, to: endDate) else {
//                fatalError("*** Unable to calculate the start date ***")
//            }
//
//            guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.restingHeartRate) else {
//                fatalError("*** Unable to create a resting heart rate type ***")
//            }
//
//            // Create the query
//            let query = HKStatisticsCollectionQuery(quantityType: quantityType,
//                                                    quantitySamplePredicate: nil,
//                                                    options: .discreteAverage,
//                                                    anchorDate: anchorDate,
//                                                    intervalComponents: interval as DateComponents)
//
//            // Set the results handlers
//            query.initialResultsHandler = {
//                _, results, error in
//                guard let statsCollection = results else {
//                    fatalError("*** An error occurred while calculating the statistics: \(error?.localizedDescription ?? "") ***")
//                }
//                print("Initial resting heart rates updated")
//                var values: Array<Double> = []
//                // Add the average resting heart rate to array
//                statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
//
//                    if let quantity = statistics.averageQuantity() {
//                        let value = quantity.doubleValue(for: HKUnit(from: "count/min"))
//                        values.append(value)
//                    }
//                }
//                self.restingHeartRates = values
//            }
//
//            query.statisticsUpdateHandler = {
//                _, _, results, error in guard let statsCollection = results else {
//                    fatalError("*** An error occurred while calculating the statistics: \(error?.localizedDescription ?? "") ***")
//                }
//
//            print("Resting Heart Rates updated \(self.restingHeartRates)")
//                print("\(self.restingHeartRates)")
//            var values: Array<Double> = []
//            // Add the average resting heart rate to array
//            statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
//
//                if let quantity = statistics.averageQuantity() {
//                    let value = quantity.doubleValue(for: HKUnit(from: "count/min"))
//                    values.append(value)
//                }
//            }
//                self.restingHeartRates = values
//                print(values)
//            }
//
//            healthStore.execute(query)
//        }
    
    func fetchRestingHeartRate() {
        let heartRateType = HKObjectType.quantityType(forIdentifier: .restingHeartRate)!
        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, results, error in
            guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                if let error = error {
                    print("Failed to fetch resting heart rate: \(error.localizedDescription)")
                }
                return
            }

            let heartRateUnit = HKUnit(from: "count/min")
            let heartRate = sample.quantity.doubleValue(for: heartRateUnit)
            print("Resting Heart Rate: \(heartRate) bpm")
            
            self.activities.append(Activity(title: "Resting Heart Rate", amount: "\(heartRate)",
                                            image: "suit.heart.fill", color: .purple))
        }

        healthStore.execute(query)
    }
    //HRV
    func fetchHeartRateVariability() {
        let hrvType = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!
        let hrvQuery = HKSampleQuery(sampleType: hrvType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, results, error in
            guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                if let error = error {
                    print("Failed to fetch HRV data: \(error.localizedDescription)")
                }
                return
            }

            let hrvUnit = HKUnit.secondUnit(with: .milli)
            let hrvValue = sample.quantity.doubleValue(for: hrvUnit)
            print("HRV: \(hrvValue) ms")
            self.activities.append(Activity(title: "Heart Rate Variability", amount: "\(hrvValue)",
                                            image: "bolt.heart.fill", color: .red))
        }

        healthStore.execute(hrvQuery)
    }




                                   /*used only for testing, prints heart rate info */
//  Get steps to display with filtering for watchos too
    func fetchStepsData(completion: @escaping (Int, Int) -> Void) {
        // Define the query to fetch today's steps
        let calendar = Calendar.current
        let todayStart = calendar.startOfDay(for: Date())
        let todayEnd = calendar.date(byAdding: .day, value: 1, to: todayStart)!
        let todayPredicate = HKQuery.predicateForSamples(withStart: todayStart, end: todayEnd, options: .strictStartDate)
        let todayStepsQuery = HKSampleQuery(
            sampleType: HKQuantityType.quantityType(forIdentifier: .stepCount)!,
            predicate: todayPredicate,
            limit: HKObjectQueryNoLimit,
            sortDescriptors: nil
        ) { _, results, _ in
            let todaySteps = results?.compactMap { $0 as? HKQuantitySample }.reduce(0) { $0 + Int($1.quantity.doubleValue(for: .count())) } ?? 0

            // Define the query to fetch yesterday's steps
            let yesterdayStart = calendar.date(byAdding: .day, value: -1, to: todayStart)!
            let yesterdayEnd = todayStart
            let yesterdayPredicate = HKQuery.predicateForSamples(withStart: yesterdayStart, end: yesterdayEnd, options: .strictStartDate)
            let yesterdayStepsQuery = HKSampleQuery(
                sampleType: HKQuantityType.quantityType(forIdentifier: .stepCount)!,
                predicate: yesterdayPredicate,
                limit: HKObjectQueryNoLimit,
                sortDescriptors: nil
            ) { _, results, _ in
                let yesterdaySteps = results?.compactMap { $0 as? HKQuantitySample }.reduce(0) { $0 + Int($1.quantity.doubleValue(for: .count())) } ?? 0

                completion(todaySteps, yesterdaySteps)
            }

            self.healthStore.execute(yesterdayStepsQuery)
        }

        healthStore.execute(todayStepsQuery)
    }
    
   public func fetchHeartRateData(completion: @escaping (Double?, Error?) -> Void) {
        let healthStore = HKHealthStore()

        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            completion(nil, NSError(domain: "YourAppDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Heart rate data not available"]))
            return
        }

        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: nil) { (query, samples, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let sample = samples?.first as? HKQuantitySample else {
                completion(nil, NSError(domain: "YourAppDomain", code: 2, userInfo: [NSLocalizedDescriptionKey: "No heart rate data available"]))
                return
            }

            let heartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            completion(heartRate, nil)
        }

        healthStore.execute(query)
    }
    
    
    
    func fetchStepCountData(completion: @escaping (Double?, Error?) -> Void) {
        let healthStore = HKHealthStore()

        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            completion(nil, NSError(domain: "YourAppDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Step count data not available"]))
            return
        }

        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: nil, options: .cumulativeSum) { (query, result, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            if let sum = result?.sumQuantity() {
                let stepCount = sum.doubleValue(for: HKUnit.count())
                completion(stepCount, nil)
            } else {
                completion(nil, NSError(domain: "YourAppDomain", code: 2, userInfo: [NSLocalizedDescriptionKey: "No step count data available"]))
            }
        }

        healthStore.execute(query)
    }
    
}
