/*
 Author: Daniel Favano
 Description: This is the fourth homework assignement of part 1 of the Swift class offered on pirple.com. The assignment requires you to create a function that takes in two time values and add them together.
*/

import UIKit

let dayType = "day"
let secondsType = "seconds"
let minutesType = "minutes"
let hoursType = "hours"
let daysType = "days"
let secondType = "second"
let minuteType = "minute"
let hourType = "hour"
let secondsInADayType = 86400
let secondsInAMinuteType = 60

//Takes two time values and add them together.
//Responds with the highest time value that can be represented as a whole number
func timeAdder(time1: UInt, timeType1 : String, time2 : UInt, timeType2 : String) -> (String,UInt) {
    
    var result : (String, UInt) = ("false", 0)

    if (!validTimeType(type: timeType1) || !validTimeType(type: timeType2)){
        return result
    }
    
    let time1Seconds : UInt = convertToSeconds(timeType: timeType1, time: time1)
    let time2Seconds : UInt = convertToSeconds(timeType: timeType2, time: time2)
    
    let totalSeconds = addSeconds(seconds1: time1Seconds, seconds2: time2Seconds)
    
    let highestTimeTypeConversion = convertSecondsToHighestTimeType(seconds: totalSeconds)
    
    result = highestTimeTypeConversion
    
    return result
}

//Time Adder Validation
func validTimeType(type : String) -> Bool {
    
    var result : Bool = false
    
    switch type {
    case dayType:
        result = true
    case secondsType:
        result = true
    case minutesType:
        result = true
    case hoursType:
        result = true
    case daysType:
        result = true
    case secondType:
        result = true
    case minuteType:
        result = true
    case hourType:
        result = true
    default:
        result = false
    }
    
    return result
}

func convertToSeconds(timeType: String, time: UInt) -> UInt {
    var result : UInt = time
    
    switch timeType {
    case dayType:
        result = daysToSeconds(days: time)
    case secondsType:
        break
    case minutesType:
        result = minutesToSeconds(minutes: time)
    case hoursType:
        result = hoursToSeconds(hours: time)
    case daysType:
        result = daysToSeconds(days: time)
    case secondType:
        break
    case minuteType:
        result = minutesToSeconds(minutes: time)
    case hourType:
        result = hoursToSeconds(hours: time)
    default:
        break
    }
    
    return result
}

func daysToSeconds(days: UInt) -> UInt {
    return days * 86400
}

func hoursToSeconds(hours: UInt) -> UInt {
    return hours * 3600
}

func minutesToSeconds(minutes: UInt) -> UInt {
    return minutes * 60
}

func convertSecondsToHighestTimeType(seconds : UInt) -> (String, UInt) {
    var result : (String, UInt) = ("false", 0)
    
    let timeConvertion = secondsToDaysHoursMinutes(seconds: seconds)
    
    if(timeConvertion[0].1 == 0){
        return (daysType, timeConvertion[0].0)
    }
    
    if(timeConvertion[1].1 == 0){
        return (hoursType, timeConvertion[1].0)
    }
    
    if(timeConvertion[2].1 == 0){
        return (minutesType, timeConvertion[2].0)
    }
    
    result = (secondsType, seconds)
    
    return result
}

func secondsToDaysHoursMinutes(seconds : UInt) -> [(UInt, UInt)] {
    var result : [(UInt, UInt)] = []
    
    let secondsToDaysResult : (UInt, UInt) = secondsToDays(seconds: seconds)
    let secondsToHoursResult : (UInt, UInt) = secondsToHours(seconds: seconds)
    let secondsToMinutesResult : (UInt, UInt) = secondsToMinutes(seconds: seconds)
    
    result.append(secondsToDaysResult)
    result.append(secondsToHoursResult)
    result.append(secondsToMinutesResult)
    
    return result
}

func secondsToDays(seconds: UInt) -> (UInt, UInt) {
    var result : (UInt, UInt) = (0,0)
    
    let days : UInt = seconds / 86400
    let remainingSeconds : UInt = seconds % 86400
    
    result = (days, remainingSeconds)
    
    return result
}

func secondsToHours(seconds: UInt) -> (UInt, UInt) {
    var result : (UInt, UInt) = (0,0)
    
    let hours : UInt = seconds / 3600
    let remainingSeconds : UInt = seconds % 3600
    
    result = (hours, remainingSeconds)
    
    return result
}

func secondsToMinutes(seconds: UInt) -> (UInt, UInt) {
    var result : (UInt, UInt) = (0,0)
    
    let minutes : UInt = seconds / 60
    let remainingMinutes : UInt = seconds % 60
    
    result = (minutes, remainingMinutes)
    
    return result
}

func addSeconds(seconds1: UInt, seconds2: UInt) -> UInt{
    return seconds1 + seconds2
}


//Tests
let timeTestMinutes = timeAdder(time1: 5, timeType1: minutesType, time2: 1, timeType2: minutesType)
print("5 minutes + 1 minute \(timeTestMinutes)")

let timeTestHours = timeAdder(time1: 24, timeType1: hoursType, time2: 1, timeType2: hoursType)
print("24 hours + 1 hour \(timeTestHours)")

let timeTestDays = timeAdder(time1: 1, timeType1: dayType, time2: 3, timeType2: daysType)
print("1 day + 3 days \(timeTestDays)")

let timeTestSeconds = timeAdder(time1: 1, timeType1: secondsType, time2: 3, timeType2: secondsType)
print("1 second + 3 seconds \(timeTestSeconds)")

let timeTestMinutesAndDays = timeAdder(time1: 3, timeType1: minutesType, time2: 1, timeType2: daysType)
print("3 minutes + 1 day \(timeTestMinutesAndDays)")

let timeTestMinutesAndSeconds = timeAdder(time1: 3, timeType1: minutesType, time2: 1, timeType2: secondType)
print("3 minutes + 1 second \(timeTestMinutesAndSeconds)")

let timeTestMinutesAndHours = timeAdder(time1: 3, timeType1: minutesType, time2: 3, timeType2: hourType)
print("3 minutes + 3 hours \(timeTestMinutesAndHours)")

let timeTestSecondsAndDays = timeAdder(time1: 1, timeType1: secondType, time2: 1, timeType2: daysType)
print("1 second + 1 day \(timeTestSecondsAndDays)")

let timeTestSecondsAndMinutes = timeAdder(time1: 1, timeType1: secondType, time2: 2, timeType2: minutesType)
print("1 second + 2 minutes \(timeTestSecondsAndMinutes)")

let timeTestSecondsAndHours = timeAdder(time1: 1, timeType1: secondType, time2: 2, timeType2: hourType)
print("1 second + 2 hour \(timeTestSecondsAndHours)")




