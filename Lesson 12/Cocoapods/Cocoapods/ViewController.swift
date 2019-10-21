//
//  ViewController.swift
//  Cocoapods
//
//  Created by Hayden Do on 14/10/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit
import Alamofire
import KeychainAccess
import Lottie
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var animationViewWrapper: UIView!
    @IBOutlet weak var textFieldA: UITextField!
    @IBOutlet weak var textFieldB: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    let publishSubjectA = PublishSubject<String?>()
    let publishSubjectB = PublishSubject<String?>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        alamofireExample()
//        keychainExample()
//        lottieExample()
        subjectExample()
//        rxSwiftExample()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func rxSwiftExample() {
        textFieldA.rx.text
            .bind(to: publishSubjectA.asObserver())
            .disposed(by: disposeBag)

        textFieldB.rx.text
            .bind(to: publishSubjectB.asObserver())
            .disposed(by: disposeBag)
        
        publishSubjectA.asObservable()
            .map({ textA in
                return "Input is \(textA ?? "")"
            })
            .subscribe(onNext: { textA in
                self.outputLabel.text = "\(textA)"
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(publishSubjectA.asObservable(), publishSubjectB.asObservable())
            .throttle(2, scheduler: MainScheduler.instance)
            .filter({ textA, textB in
                guard let textA = textA, let textB = textB else {
                    return true
                }
                return textA.count > 2 && textB.count > 2
            })
            .subscribe(onNext: { textA, textB in
                self.outputLabel.text = "\(textA ?? ""), \(textB ?? "")"
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.publishSubjectA.asObserver().onNext("Manually triggered")
        })
    }
    
    private func subjectExample() {
        let publishSubject = PublishSubject<String>()
        
        publishSubject.asObserver().onNext("blah")
        
        publishSubject.asObservable()
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)
        
        publishSubject.asObserver().onNext("blahblah")
        publishSubject.asObserver().onNext("blahblahblah")

        let behaviourSubject = BehaviorSubject<Int>(value: 0)
        
        behaviourSubject.asObserver().onNext(-1)
        
        behaviourSubject.asObservable()
            .subscribe(onNext: { value in
                print(value)
            })
            .disposed(by: disposeBag)
        
        behaviourSubject.asObserver().onNext(1)
        behaviourSubject.asObserver().onNext(2)
        behaviourSubject.asObserver().onNext(3)
        
        let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
        
        replaySubject.asObservable()
            .subscribe(onNext: { value in
                print("Observer 1: \(value)")
            })
            .disposed(by: disposeBag)
        
        replaySubject.asObserver().onNext("strawberry")
        replaySubject.asObserver().onNext("kiwi")
        replaySubject.asObserver().onNext("melon")
        
        
        replaySubject.asObservable()
            .subscribe(onNext: { value in
                print("Observer 2: \(value)")
            })
            .disposed(by: disposeBag)
    }

    private func alamofireExample() {
        // GET Request
        AF.request("https://cocoapodsproject.free.beeceptor.com/show").response { response in
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "")
            }
        }
        
        // POST Request
        AF.request("https://cocoapodsproject.free.beeceptor.com/add", method: .post, parameters: ["":""], encoder: JSONParameterEncoder.default).response { response in
            if let data = response.data {
                print(String(data: data, encoding: .utf8) ?? "")
            }
        }
    }
    
    private func keychainExample() {
        let keychain = Keychain(service: "nz.ac.unitec.Cocoapods")
        let accessTokenKey = "access-token"
        
        // Save data
        do {
            try keychain.set("fds676sf8b7b6b86sgds", key: accessTokenKey)
        } catch {
            print(error.localizedDescription)
        }
        
        // Retrieve data
        if let tokenOptional = try? keychain.getString(accessTokenKey), let token = tokenOptional {
            print("Token is \(token)")
        }
        
        // Remove data
        do {
            try keychain.remove(accessTokenKey)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func lottieExample() {
        let animationView = AnimationView()
        let animation = Animation.named("cup-animation")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        self.animationViewWrapper.addSubview(animationView)
        let width = NSLayoutConstraint(item: animationView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        let height = NSLayoutConstraint(item: animationView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        self.animationViewWrapper.addConstraints([width, height])
    }
}

