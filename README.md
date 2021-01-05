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


**Error rendering description:** 
  error code 1: Missing params
  There is at least one params *missing* in the querry string. Please check again
  By missing, I mean that the params is not even inthe querry string.
  Error code 2: Number only
  The api accepts only numbers. If you have that error, it means that you have included at least one non-digit character.  
  Error code 3: Missing value(s)
  At least one of the params has an empty value.
  For example: " sinister[]=&years[]=2&pro[]=1 " The params sinister has no value in the querry string as such render the error code 3
  Error code 4: Sinister value greater than 2
  The sinister params accepts only value between 0 and 2. 
  As the number of sinisters can't be negatif which makes sence. But if you had more than 2 sinisters in the last 5 years, you must contact your broken for   special condition.

  def render_errors_boolean
    render_errors([{ code: '5', message: 'Pro params should be 0 or 1' }], :not_acceptable)
  end


