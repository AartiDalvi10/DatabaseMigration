<# .Synopsis

	This scripts migrates database from like to like and like to unlike databases both on premises and to cloud platforms.
	
	.Description
	
	=> Runs the exe tool
	=> gets source and taget db parameters
	=> connects to source and target db
	=> validate or transfer db
	
	
	.Parameters
	$sourceDbType 
		
		Enter the source dB type viz. MySQL, MSSql, Oracle, etc
	
	$targetDbType
	
		Enter the target dB type viz. MySQL, MSSql, Oracle, etc
		
	$sourceServerName
	
		Enter the source dB server name
	
	$sourceUserName
	
		Enter the source dB user name
	
	$sourcePwd
	
		Enter source dB server password
	
	$sourceDbName
	
		Enter source dB Name
	
	$targetServerName
	
		Enter the target dB server name
		
	$targetUserName
	
		Enter the target dB user name
		
	$targetPwd
	
		Enter the target dB password
	
	$targetDbName
	
		Enter the target dB name
	
	.Example
	
		PS C:\> E:\firsttest.ps1

	.Notes
	gb 02/22/2018

#>

[CmdletBinding()]
 param
    (
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$sourceDbType, 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$sourceServerName='localhost', 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$sourceUserName, 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$sourcePwd, 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$sourceDbName='ccatweb',

	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$targetDbType='MySQL', 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$targetServerName='localhost:3306', 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$targetUserName='root', 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$targetPwd='Syntel123$', 
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$targetDbName='ccatweb',
	
	[Parameter(Mandatory = $false, ValueFromPipeline = $true)]
	[string]$actionCmd='validate'
	
    )

	If ($sourceDbType -Match 'MSSql'){
		
		$serverName1 = 'sql'
	}
	
	If ($sourceDbType -Match 'MySQL') {
	
		$serverName1 = 'mysql'
	}
	
	If ($targetDbType -Match 'MSSql'){
		
		$serverName2 = 'sql'
	}
	
	If ($targetDbType -Match 'MySQL') {
	
		$serverName2 = 'mysql'
	}
	    
	
		
	$td=$serverName1+','+ 'trusted@'+$sourceServerName+','+$sourceDbName 
    $sd=$serverName2+','+$targetUserName+'/'+$targetPwd+'@'+$targetServerName+','+$targetDbName 
    
    $smap='*:'+$targetDbName

	$sd, $td, $smap
	
	C:\Aarti\Data_Migration\tool\sqllines\Nov28\sqlinesdata31701_x64_win\sqldata.exe -sd= $sd -td= $td -cmd = 'transfer' -t = '*.*' -smap = $smap


#sqldata.exe -sd= mysql,Aarti/syntel123$@localhost:3306,ccatweb -td= sql,trusted@localhost,ccatweb -cmd = 'transfer' -t = 'roles'