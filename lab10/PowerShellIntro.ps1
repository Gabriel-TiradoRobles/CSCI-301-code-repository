<#
Powershell tutorial file

Author: M. J. O'Neill

Purpose: Provide a quick introduction to PS for the professional that may be
required to maintain inherited code

Download: https://www.microsoft.com/en-us/p/powershell/9mz1snwt0n5d?activetab=pivot:overviewtab

Official Reference Site: https://docs.microsoft.com/en-us/powershell/

Created by: Jeffery Stover (2006). (Creation dates for languages are approximate)

Philosophy: http://www.jsnover.com/Docs/MonadManifesto.pdf
    - Definition: From Liebniz (https://plato-philosophy.org/wp-content/uploads/2016/07/The-Monadology-1714-by-Gottfried-Wilhelm-LEIBNIZ-1646-1716.pdf)
    - Problem: (Paragraph 3)
    - Solution: (Paragraph 5)

Programming Aids
    - IDE: Visual Studio Code
    - Processing Directives: None
    - Error Handling: In code through try-catch-finally
    - Interpeter mode available? Yes

Getting started
    - Comments: # - single line, <# multiline #> <#
    - Grouping code
#>

#-----Output (note verb-object format)
Write-Host "Welcome to PowerShell!" #outputs to console

#-----Input (note syntax of assigning variable)
$MyName = "Occupant"
"My name is $MyName"
Write-Host "`n"  #note different new line delimiter (called "backtick")
$MyName = Read-Host "Input Name" #accepts input
Write-Host "Welcome $MyName" #displays using string interpolation
"My name is $MyName"

#-----Boolean
clear
$true  #note that the variable is automatically piped to the console
$false

#-----logical operations (note use of string interpolation and expression evaluation)
Write-Host "Logical true AND false: $($true -and $false)"
Write-Host "Logical true OR false: $($true -or $false)"

#iteration (wrong)
for ($i = 0; $i = 5; $i++) { #assignent vs check for equality
  $i  
} #endless loop

#iteration (wrong)
for ($i = 0; 5; $i++) { #5 is non zero and thus always true
    $i  
  } #endless loop

#iteration (wrong)
for ($i = 0; 0; $i++) {
    $i  
  } #zero is considered "false"

#iteration (right)
for ($i = 0; $i -le 5; $i++) {
    $i  
  }

#Ternary Operator (AKA immediate IF) (with a nod to Douglas Adams’ “The Hitchhiker’s Guide to the Galaxy,”)
"The answer is "+ ((84/2 -eq 42)?'Good':'Bad')
"The answer is "+ ((4/2 -eq 42)?'Good':'Bad')
#positive values are considered true
(40)?"Good":"Bad"

#zero values are considered false
(40-40)?"Good":"Bad"

#negative values are considered true
(40-400)?"Good":"Bad"

#String Manipulation

#double quotes support expanding variables (string interpolation) and expression evaluation
"PS version: $($PSVersionTable.PSVersion)"

#double quotes vs single quotes
"The value of $(2+3) is 5."
'The value of $(2+3) is 5.'

#homework: review https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.1

#regular expressions
#source: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-7.1
Select-String -Path "$PSHOME\en-US\*.txt" -Pattern '\?'

Select-String -Path "$PSHOME\en-US\*.txt" -Pattern 'h.*p'

#set working directory in preparation for next exercise
Set-Location -Path "/home/student/csci-301-fall-2021/lab10"

Select-String -Path ./KJV.txt -Pattern 'suburb'

#Read/write text file
# source: https://techgenix.com/read-text-file-powershell/
$file_data = Get-Content ./KJV.txt
$file_data | Select-Object -First 20 #a little review on copyright
$linenumber= $file_data | select-string "Alpha and Omega" 
$linenumber.LineNumber #outputs, among others, 985166
$file_data[98515] #why did I say 98515 rather than 98516?

# functions
#source: https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.1
#Example by Mike Robbins  hence the "Mr" in the name (avoids reserved words)
function Get-MrPSVersion {
  $PSVersionTable.PSVersion 
}

Get-MrPSVersion

#decision structures
#source: https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.1

#If statement (supports REGEX)
$Myvar = 'fruit'
if ( $Myvar -eq 'animal' )
{
    Write-Host "It's an animal"
}
elseif ( $Myvar -eq 'vegetable' )
{
  Write-Host "It's a vegetable"
}
elseif ( $Myvar -eq 'mineral' )
{
  Write-Host "It's a mineral"
}
else
{
  Write-Host "I don't know what it is"
}

#also has switch statement
#source: https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-switch?view=powershell-7.1

#iterations - already seen FOR
#foreach source: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-7.1

#while source:https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_while?view=powershell-7.1

#do while/until source: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_do?view=powershell-7.1

#complex data structures

# Arrays source:https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arrays?view=powershell-7.1

#Hash tables source: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_hash_tables?view=powershell-7.1

#gotchas and quirks source:https://www.johndcook.com/blog/powershell_gotchas/