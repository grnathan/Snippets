#Original

Get-Process |
  Group-Object -Property Name -NoElement |
    Where-Object { $_.Count -gt 1 } |
      ForEach-Object {
        [PSCustomObject]@{
            Count= $_.Count
            Name = $_.Name
            'Memory Sum in MB' = [math]::Round(( Get-Process -Name $_.Name |
                Measure-Object WorkingSet -sum).sum /1Mb, 3)
        }
      }    # | Sort-Object -Property 'Memory Sum in MB'
      
      
      
      #Adjusted



Get-Process |
  Group-Object -Property Name -NoElement |ds
      Where-Object { $_.Count -gt 0 } |
       ForEach-Object {
        [PSCustomObject]@{
            Count= $_.Count
            Name = $_.Name
            'Memory Sum in MB' = [math]::Round(( Get-Process -Name $_.Name |
                Measure-Object WorkingSet -sum).sum /1Mb, 3)
        }
      }    | Sort-Object -Property 'Memory Sum in MB'
      
      
      
