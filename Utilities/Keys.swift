import SwiftUI

class Constants {
    static let shared = Constants()
    
    // MARK: - Intro
    
    let whatIsADHD = "ADHD stands for attention deficit hyperactivity disorder. It’s a brain disorder that affects how you pay attention, sit still, and control your behavior. It happens in children and teens and can continue into adulthood."
    
    let symptomsOfADHD = """
Being unable to sit still, especially in calm or quiet surroundings👣\n
Constantly fidgeting 👋\n
Being unable to concentrate on tasks 🫠\n
Excessive physical movement 🤾🏻‍♂️\n
Excessive talking 🗣️\n
Being unable to wait their turn 🫣\n
Acting without thinking 💨\n
Interrupting conversations 🙊\n
Little or no sense of danger ⚠️
"""
    
    let whyFriendo = "A study says 6.76% people suffer from ADHD in the world, and among them only 13% get proper medication and therapy!\n\nHere comes Friendo, Its is an all in one friend for people suffering from ADHD. Friendo with its intuitive app based on the idelogy of learn and reward, claims to help childrens suffering from ADHD"
    
    let whatFriendoDoes = "Friendo helps children to improve their thought process and try to increase their attention. It have various tasks, On completing the tasks children will be rewarded with coins which can be used in the fun zone.\nThe statistics screen will help parents to understand the mood of their child and know what kind of care they need"
    
    let benefitsOfFriendo = "Using Friendo will lead to an increase in focus and stillness in children. Its intuitive ideology learns from the activity of students to guide parents on how their child is feeling. \nChildren will learn new things by completing the tasks and parallelly their activity is monitored"
    
    // MARK: - Story
    
    let stories:[[StoryViewerData]] = [[StoryViewerData(image: "1MImg", story: "Once there lived a clever monkey on the banks of a river. He dwelt on a blackberry tree and feasted often on the delicious blackberries."),
                                        StoryViewerData(image: "2MImg", story: "And in the river, there dwelt a huge crocodile. Its home was at the other end of the river, but it spent most of its days near where the monkey was."),
                                        StoryViewerData(image: "2MImg", story: "Now, the monkey was by no means selfish. He was a kind and friendly monkey who liked to share. So he used to pluck out some blackberries for the crocodile too and throw them down to him. The crocodile of course was quite happy at this friendly gesture and more so with the delicious blackberries. He spent many a happy day, feasting on those blackberries."),
                                        StoryViewerData(image: "4MImg", story: """
One day, the crocodile took some of the blackberries home to his wife. She enjoyed the delicious berries. But unfortunately, she did not, like a good crocodile, stop at that. She wanted nothing less than the monkey's heart! "That fellow practically lives on these sweet berries, he must be full of them. Imagine how sweet his heart must be," thought the crocodile's greedy wife. "I must have the monkey's heart! And I must have it now!" was the command. And the poor crocodile set off to do her bidding.
"""),
                                        StoryViewerData(image: "5MImg", story: """
He reached back the blackberry tree where the monkey dwelt. The monkey was most surprised. "You just went back home, didn't you? How come you are back again, today," he exclaimed. "My wife has sent me back to invite you home for dinner," the crafty crocodile said. "She wishes to thank you for those delicious blackberries. I took home some for her today."
"""),
                                        StoryViewerData(image: "6MImg", story: """
"But my friend, your home is across the river and I cannot swim," cried the monkey. "You can jump on to my back and I shall take you home across the river," offered the crocodile. And the unsuspecting monkey set off with the crocodile.
"""),
                                        StoryViewerData(image: "7MImg", story: """
Halfway through the river, the curious monkey asked, "What is to be for dinner, my friend". And the crocodile blurted out, "You are, you poor fellow. You are going to be our dinner. My wife wants to eat your heart!"
"""),
                                        StoryViewerData(image: "8MImg", story: """
The monkey was stunned. He had not expected this treachery. And he was in the middle of the river, not knowing how to swim! So he could not just jump off too. But the monkey kept his wits about him. He thought and thought and soon hatched a plan to outwit the crocodile, whom he knew was not so very smart. He began to talk in very sweet tones.
"""),
                                        StoryViewerData(image: "9MImg", story: """
"My dear friend," the monkey said, "Why didn't you tell me about this before we set off? I would be delighted for you to eat my heart since you feel it is so sweet, but don't you know, we monkeys keep our hearts outside our bodies. My heart is right now on the blackberry tree." The foolish crocodile was puzzled. "What should I do now," he cried. "My wife is expecting your heart." "Then you had better not disappoint her, turn around and take me back to the tree, so that I can get my heart and then come with you," the clever monkey suggested. And the foolish crocodile did exactly that!
"""),
                                        StoryViewerData(image: "10MImg", story: """
And soon the crocodile reached back the river bank. The monkey took a flying leap and landed back on the safety of his home on the blackberry tree. "You utterly ungrateful fellow," he cried. "Is this the way you repay my friendship? You were going to kill me forgetting the hundreds of days you spent in my company and eating my blackberries. Thank God you are so foolish. Do you really think anyone can have their heart outside their body? My heart is very much within me. And as for you, cruel and ungrateful fellow, you have no heart at all. Now, get off my sight and never come back."

The foolish crocodile sadly went back having lost the monkey's friendship and the endless supply of blackberries.
""")]]
    
    // MARK: - Facts
    
    let facts:[FactsModel] = [FactsModel(fact: "After one of Their Engines Fails, Some Planes Can Fly for up to Five Hours", image: "airplane.departure"),
                              FactsModel(fact: "A ladybird might eat more than 5,000 insects in its lifetime!", image: "ladybug.fill"),
                              FactsModel(fact: "A human heart is roughly the size of a large fist.", image: "heart.fill"),
                              FactsModel(fact: "The Study of Flags Is Called Vexillology", image: "flag.2.crossed.fill"),
                              FactsModel(fact: "Over 2,500 Varieties of Apples are Grown in the United States", image: "apple.logo"),
                              FactsModel(fact: "Sun takes an average of 27 Earth days to rotate on its axis", image: "sun.max.fill"),
                              FactsModel(fact: "Earth rotates at around 1000 miles an hour", image: "globe.americas.fill"),
                              FactsModel(fact: "Time passes faster for your face than for your feet (assuming you're standing up)", image: "clock.fill"),
                              FactsModel(fact: "Sixty percent of the human brain is made of fat", image: "brain")] 
}
