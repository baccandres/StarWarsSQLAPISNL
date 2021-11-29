import pandas as pd
from config.configuration import engine

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