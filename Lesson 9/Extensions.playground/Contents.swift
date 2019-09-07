import UIKit

extension String {
    private var vowels: [String]
    {
        get
        {
            return ["a", "e", "i", "o", "u"]
        }
    }

    private var consonants: [String]
    {
        get
        {
            return ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
        }
    }

    func pluralize(count: Int) -> String
    {
        if count == 1 {
            return self
        } else {
            let end = self.index(self.endIndex, offsetBy: -2)


            let lastChar = self[self.index(before: self.endIndex)]
            let secondToLastChar = self[end..<self.endIndex]
            var prefix = "", suffix = ""

            if lastChar.lowercased() == "y" && vowels.filter({x in x == secondToLastChar}).count == 0 {
                prefix = String(self[..<self.index(before: self.endIndex)])
                suffix = "ies"
            } else if lastChar.lowercased() == "s" || (lastChar.lowercased() == "o" && consonants.filter({x in x == secondToLastChar}).count > 0) {
                prefix = self
                suffix = "es"
            } else {
                prefix = self
                suffix = "s"
            }

            return prefix + (String(lastChar) != lastChar.uppercased() ? suffix : suffix.uppercased())
        }
    }
}

print("Apple".pluralize(count: 2))
print("Song".pluralize(count: 2))
print("Person".pluralize(count: 2))
print("Tennis court".pluralize(count: 2))
print("Baby".pluralize(count: 2))
print("Bus".pluralize(count: 2))
