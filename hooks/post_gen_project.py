import os, sys


def welcome() -> int:
    """
    Initial instructions 
    """
    print(f"{{cookiecutter.project_name}}")
    
    print(f"{{cookiecutter.project_short_description}}\n")

    # Set of inital tasks needed for the template to work 
    print(f'\tcd {{cookiecutter.repo_name}}\n')
    print(f'\tgit init\n')

    # Poetry Instructions
    print(f'\tcreate virtual env:\n\t\tpyenv install 3.7.5\n')
    print(f'\tinstall dependencies:\n\t\tpoetry install\n')

    # Testing instructions
    print(f'\ttest {{cookiecutter.project_name}}:\n\t\tpoetry run pytest\n')
    
    return 0

if __name__ == "__main__":
    welcome()
    sys.exit(0)    