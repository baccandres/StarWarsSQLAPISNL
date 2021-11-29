import pandas as pd
import numpy as np
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
from config.configuration import engine

analyser = SentimentIntensityAnalyzer()

def characters_list():
    query = list(engine.execute("SELECT `Name` FROM `Starwars`.`Character`;"))
    list_ = [{'Name': i[0]} for i in query]
    return list_

def character_quotes(character):
    query = list(engine.execute(f"""SELECT `Name`, `Dialogue`.`Dialogue`
    FROM `Starwars`.`Character`
    INNER JOIN `Dialogue`
    ON `idCharacter` = `Character_idCharacter`
    WHERE `Name` = '{character}';"""))
    list_ = [{'Quote': i[1]} for i in query]
    return list_

def polarity(character):
    query = list(engine.execute(f"""SELECT `Name`, `Dialogue`.`Dialogue`
    FROM `Starwars`.`Character`
    INNER JOIN `Dialogue`
    ON `idCharacter` = `Character_idCharacter`
    WHERE `Name` = '{character}';"""))
    x = [analyser.polarity_scores(i[1])['compound'] for i in query]
    
    if np.mean(x) >= .05:
        return {'Positive':round(np.mean(x),3)}
    elif np.mean(x) <= -.05:
        return {'Negative':round(np.mean(x),3)}
    else:
        return {'Neutral':round(np.mean(x),3)}
    

### POST ###
def check(column,string):
    if column == "character":
        query = list(engine.execute(f"SELECT `Name` FROM `Starwars`.`Character` WHERE `Name` = '{string}';"))
        if len(query) > 0:
            return True
        else:
            return False
        
    elif column == "dialogue":
        query = list(engine.execute(f"SELECT `Dialogue` FROM `Starwars`.`Dialogue` WHERE `Dialogue` = '{string}';"))
        if len(query) > 0:
            return True
        else:
            return False
        
    elif column == "episode":
        query = list(engine.execute(f"SELECT `Name` FROM `Starwars`.`Episode` WHERE `Name` = '{string}';"))
        if len(query) > 0:
            return True
        else:
            return False

def insertCharacter(string):
    if check ('character', string):
        return 'Character already exists'
    else:
        engine.execute(f"INSERT INTO `Character` (`Name`) VALUES ('{string}');")

