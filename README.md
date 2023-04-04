## End to End Machine Learning Student Performance Indicator

### Software & Tools Requirements

1. [Github Account](https://github.com)
2. [VSCodeIDE](https://code.visualstudio.com/)
3. [GitCLI](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line)
4. [DVC](https://dvc.org/)
<!-- 4. [AWS](https://aws.amazon.com/) -->

Create a new environment

```
conda create -p venv python==3.8 -y
```

#### Current Progress

GitHub Actions CI pipeline test completed.  

Currently setting up Data Version Control (DVC)


<!-- Setting up automatic pull_request test via Actions. Need to apply unit tests within python code via hypothesis and pandera before the automatic pull_request test is able to be completed. -->

<!-- ON HOLD: Next, connect Actions to AWS Elastic Beanstalk then deploying python container to complete the CD implementation. -->
<!-- Then repeat with docker container -->
