# PSChatGPT

PowerShell into the ChatGPT OpenAI API via REST.

## Prerequisites

1. Needs Powershell 7x to work.
2. A user account on chatGPT. Create one with your e-Mail address and mobile number, or use an existing microsoft or google account.
3. An API-Key. Create one in your user profile and store it as secret with the name ChatGptAPI (Set-Secret) in your SecretStore.
If you are not familiar with PowerShell SecretManagement, read my [BlogPosts](https://www.powershell.co.at/powershell-secrets-management-part-1-introduction/) about it.
4. Download (clone) my repo and run . ./CodeCompletion.ps1

## Usage

The Script codecompletion contains ine CmdLet Get-AIAnswer. This posts a question to ChatCPG, receives the answer and emits it on the console. By default we use 3 additional default-parameters.

### Model

text-davinci-003 is used as standard-model, there are some more models i added as ValidateSet. You may play around with different language models.

### MaxTokens

For my understanding, tokes define how massive the output from ChatGPT is. This is especially true for code completion, a low token value may cut of emitted code. For me it seems the token value will be used as a rate limit in the future.

### temperature

This value controls how different the first answer is from a second and third answer. With temperature = 0, all three answers for the same question will be identical, with temperature = 1, all answers will have maximum difference.





