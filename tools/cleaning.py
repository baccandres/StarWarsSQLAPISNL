
def character(x):
    return x.split(" ", 1)[1].split(" ", 1)[0]


def dialogue(x):
    return x.split(" ", 1)[1].split(" ", 1)[1]

def cleandf(x):
    x['character'] = x['character "dialogue"'].apply(character)
    x['dialogue'] = x['character "dialogue"'].apply(dialogue)
    x = x.drop(columns='character "dialogue"')
    return x

def strip(x):
    return x.strip('"')


