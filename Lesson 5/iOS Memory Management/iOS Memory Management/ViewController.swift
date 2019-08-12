//
//  ViewController.swift
//  iOS Memory Management
//
//  Created by Dipesh Trikam on 4/08/19.
//  Copyright © 2019 Dipesh Trikam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


//         let personA = person(name: "A")
//         let personB = person(name: "B")
//         let personC = person(name: "C")
//
//         personA.friend = personB
//         personB.friend = personC
//         personC.friend = personA


        let element = HTMLElement(name: "u", text: "under line here")
        let str = element.asHTML()
        print(str)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class person {
    var name:String!
    weak var friend:person?

    init(name:String) {
        self.name = name
    }

    deinit {
        print("\(self.name!) is released")
    }
}



class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in //[weak self] in // what is self is nil? then it will crash which is why we can't use this.
        //the unowned means that in no situation will self be nil which is why it's okay - this was introduced from swift 2
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is released")
    }

}

//https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html


