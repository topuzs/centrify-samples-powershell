# Copyright 2016 Centrify Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function AddAccount {
    param(
        [Parameter(Mandatory=$true)]
        $endpoint,
        [Parameter(Mandatory=$true)]
        $bearerToken,
        [Parameter(Mandatory=$true)]
	$DomainID,
        [Parameter(Mandatory=$true)]
        $User,
        [Parameter(Mandatory=$true)]
        $Password,
        [Parameter(Mandatory=$true)]
        $Description, 
        [Parameter(Mandatory=$true)]
        $Host    

    )
	
    $restArg = @{}
    $restArg.User = $User
    $restArg.Password = $Password
    $restArg.DomainID = $DomainID
    $restArg.IsManaged = "true"
    $restArg.UseWheel = "false"
    $restArg.Description = $Description
    $restArg.Host = $Host

    $restResult = Centrify-InvokeREST -Method "ServerManage/AddAccount" -Endpoint $endpoint -Token $bearerToken -ObjectContent $restArg -Verbose:$enableVerbose
    if($restResult.success -ne $true)
    {
        throw "Server error: $($restResult.Message)"
    }     
    
    return $restResult.Result		    
}
