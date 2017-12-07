import Foundation
import Async

// Supporting code
enum MyError: Error { case anyError }
public extension Promise {
    convenience init(_ work: @escaping (_ resolve: (T) -> (), _ reject: (Error) -> ()) -> (),
                     on queue: DispatchQueue = .init(label: "test-queue"),
                     _ expectation: T.Type = T.self) {
        self.init(expectation)
        queue.async {
            work({ result in self.complete(result) },
                 { error in self.fail(error) } )
        }
    }
}

let promise = Promise<Void>({ (resolve: () -> (), reject: (Error) -> ()) in
    // usleep(50) // This line would fix the code
    reject(MyError.anyError)
})

promise.future.catch { err in print(err) }

RunLoop.current.run(until: .distantFuture)
