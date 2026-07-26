# Services

A Windows service is a background computer programs that operate without a User Interface (or UI) or User Login. 
Here, you will learn how to create, configure and automatically and manually run a windows service.

!!! info
    you can also create services via the default Microsoft way.
    Some parts of creating a service here also follow how Microsoft intends for people to create and configure services.
    You can use the Intended Way to create a service [here.](https://learn.microsoft.com/en-us/dotnet/framework/windows-services/walkthrough-creating-a-windows-service-application-in-the-component-designer)
## Creating a Service
Creating a service is pretty basic.

In the CLI, run the command:
``` title="Create Service"

service create -n "MyNewService" -reqdep

```
Here is a breakdown on how the above command works.

Command: service
- service related commands

Flag: -n
- Name of Service, can use -name. (required flag)

Flag: -reqdep
- Install Required Dependencies for Service Creation (required if .NET Framework is not installed.)

!!! info
    You could use this `powershell` command to also create a service.

    ``` powershell title="Create Service (Powershell)"
    New-Service -Name "MyCustomService" `
            -BinaryPathName "C:\Path\To\YourApp.exe" `
            -DisplayName "My Custom Background Service" `
            -Description "This service runs my custom background application." `
            -StartupType Automatic
    ```

## Configuring a Service
Configuring a service can be complex. But you can master it here.
