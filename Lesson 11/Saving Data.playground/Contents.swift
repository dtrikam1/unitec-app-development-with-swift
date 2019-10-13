import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
print(documentsDirectory)

let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print(encodedNote)

    let propertyListDecoder = PropertyListDecoder()
    if let decodedNote = try?
      propertyListDecoder.decode(Note.self, from: encodedNote) {
        print(decodedNote)
    }
}

//let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
//let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
//let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
//let notes = [note1, note2, note3]
//
//let documentsDirectory =
//  FileManager.default.urls(for: .documentDirectory,
//  in: .userDomainMask).first!
//let archiveURL =
//  documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
//
//let propertyListEncoder = PropertyListEncoder()
//let encodedNotes = try? propertyListEncoder.encode(notes)
//
//try? encodedNotes?.write(to: archiveURL,
//  options: .noFileProtection)
//
//let propertyListDecoder = PropertyListDecoder()
//if let retrievedNotesData = try? Data(contentsOf: archiveURL),
//    let decodedNotes = try?
//      propertyListDecoder.decode(Array<Note>.self, from:
//      retrievedNotesData) {
//    print(decodedNotes)
//}


//let file = "file.txt" //this is the file. we will write to and read from it
//
//      let text = "some text" //just a text
//
//      if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//          print(dir)
//          let fileURL = dir.appendingPathComponent(file)
//
//          //writing
//          do {
//              try text.write(to: fileURL, atomically: false, encoding: .utf8)
//          }
//          catch {/* error handling here */}
//
//          //reading
//          do {
//              let text2 = try String(contentsOf: fileURL, encoding: .utf8)
//          }
//          catch {/* error handling here */}
//      }
