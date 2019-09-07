import UIKit

var str = "Hello, playground"

func sum(numbers: [Int]) -> Int{
    var totalSum = 0
    for items in numbers {
        totalSum += items
    }
    return totalSum
}

let sumClosure = {(numbers: [Int]) -> Int in
    var totalSum = 0
    for items in numbers {
        totalSum += items
    }
    return totalSum
}

let sum = sumClosure([1, 2, 3, 4])
print(sum)

//Because all values in Swift must have a type, closures have a type. You define the type by specifying a parameter list and a return type, or the lack of either, at the start of the block of code. Just like functions, there are four types of closures:

//A closure with no parameters and no return value:

let printClosure = { () -> Void in
    print("This closure does not take any parameters and does not return a value.")
}

//A closure with parameters and no return value:

let printClosureWithInput = { (string: String) -> Void in
    print(string)
}

//A closure with no parameters and a return value:

let randomNumberClosure = { () -> Int in
    // Code that returns a random number.
    return Int.random(in: 0 ... Int.max)

}

//A closure with parameters and a return value (as in the earlier example):

let randomNumberClosureWithInput = { (minValue: Int, maxValue: Int) -> Int in
    // Code that returns a random number between `minValue` and`maxValue`
    return Int.random(in: minValue ... maxValue)
}

print(randomNumberClosure())

//The sorted(by:) function will run the instruction on every pair of objects in the array and return a Bool value. If the closure returns true, the first track will stay in front of the second track; if it returns false, the first track will move behind the second track. The function will repeat until the entire array returns true. What makes closures so powerful is that you can pass any logic to the sorted(by:) function. So now you can pass a closure that sorts by track name or by star rating:

struct Track {
    var trackNumber: Int
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 1), Track(trackNumber: 4)]

let sortedTracks = tracks.sorted { (track1, track2) -> Bool in
    return track1.trackNumber < track2.trackNumber
}

print(sortedTracks)

let reversedTracks = tracks.sorted { return $0.trackNumber >
    $1.trackNumber }

print(reversedTracks)
print(reversedTracks[0].trackNumber)

//When a closure has one line, Swift will automatically return the result, so you can remove the return keyword.
//let sortedTracks = tracks.sorted { $0.starRating < $1.starRating}

// Trailing closure syntax
func performRequest(url: String, response: (_ code: Int) -> Void) {
    print(url)
}

performRequest(url: "https://www.apple.com") { (data) in
    print(data)
}

func someFunction(completion:(_ myString: String) -> ()) {
    completion("hello world")
}

someFunction(completion: { myString in
    print(myString)
})
