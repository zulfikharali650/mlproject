# End-to-End Machine Learning Student Performance Indicator

This project's goal is to understand how a student performance (test scores) is affected by variables such as gender, ethnicity, parental level of education, lunch and test preparation course. My goal, with this project, is to implement and test production level methods/technique to help me understand, develop and advance my DevOps/MLOps skills.    

## Software & Tools Requirements

1. [Github Account](https://github.com)
2. [VSCodeIDE](https://code.visualstudio.com/)
3. [GitCLI](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line)
4. [DVC](https://dvc.org/)  --> the data files are stored in my local drive.
5. [AWS](https://aws.amazon.com/)  --> This has not been properly setup yet.

## Machine Learning Projects Life Cycle

- Understanding the Problem Statement
- Data Collection
- Data Checks to perform
- Exploratory data analysis
- Data Pre-Processing
- Model Training
- Choose best model


## Current Progress

- GitHub Actions CI pipeline test completed.  
- Currently setting up Data Version Control (DVC)

## TODO

- Setup property-based testing using following python packages:
  * hypothesis
  * panderas

## Project's Phases and Approach 
<style>
    pre {
    max-height: 300px;
    overflow-y: auto;
    }

    pre[class] {
    max-height: 100px;
    }
</style>

1. Data Ingestion: 
    * The data is first read from csv
    * Then split into training and testing
    * Then saved to csv file in the artifacts folder

2. Data Transformation: 
    * ColumnTransformer Pipeline is created:
      * Numeric Variables: 
        * SimpleImputer is applied, with strategy=median, to handle missing values
        * Then, Standard Scaling is performed for scaling
      * Categorical Variables: 
        * SimpleImputer is applied, with most frequent=strategy, to handle missing values
        * Then, OneHotEncoding performed, to transforms categorical data into numerical values
        * After, Standard Scaling is performed for scaling
    * The preprocessor is saved as pickle file in the artifacts folder

3. Model Training: 
    * The base model trained using GridSearchCV to test multiple ML methods and respective parameters
    * Hyperparameters for each model:
        ```{python}
        params={
            "Decision Tree": {
                'criterion':['squared_error', 'friedman_mse', 'absolute_error', 'poisson'],
                # 'splitter':['best','random'],
                # 'max_features':['sqrt','log2'],
            },
            "Random Forest":{
                # 'criterion':['squared_error', 'friedman_mse', 'absolute_error', 'poisson'],
                
                # 'max_features':['sqrt','log2',None],
                'n_estimators': [8,16,32,64,128,256]
            },
            "Gradient Boosting":{
                # 'loss':['squared_error', 'huber', 'absolute_error', 'quantile'],
                'learning_rate':[.1,.01,.05,.001],
                # 'subsample':[0.6,0.7,0.75,0.8,0.85,0.9],
                # 'criterion':['squared_error', 'friedman_mse'],
                # 'max_features':['auto','sqrt','log2'],
                'n_estimators': [8,16,32,64,128,256]
            },
            "Linear Regression":{},
            "K-Neighbour Regressor":{
                'n_neighbors':[5,7,9,11],
                # 'weights':['uniform','distance'],
                # 'algorithm':['ball_tree','kd_tree','brute']
            },
            "XGBRegressor":{
                'learning_rate':[.1,.01,.05,.001],
                'n_estimators': [8,16,32,64,128,256]
            },
            "CatBoosting Regressor":{
                'depth': [6,8,10],
                # 'learning_rate': [0.01, 0.05, 0.1],
                'iterations': [30, 50, 100]
            },
            "AdaBoost Regressor":{
                'learning_rate':[.1,.01,0.5,.001],
                # 'loss':['linear','square','exponential'],
                'n_estimators': [8,16,32,64,128,256]
            }
        } 
        ```
    * Best model is then selected via R<sup>2</sup> values (i.e., Random Forest produced best result) and saved as pickle file in the artifacts folder

4. Prediction Pipeline: 
    * This pipeline converts given data into dataframe and has various functions to load pickle files and predict the final results in python.

5. Flask App creation: 
    * Flask app is created with User Interface to predict the the students math score inside a Web Application.

## Setup 

### Create an Environment
```
conda create -p venv python==3.8

conda activate venv/
```
### Install all the necessary libraries
```
pip install -r requirements.txt
```






<!-- Setting up automatic pull_request test via Actions. Need to apply unit tests within python code via hypothesis and pandera before the automatic pull_request test is able to be completed. -->

<!-- ON HOLD: Next, connect Actions to AWS Elastic Beanstalk then deploying python container to complete the CD implementation. -->
<!-- Then repeat with docker container -->
