import Alamofire
import Foundation

func queryRepositories(for userName: String, withTimeout seconds: Double) {
    let semaphore = DispatchSemaphore(value: 0)
    let encodedUserName = userName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    AF.request("https://api.github.com/users/\(encodedUserName)/repos",
               method: .get,
               headers: HTTPHeaders(["Accept": "application/vnd.github.v3+json"]),
               requestModifier: { $0.timeoutInterval = seconds })
        .validate()
        .response(queue: DispatchQueue.global(qos: .utility)) { response in
            defer {
                semaphore.signal()
            }
            let repositoriesResponse = RepositoriesParser.parse(dataReposne: response)
            switch repositoriesResponse {
            case .success(let repositories):
                repositories.forEach {
                    print($0.name)
                }
            case .error(let error):
                print(error.description)
            }
        }
    
    _ = semaphore.wait(timeout: .distantFuture)
}

print("Type github-user name here, please")
guard let githubUserName = readLine(), !githubUserName.isEmpty else {
    fatalError("Empty input. Please use enter someone username ")
}
print("Repositories owned by \(githubUserName) :")

queryRepositories(for: githubUserName, withTimeout: 10)


