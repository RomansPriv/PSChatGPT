function Get-AIImage 
    {
        [CmdLetBinding()]
        param (
        [String]$apiKey = (Get-Secret -Name ChatGptAPI|convertfrom-Securestring -AsPlainText),
        
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true
            )]
        [String]$question,

        [Validaterange(1,10)]
        [int]$number = 1,

        [ValidateSet("256x256","512x512","1024x1024")]
        [String]$size = "512x512",

        [ValidateSet('url','b64_json')]
        [string]$responseFormat = 'url'
        )

    begin {
        $apiEndpoint = "https://api.openai.com/v1/images/generations"
    }
    
    process {
        # Set the request headers
        $headers = @{
        "Content-Type" = "application/json"
        "Authorization" = "Bearer $apiKey"
        }   

        # Set the request body
        $requestBody = @{
            "prompt" = $question
            "n" = $number
            "size" = $size
            "response_format" = $responseFormat
        }

        # Send the request
        $response = Invoke-RestMethod -Method POST -Uri $apiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)

        # Print the response
        $response.data.url
    }

    end {

    }
}



