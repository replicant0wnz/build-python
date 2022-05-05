# build-python
Easily extendible Python3 image with pyyaml, boto3, and pytest. `Makefile` will push to [ECR](https://aws.amazon.com/ecr/)

## Usage

Example

**Run pytest in project directory**
```bash
docker run -v $PWD:/opt -w /opt build-python:local python -m pytest tests
```


## Extending
1. Clone this repository
2. Modify `makefile.json`
3. 
