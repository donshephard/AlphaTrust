param($path, $version)

$nuspecPath = Resolve-Path -Path $path;
Write-Host "Updating $nuspecPath";

$year = Get-Date -Format yyyy;

$nuspec = [xml](Get-Content $nuspecPath);

$metadata = $nuspec.package.metadata;

$assemblyVersion = $nuspec.CreateElement('version');
$assemblyVersion.InnerText = $version;
$metadata.AppendChild($assemblyVersion);

$assemblyCopyright = $nuspec.CreateElement('copyright');
$assemblyCopyright.InnerText = [char]0x00A9 + " $year AlphaTrust Corporation";
$metadata.AppendChild($assemblyCopyright);

$nuspec.Save($nuspecPath);
