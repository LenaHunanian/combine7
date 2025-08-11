import UIKit
import Combine

class ButtonViewModel {
    let buttonPressed = PassthroughSubject<Void, Never>()
   
    var pressCount = 0
    var cancellable: AnyCancellable?
    var cancellables = Set<AnyCancellable>()

    init() {
           buttonPressed
               .sink { [weak self] _ in
                   guard let self = self else { return }
                   self.pressCount += 1
                   print("Button pressed \(self.pressCount) times")
               }
               .store(in: &cancellables)
       }
}

let vm = ButtonViewModel()
vm.buttonPressed.send()
vm.buttonPressed.send()
vm.buttonPressed.send()
vm.buttonPressed.send()
vm.buttonPressed.send()
vm.buttonPressed.send()
vm.buttonPressed.send()
