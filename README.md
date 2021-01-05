# README

**End-points**
URL: http://localhost:3000/api/v2/scores?sinister[]=id&years[]=id&pro[]=id

**Example**
curl http://localhost:3000/api/v2/scores\?sinister\[\]\=2\&years\[\]\=2\&pro\[\]\=1
==> render: {"Bonus_Malus_Score":22,"status":"success"}

Querry String: sinister[]=id&years[]=id&pro[]=id
For example: Queery strting: sinister[]=2&years[]=2&pro[]=1

**HOW TO**
You have three parameters:
  *1- sinister:* 
    - Amount of driving years
    - Integer between [0:2]
  *2- years:* 
    - Amount of driving years
    - Positif integer
  *3- pro:* 
    - Usage (private or professional)
    - Binari parameter. 0 means professional usage and 1 means private usage
    
  
 **Cross-origin resource sharing** (CORS) is already setup and so the api is ready to be used in production.






