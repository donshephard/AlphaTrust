param($path, $version)

$projectPath = Resolve-Path -Path $path;
Write-Host "Updating $projectPath";

$project = [xml](Get-Content $projectPath);

$assemblyVersion = $project.CreateElement('AssemblyVersion');
$assemblyVersion.InnerXml = $version;

$assemblyCompany = $project.CreateElement('AssemblyCompany');
$assemblyCompany.InnerXml = 'AlphaTrust Corporation';

$year = Get-Date -Format yyyy;
$assemblyCopyright = $project.CreateElement('AssemblyCopyright');
$assemblyCopyright.InnerXml = [char]0x00A9 + "$year AlphaTrust Corporation";

$propertyGroup = $project.CreateElement('PropertyGroup');
$propertyGroup.AppendChild($assemblyVersion);
$propertyGroup.AppendChild($assemblyCompany);
$propertyGroup.AppendChild($assemblyCopyright);

$project.Project.AppendChild($propertyGroup);

$project.Save($projectPath);