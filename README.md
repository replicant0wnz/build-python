# build-python
Easily extendible Python3 image with pyyaml, boto3, twine, black, and pytest to build and push to PyPI. `Makefile` can push to [ECR](https://aws.amazon.com/ecr/)

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
docker run -v $PWD:/opt -w /opt \ 
    -e TWINE_USERNAME=$PYPI_USERNAME -e TWINE_PASSWORD=$PYPI_PASSWORD \ 
    replicant0wnz/build-python:latest \
    python -m twine upload --repository testpypi dist/* 
```

## Extending
1. Clone this repository
2. Modify `Dockerfile` with any additions
3. Run `make build version=$version`

## Pushing to ECR
1. Modify `makefile.json` with your account#, ECR URI, and region
2. Export `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
    - Example:
        ```bash
        export AWS_ACCESS_KEY_ID=`grep aws_access_key_id ~/.aws/credentials | awk '{print $3}'`
        export AWS_SECRET_ACCESS_KEY=`grep aws_secret_access_key ~/.aws/credentials | awk '{print $3}'`
        ```
2. Run `make all`
