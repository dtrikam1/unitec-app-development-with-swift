import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sample = "sample"
        print(sample)
        
        if true {
            print("Will this line of code ever be reached?")
            someMethod()
        }

        let switchCaseInput = 1

        switch switchCaseInput{
            case 1:
                print("1")
            case 2:
                print("2")
            default:
                print("default")
        }
    }
    
    func someMethod() {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

