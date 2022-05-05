# build-python
Easily extendible Python3 image with pyyaml, boto3, and pytest. `Makefile` will push to [ECR](https://aws.amazon.com/ecr/)

## Usage

Examples

**Run pytest in project directory**
```bash
docker run -v $PWD:/opt -w /opt replicant0wnz/build-python:latest python -m pytest tests
```

**Build project**
```bash
docker run -v $PWD:/opt -w /opt replicant0wnz/build-python:latest python -m build
```

**Push project to PyPI test**
```bash
docker run -v $PWD:/opt -w /opt replicant0wnz/build-python:latest \ 
    -e TWINE_USERNAME=$PYPI_USERNAME -e TWINE_PASSWORD=$PYPI_PASSWORD \ 
    replicant0wnz/build-python:latest \
    python -m twine upload --repository testpypi dist/* 
```

## Extending
1. Clone this repository
2. Modify `makefile.json`
3. 
