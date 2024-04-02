import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            callBack?(value)
        }
    }
    private var callBack: ((T?) -> Void)?
    
    func bind(callBack: @escaping ((T?) -> Void)) {
        self.callBack = callBack
    }
}

var observableText: Observable<String> = Observable()

observableText.bind { value in
    print("doing something with => \(value ?? "nil")")
}


observableText.value = "Hello"
observableText.value = "World"
observableText.value = "!"
observableText.value = nil
