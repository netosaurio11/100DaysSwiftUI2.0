import UIKit

struct User: Codable {
  enum CodingKeys: String, CodingKey {
    case firstName = "first"
    case lastName = "last"
  }

  var firstName: String
  var lastName: String
}

let str = """
{
    "first": "Andrew",
    "last": "Glouberman"
}
"""

let data = Data(str.utf8)

do {
  let decoder = JSONDecoder()

  let user = try decoder.decode(User.self, from: data)
  print("Hi, I'm \(user.firstName) \(user.lastName)")
} catch {
  print("Whoops: \(error.localizedDescription)")
}
