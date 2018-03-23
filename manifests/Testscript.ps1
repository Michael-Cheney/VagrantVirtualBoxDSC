Configuration Testscript
{
    param ($MachineName)
	Import-DscResource –Module PSDesiredStateConfiguration
    Import-DscResource -Module PowerShellModule
    Import-DscResource -Module cChoco
    Node $MachineName
    {
        #region PowerShell Modules
            PSModuleResource Pester
            {
                Ensure = 'present'
                Module_Name = 'Pester'
       
            }
            PSModuleResource PSScriptAnalyzer
            {
                Ensure = 'present'
                Module_Name = 'PSScriptAnalyzer'
            }
        #endregion
        #region Registry
            Registry RegAssetOwner
            {
                Key = 'HKLM:\Software\Contoso\'
                ValueName = 'AssetOwner'
                Ensure = 'Present'
                ValueData = 'ericlang'
                ValueType = 'String'
            }
			#Windows update disabled
			Registry Windows_update_Disable_01
			{
				Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update'
				ValueName =  'AUOptions'
				ValueData = 1
				ValueType =  'Dword'
				Ensure = 'Present'
			}
			Registry Windows_update_Disable_02
			{
				Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update'
				ValueName =  'NoAutoUpdate'
				ValueData = 1
				ValueType =  'Dword'
				Ensure = 'Present'
			}
			Registry Windows_update_Disable_03
			{
				Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update'
				ValueName =  'CachedAUOptions'
				ValueData = 1
				ValueType =  'Dword'
				Ensure = 'Present'
			}
			Registry Windows_update_Disable_04
			{
				Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update'
				ValueName =  'ForcedReboot'
				ValueData = 0
				ValueType =  'Dword'
				Ensure = 'Present'
			}
			Registry Windows_update_Disable_05
			{
            Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update'
            ValueName =  'IncludeRecommendedUpdates'
            ValueData = 0
            ValueType =  'Dword'
            Ensure = 'Present'
        }
        #endregion
        #region Application Installation
        cChocoPackageInstaller installSkypeWithChocoParams
        {
            Name                 = 'skype'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller googlechrome
        {
            Name                 = 'googlechrome'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller sevenzip
        {
            Name                 = '7zip'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller notepadplusplus
        {
            Name                 = 'notepadplusplus.install'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller putty
        {
            Name                 = 'putty'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller sysinternals
        {
            Name                 = 'sysinternals'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller procexp
        {
            Name                 = 'procexp'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller keepass
        {
            Name                 = 'keepass'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller winscp
        {
            Name                 = 'winscp'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller python
        {
            Name                 = 'python'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller wireshark
        {
            Name                 = 'wireshark'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller adblockpluschrome
        {
            Name                 = 'adblockpluschrome'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller greenshot
        {
            Name                 = 'greenshot'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        cChocoPackageInstaller conemu
        {
            Name                 = 'conemu'
            Ensure               = 'Present'
            AutoUpgrade          = $True
        }
        #endregion
    }
}