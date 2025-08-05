// sr63_generate_a_scal.swift

import Foundation

struct ChatbotTracker {
    var id: UUID
    var chatbotID: String
    var userID: String
    var conversationStarted: Date
    var conversationEnded: Date?
    var messages: [Message]
    var intents: [Intent]
    var entities: [Entity]
    var sentimentAnalysis: SentimentAnalysis?
}

struct Message {
    var id: UUID
    var chatbotID: String
    var userID: String
    var messageText: String
    var timestamp: Date
}

struct Intent {
    var id: UUID
    var intentName: String
    var confidenceScore: Double
}

struct Entity {
    var id: UUID
    var entityName: String
    var entityType: String
}

struct SentimentAnalysis {
    var sentiment: Sentiment
    var confidenceScore: Double
}

enum Sentiment: String {
    case positive, negative, neutral
}

class ChatbotTrackerManager {
    private var chatbotTrackers: [ChatbotTracker] = []
    
    func addChatbotTracker(_ chatbotTracker: ChatbotTracker) {
        chatbotTrackers.append(chatbotTracker)
    }
    
    func getChatbotTracker(by id: UUID) -> ChatbotTracker? {
        return chatbotTrackers.first(where: { $0.id == id })
    }
    
    func updateChatbotTracker(_ chatbotTracker: ChatbotTracker) {
        if let index = chatbotTrackers.firstIndex(where: { $0.id == chatbotTracker.id }) {
            chatbotTrackers[index] = chatbotTracker
        }
    }
    
    func removeChatbotTracker(by id: UUID) {
        chatbotTrackers.removeAll(where: { $0.id == id })
    }
}