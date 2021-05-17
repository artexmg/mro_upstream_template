import os

def bricks(char:str, n : int) -> str:
    """ Makes a line of a single character of length n """
    return ("").join(tuple([char for i in range(n)]))

def welcome() -> int:
    """
    Initial instructions to start working
    with the project and test it!
    """
    marquee = bricks('*',80)
    print(f"{marquee}")
    print(f"*\t\t-oOo-{{cookiecutter.project_name}}-oOo-")
    print(f"{marquee}")
    
    print(f"\t{{cookiecutter.project_short_description}}\n")

    # Set of inital tasks needed for the template to work 
    print(f'\tToDo:\n')
    print(f'\t*) $cd {{cookiecutter.repo_name}}\n')
    print(f'\t*) init your local git repository:\n\t\t$git init\n')

    # Poetry Instructions
    print(f'\t*) create virtual env:\n\t\t$pyenv install 3.7.5\n')
    print(f'\t*) create virtual env:\n\t\t$poetry shell\n')
    print(f'\t*) install your dependencies:\n\t\t$poetry install --dev\n')

    # Testing instructions
    print(f'\t*) test your {{cookiecutter.project_name}}:\n\t\t$poetry run pytest\n')
    
    print("\n")
    print(f"{marquee}")

    return 0