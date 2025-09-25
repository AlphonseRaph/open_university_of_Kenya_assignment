"""A Dice Rolling Simulator"""

import random;
import os;
import from byllm.llm { Model }

# Choose model for fun comments
glob llm = Model(
    model_name="gemini/gemini-2.0-flash",
    verbose=False,
    api_key=os.getenv("GEMINI_API_KEY")  # <-- pull from env var
);

"""Provide a fun comment after rolling the dice"""
def comment_on_roll(result: int) -> str by llm();

walker DiceGame {
    has result: int;

    can start with `root entry;
    can roll_dice with turn entry;
}

node turn {
    has last_result: int = 0;
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    root spawn DiceGame(0);   # provide result
}

