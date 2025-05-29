
/** some chatbotcomplete = */


// Updated script.js - Hardcoded chatbot responses

const chatInput = document.querySelector('.chat-input textarea');
const sendChatBtn = document.querySelector('.chat-input button');
const chatbox = document.querySelector(".chatbox");

let userMessage;

// Function to create chat list items
const createChatLi = (message, className) => {
    const chatLi = document.createElement("li");
    chatLi.classList.add("chat", className);
    chatLi.innerHTML = `<p>${message}</p>`;
    return chatLi;
}

// Function to handle user input and generate response
const handleChat = () => {
    userMessage = chatInput.value.trim();
    if (!userMessage) return;

    // Display user's message
    chatbox.appendChild(createChatLi(userMessage, "chat-outgoing"));
    chatbox.scrollTo(0, chatbox.scrollHeight);

    // Determine the bot's response based on user question
    let botResponse;

    if (userMessage.toLowerCase() === "how to feed a puppy?") {
        botResponse = "Feed your puppy 3-4 times a day with high-quality puppy food. Make sure fresh water is always available.";
    } else if (userMessage.toLowerCase() === "best food for cats?") {
        botResponse = "Cats need protein-rich food. Some good brands are Royal Canin, Whiskas, and Hill's Science Diet.";
    } else if (userMessage.toLowerCase() === "vaccination schedule for dogs?") {
        botResponse = "Puppies should be vaccinated at 6-8 weeks, 10-12 weeks, and 14-16 weeks. Consult your vet for a full schedule.";
    } else if (userMessage.toLowerCase() === "how to train a parrot?") {
        botResponse = "Use positive reinforcement, be patient, and train in short sessions. Start with basic commands like 'step up'.";
    } else {
        botResponse = "Sorry, I don't understand that. Please ask one of the listed questions.";
    }

    // Display bot response
    setTimeout(() => {
        const incomingChatLi = createChatLi(botResponse, "chat-incoming");
        chatbox.appendChild(incomingChatLi);
        chatbox.scrollTo(0, chatbox.scrollHeight);
    }, 600);
};

// Button click triggers chat handling
sendChatBtn.addEventListener("click", handleChat);

// Cancel function
function cancel() {
    let chatbotcomplete = document.querySelector(".chatBot");
    if (chatbotcomplete.style.display != 'none') {
        chatbotcomplete.style.display = "none";
        let lastMsg = document.createElement("p");
        lastMsg.textContent = 'Thanks for using our Chatbot!';
        lastMsg.classList.add('lastMessage');
        document.body.appendChild(lastMsg)
    }
}
/*"""

# Save the updated JS file
updated_js_path = "/mnt/data/chatbot.js"
with open(updated_js_path, "w", encoding="utf-8") as file:
    file.write(updated_js_content)

updated_js_path*/
