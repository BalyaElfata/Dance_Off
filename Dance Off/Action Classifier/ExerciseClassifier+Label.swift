/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Defines the app's knowledge of the model's class labels.
*/

extension DanceModel {
    /// Represents the app's knowledge of the Exercise Classifier model's labels.
    enum Label: String, CaseIterable {
//        case lunges = "Lunges"
//        case burpees = "Burpees"
//        case jumpingJacks = "Jumping Jacks"
//
//        /// A negative class that represents irrelevant actions.
//        case otherAction = "Other Action"
        case spongebob = "spongebob"
        case what_is_love = "what_is_love"
        case bagas_dribble = "bagas_dribble"
        case caramelldansen = "caramelldansen"
        case cupid = "cupid"
        case fortune_cookie = "fortune_cookie"
        case gangnam_style = "gangnam_style"
        case harlem_shake = "harlem_shake"
        case joget_keju = "joget_keju"
        case magnetic = "magnetic"
        case permission_to_dance = "permission_to_dance"
        case signal = "signal"
        case watch_me = "watch_me"
        case what_it_is = "what_it_is"
        case darari = "darari"
        case others = "others"

        /// Creates a label from a string.
        /// - Parameter label: The name of an action class.
        init(_ string: String) {
            guard let label = Label(rawValue: string) else {
                let typeName = String(reflecting: Label.self)
                fatalError("Add the `\(string)` label to the `\(typeName)` type.")
            }

            self = label
        }
    }
}
