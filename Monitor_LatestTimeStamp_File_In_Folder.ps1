#Script Creation Date: 9th-April-2019
#Requirment: We have got custome file monitoring requiremnt for AppsOne where we have been asked that application team want alert if specified folder does not contain any .csv file with todays #time stamp.
##Tested script with below details:
##PSVersion                      5.1.17134.590                                                                                                                   
##PSEdition                      Desktop                                                                                                                         
##PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}                                                                                                         
##BuildVersion                   10.0.17134.590                                                                                                                  
##CLRVersion                     4.0.30319.42000                                                                                                                 
##WSManStackVersion              3.0                                                                                                                             
##PSRemotingProtocolVersion      2.3                                                                                                                             
##SerializationVersion           1.1.0.1    
###################################################################################


#Mention Directory to Monitor
$DIR_PATH="D:\temppp"

#Apply Filters based on file extension
$filter="*.txt"

#Get the Latest file and Its TimeStamp
$latest = Get-ChildItem -Path $PATH -Filter $filter | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$LastModifiedDate=get-date([datetime]$latest.LastWriteTime) -Format g

#Get Current date for comparison
$CurrentDate=get-date -Format g

if($LastModifiedDate -lt $CurrentDate)
{
echo "New file found"
echo $LastModifiedDate
echo $CurrentDate
$latest.FullName
}
else
{
echo "New File missing"
echo $LastModifiedDate
echo $CurrentDate
$latest.FullName

}
