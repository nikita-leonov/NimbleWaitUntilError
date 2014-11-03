//
//  NimbleWaitUntilErrorSpec
//  NimbleWaitUntilErrorSpec
//
//  Created by Nikita Leonov on 10/31/14.
//  Copyright (c) 2014 Nikita Leonov. All rights reserved.
//

import Quick
import Nimble

class NimbleWaitUntilErrorSpec:QuickSpec {
    override func spec() {
        describe("waitUntil") {
            context("when there is heavy dispatch async happening") {
                beforeEach {
                    dispatch_async(dispatch_get_main_queue()) {
                        var i:Int = 0
                        var result:Int = 2
                        for (i = 0; i < 1000000000; i++) {
                            result = result^result^i
                        }
                    }
                }
                it("will fail.") {
                    waitUntil { done in
                        done()
                    }
                }
            }
        }
    }
}