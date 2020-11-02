import UIKit

let vw = UIView()

UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

// Trailing closures - preferred
UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
