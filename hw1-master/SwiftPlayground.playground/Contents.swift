
import Foundation
import XCTest

//: # Homework 1 - Swift Playground
//: ## Question 1: arePalindromes
//: Fill out the following function to detect whether or not each word in `words` is a palindrome
/// Returns true if each word in the given list is a palindrome
/// (a phrase/word that reads the same backwards as it does forward.)
/// If any of the words is not a palindrome, return false
///
/// - Parameter words: list of strings
/// - Returns: true if every word in `words` is a palindrome, false otherwise
///     put characters into array and utilize removeLast to check every character moving forward and every character from back
func arePalindromes(_ words: [String]) -> Bool {
    var phrase = String()
    var index: Int = 0
    for word in words {
        phrase = String(word)
        index = 0
        var letters = [Character]()
        for character in phrase.characters {
            letters.append(character)
        }
        while index < letters.count {
            if letters[index] != letters[letters.count - 1 - index] {
                return false
            }
            index += 1
        }
    }

    return true
}
//: ## Question 2: Optionals
//: Someone stole a cookie from the GBC! At the crime scene, they found a blue book in the cookie jar with the SID `25346602` on it, no doubt it belonged to the criminal. The manager needs your help finding who it belongs to. Complete this function using the provided dictionary of SIDS called `studentIDNumbers` to find the culprit.
/// Returns a formatted string of the culprit given a VALID SID.
///
/// - Note: A valid SID consists of exactly 8 digits. You need to enforce this in your implementation and return nil if it's not satisfied.
///
/// - Parameters:
///   - sid: an integer or nil
///   - studentIDNumbers: Dictionary of SIDs to names.
/// - Returns: The formatted string "NAME stole the cookie!" if given a valid SID, nil otherwise.
func findStudent(withStudentID sid: Int?, studentIDNumbers: [Int: String] = getSIDsDictionary()) -> String? {
    // studentIDNumbers has a default value (which is the SID dictionary), so you can use it directly like studentIDNumbers[50277282] -> "Tom"?.
    // Note: studentIDNumbers[KEY] always returns an optional since there may not be an entry for that KEY.
    
    // your code here
    if let myOptional = sid {
        if sid! < 100000000 && sid! > 9999999 {
            if let culprit = studentIDNumbers[sid!] {
                return studentIDNumbers[sid!]! + " stole the cookie!"
            }
        }
    }
    return nil
}

findStudent(withStudentID: 25346602) // the culprit!
findStudent(withStudentID: 50277282) // Tom stole the cookie!
findStudent(withStudentID: nil) // nil
findStudent(withStudentID: 40979255) // nil
//: ## Question 3: Protocols
//: Make the class `Building` conform to the `Equatable` Protocol, and implement `getCapacity()`.
class Building {
    
    var name: String
    var capacity: Int?
    
    init(name: String = "A Building", capacity: Int? = nil) {
        self.name = name
        self.capacity = capacity
    }
    
    //: Returns the `capacity` of the building. If the `capacity` is `nil`, then return `0`.
    func getCapacity() -> Int {
        if let max = self.capacity {
            return self.capacity!
        }
        return 0
    }
}

extension Building: Equatable {
    static func == (lhs: Building, rhs: Building) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.capacity == rhs.capacity
    }
}

let building = Building()
building.getCapacity() // 0
let sodaHall = Building(name: "Soda Hall", capacity: 2356)
building.getCapacity() // 2356
let coryHall = Building(name: "Cory Hall", capacity: 3489)
//building == sodaHall // false
//sodaHall == sodaHall // true
//sodaHall == coryHall // false
//: ## Question 4: Closures
//: `percentageString` creates a string represeting the given number as `Double`. This is such a simple function - let's change it to a closure! Rewrite `percentageString` as a closure in `percentageStringClosure`
func percentageString(forNumber x: Double) -> String {
    return String(x*10) + "%"
}

let percentageStringClosure = percentageString(forNumber: )
//: Tests below (Ignore)
class PlaygroundTests: XCTestCase {
    func testArePalindromes() {
        XCTAssertTrue(arePalindromes(["able was I ere I saw elba", "racecar"]), "`['able was I ere I saw elba', 'racecar']` should return true.")
        XCTAssertFalse(arePalindromes(["hello world", "racecar"]), "`['hello world', 'racecar']` should return false.")
    }
    
    func testFindStudent() {
        XCTAssertNil(findStudent(withStudentID: nil), "findStudent(withStudentID: nil) should return nil.")
        XCTAssertNil(findStudent(withStudentID: 2342), "findStudent(withStudentID: 2342) should return nil.")
        XCTAssertNil(findStudent(withStudentID: 40979255), "findStudent(withStudentID: 40979255) should return nil since the SID 40979255 is not in the dictionary.")
        XCTAssertEqual(findStudent(withStudentID: 25346602),
                       String(data: Data(base64Encoded: "T3NraSBzdG9sZSB0aGUgY29va2llIQ==")!, encoding: .utf8), "findStudent(withStudentID: 25346602) should return the formatted string with the culprit.")
    }
    
    func isEquatable<T: Equatable>(obj: T) -> Bool { return true }
    func isEquatable<T>(obj: T) -> Bool { return false }
    func testBuildingEquatable() {
        XCTAssertTrue(isEquatable(obj: building), "Q3. Building conforms to Equatable.")
    }

    func testPercentangeStringClosure() {
        let closure: Any? = percentageStringClosure
        if let closure = closure as? (Double) -> String {
            XCTAssertEqual("40.0%", closure(4.0), "Q4. percentageStringClosure returns incorrect string.")
        } else {
            XCTFail("Q4. percentageStringClosure has an incorrect function type.")
        }
    }
    
}
//: ## Uncomment this line to run tests
PlaygroundTests.defaultTestSuite().run()
