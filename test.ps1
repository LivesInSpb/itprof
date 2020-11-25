Import-module ActiveDirectory
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select a Object'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please select object:'
$form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(20,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

[void] $listBox.Items.Add('Bulgaria_branch')
[void] $listBox.Items.Add('Croatia_branch')
[void] $listBox.Items.Add('Cyprus')
[void] $listBox.Items.Add('Czech')
[void] $listBox.Items.Add('Deutschland_branch')
[void] $listBox.Items.Add('Egypt_branch')
[void] $listBox.Items.Add('France_branch')
[void] $listBox.Items.Add('France_branch')
[void] $listBox.Items.Add('Montenegro')
[void] $listBox.Items.Add('Spain_branch')
[void] $listBox.Items.Add('Thailand_branch')
[void] $listBox.Items.Add('Tunis_branch')
[void] $listBox.Items.Add('Montenegro')

$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

  //  вывести  скобку это будет начало формата  json
print("{") 

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem
	$x
   Get-ADUser -SearchBase "OU=$x,OU=DMC,OU=Departments,DC=Tui,DC=local" -Filter * -Properties * | ft name,userprincipalname,emailaddress 
  // вывести строку
  "name" : "Alex" , "juserprincipalname" : "Aloha" , "emailaddress" : "qwe@qwe.ru",//перенос строки нужен, чтобы красивы было.Или не все в одну строку, разницы не будет особой 
}

 // вывести скобку это окончание формата  json
print("}") 