//
//  Created by Yaroslav Zhurakovskiy on 26.02.2020.
//


extension String {
    init<Object: AnyObject>(addressOf object: Object) {
        self.init(describing: Unmanaged.passUnretained(object).toOpaque())
    }
}
