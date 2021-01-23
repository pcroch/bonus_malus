# README
# Api description: Bonus Malus score

## I. General description 

This api can be used to compute the bonus-malus score for a car insurance. The bonus-malus depends on three factors to determine the score. First, the amount of driving years of the driver. It starts at 0 as it can't be negatif and never ends. Secondly, the amount of accidents at fault (0, 1 or 2) in the past 5 years. Note that if you had more than 2 accidents in the past 5 years, you must contact your insurance to compute your score. Third of all, the usage of the vehicule, can be private or professional. 

The score is set with a minimum of -2: That is to say that no matter, the years of experience of the drivers, the number of sinister and the usage of the vehicule, the insurance score can't be below -2.  

## II. Technical description

**End-points**
        
      Version 4 is actually the production one. A version 3 is one production right now.

**End-points**
     
     In production: https://bomus-malus.herokuapp.com/api/v4/scores?sinister[]=id&years[]=id&pro[]=id
     NB: For now, I will use the local url in the documentation and not the production one. (I will update it later)

     local URL: http://localhost:3000/api/v4/scores?sinister[]=id&years[]=id&pro[]=id
            The api can only be used with the **get** method ! 

**How to fetch**

      1 * launch and install the rails server with the following command:
            git clone git@github.com:pcroch/bonus_malus.git
            cd bonus_malus 
            yarn install && bundle install
            rails db:create db:migrate
            rails s

      2 * Execute the following command with the desire params: 
      
            curl http://localhost:3000/api/v4/scores\?sinister[]=2&years[]=2&pro[]=1
            
            ==> render: {"Bonus_Malus_Score":22,"status":"success"}

            Query String: sinister[]=id&years[]=id&pro[]=id

            For example: Query string: sinister[]=2&years[]=2&pro[]=1

**A- HOW TO**

    You have three parameters:
      1 * sinister:
        - Amount of driving years
        - Integer between [0:2]
        - Used as such: sinister[]=id ==> id is the value
      2 * years:
        - Amount of driving years
        - Positif integer
        - Used as such: years[]=id ==> id is the value
      3 * pro:
        - Usage (private or professional)
        - Binary parameter. 0 means professional usage and 1 means private usage
        - Used as such: pro[]=id ==> id is the value


 **B- Cross-origin resource sharing** 
 
 (CORS) is already setup and so the api is ready to be used in production.


**C- Error rendering description:** 

  **Error code 1: Missing params**
  
    - There is at least one params *missing* in the query string. Please check again
    - By missing, I mean that the params is not even in the query string.
    - For example: " sinister[]=3&years[]=2" ==> pro[]=1 is missing.
     
  **Error code 2: Number only**
  
    - The api accepts only numbers. If you have that error, it means that you have included at least one non-digit character.  
    - For example: " sinister[]=&years[]=aaaa&pro[]=1 " ==> years param has "aaaa" value instead of a digit.
     
  **Error code 3: Missing value(s)**
  
    - At least one of the params has an empty value.
    - For example: " sinister[]=&years[]=2&pro[]=1 " The params sinister has no value in the querry string as such render the error code 3
     
  **Error code 4: Sinister value greater than 2**
  
    - The sinister params accept only value between 0 and 2. 
    -  As the number of sinisters can't be negatif which makes sense. But if you had more than 2 sinisters in the last 5 years, you must contact your insurance for        special condition.
    - For example: " sinister[]=3&years[]=2&pro[]=1 "
   
  **Error code 5: Pro params should be 0 or 1**
  
    - The pro params is a binary param as such it only accepts 0 or 1. if you put any others value you will have an error message asking you to change that value.
    - For example: " sinister[]=3&years[]=2&pro[]=2 " =+> the pro parmas has an incorrect value.
    
## II. Testing description

**A- HOW TO**

      Run: bundle exec rspec
      
      It will launch the Unit testing and Integration testing
      You can change the version of the API to test by changing the API version variable in the Rspec file
      
 
**B- Integration Testing Description**

      We have 5 kind of testing.
            0 - Testing the computation with specific numbers to cover all of the aspect of it;
            1-  Testing the error code 1 with 4 cases when a params is missing;
            2-  Testing the error code 2 with 4 cases when the the value of a params is not an integer;
            3-  Testing the error code 3 with 4 cases when the value of a params is missing;
            4-  Testing the error code 4 with 1 case where the Sinister params is greater than two;
            5-  Testing the error code 5 with 1 case where the Pro params is greater equal to two;
            
 **C- Unit Testing Description**
 
      We have 2 kind of testing.
            0 - Testing if we get the correct params in the action method: index;
            1-  Testing  if all the methods a private exept for action method: index ;
           
