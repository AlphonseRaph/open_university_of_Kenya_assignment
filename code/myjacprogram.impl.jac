impl DiceGame.start {
    if not [root --> (`?turn)] {
        next = root ++> turn(0);
    } else {
        next = [root --> (`?turn)];
    }
    visit next;
}

impl DiceGame.roll_dice {
    # Roll a six-sided dice
    self.result = random.randint(1, 6);

    # Save result in the node
    here.last_result = self.result;

    # Print result and fun comment
    print("You rolled a: " + str(self.result));
    print(comment_on_roll(self.result));

    # Ask if player wants to roll again
    answer = input("Do you want to roll again? (yes/no): ");
    if answer.lower() in ["yes", "y"] {
        here ++> turn(self.result);
    } else {
        print("Thanks for playing!");
        disengage;
    }
}
