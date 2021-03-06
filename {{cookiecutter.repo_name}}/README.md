![build](https://github.com/{{cookiecutter.github_username}}/actions_test/actions/workflows/cli.yml/badge.svg)

# prj_name

## Development environment setup

Prerequisites:
- [pyenv](https://github.com/pyenv/pyenv)
- [poetry](https://python-poetry.org/)

Setup:
```bash
pyenv install 3.7.5
poetry shell
poetry install
pre-commit install
```

##Add python path of virtualenv generated by poetry in `poetry shell` step as *python.pythonPath* under your user or workspace settings if you're using VS Code. Similar configuration should work for other IDEs.

## Continuous Integration

Running tests:
```bash
pytest
```

Pre-commit checks on all files:
```bash
 pre-commit run --all-files
```
