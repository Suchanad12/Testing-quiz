*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    https://chiangmuan.igovapp.com    chrome
Suite Teardown    Close Browser

*** Variables ***
     
*** Keywords ***
Regist
    SeleniumLibrary.Wait Until Page Contains 	                     ระบบบริการประชาชน	                  timeout=None 	 error=None
    SeleniumLibrary.Click Element 	 //*[@id="root"]/div/nav/header/div/a[1]
    SeleniumLibrary.Click Element 	  //*[@id="app"]/div/div/div/div[2]/div/div[2]/a/span

    SeleniumLibrary.Wait Until Page Contains Element	 //*[@id="root"]/div/main/section/div[3]/div[2]/div/div/a[1]/div/div[2]/span[1] 	 timeout=180 	 error=None 	
    SeleniumLibrary.Click Element 	 //*[@id="root"]/div/main/section/div[3]/div[2]/div/div/a[1]/div/div[2]/span[1] 	 modifier=False 	 action_chain=False
    
To Home
    SeleniumLibrary.Page Should Contain Element	 //*[@id="root"]/div/nav/header/ul/div/a/div 	timeout=10
    SeleniumLibrary.Click Element 	 //*[@id="root"]/div/nav/header/ul/div/a/div 	 modifier=False 	 action_chain=False
    SeleniumLibrary.Wait Until Location Is 	 https://chiangmuan.igovapp.com/ 	 timeout=10 	 message=None
    
Health_Checking
    SeleniumLibrary.Click Element 	 //*[@id="root"]/div/main/section[2]/div/a[1]/div 	 modifier=False 	 action_chain=False
    SeleniumLibrary.Wait Until Location Is 	 https://chiangmuan.igovapp.com/health 	 timeout=None 	 message=None
    SeleniumLibrary.Click Element 	 locator=//*[@id="root"]/div/main/section[2]/div/div[2]/div[1]/a 	 modifier=False 	 action_chain=False
    SeleniumLibrary.Wait Until Element Is Visible 	 locator=//a[contains(@href, 'diagnostic')] 	 timeout=120 	 error=None
    SeleniumLibrary.Click Element 	 locator=//a[contains(@href, 'diagnostic')]	 modifier=False 	 action_chain=False


    

*** Test Cases ***
Register
    Regist
Verify id
    To Home
Health_Check_Req
   To Home
   Health_Checking
   sleep    10s
   Capture Page Screenshot 	  
