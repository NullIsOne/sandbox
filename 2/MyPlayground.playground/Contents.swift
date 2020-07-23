import Foundation

let serialQueue = DispatchQueue(label: "com.foo.bar")
serialQueue.async {
    print("Work 1")
    serialQueue.sync {
        /// не выполнится, т.к. произойдёт deadlock в последовательной очереди
        /// sync заблокирует очередь в ожидании, когда async блок завершится
        /// однако сам вызов sync является частью async  операции, завершение которой он ожидает
        print("Work 2")
    }
}

let globalQueue = DispatchQueue.global()
globalQueue.async {
    print("Work 1")
    globalQueue.sync {
        /// выполнится, т.к. global это параллельная очередь
        print("Work 2")
    }
}
