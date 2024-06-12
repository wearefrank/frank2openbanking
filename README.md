# Frank2OpenBanking

## Description
Frank2OpenBanking is a Frank Configuration that allows users to request their bank account information from their bank and share it with a third party, and request payment links. This is done by using the Open Banking API.

## Installation
1. Clone the repository.
2. Clone the [FrankRunner](https://github.com/ibissource/frank-runner) repository to the same directory as the repository. The directory should look like this:
```
.
├── frank2openbanking
├── frank-runner
```
3. Run the application with the restart.bat file.
```
IMPORTANT: The proof of concept is built with a restriction in the sandbox environment that only allows redirect URLs to be https://example.com. After the user has logged in, the user will be redirected to https://example.com. The user will have to manually point www.example.com to the token endpoint (/api/token) in the hosts file. Custom certificates are also required to be installed in the browser to allow the application to run due to the restrictions of the sandbox environment.
```

```
NOTE: The application can also be run using the FrankFramework using docker. The docker-compose file is included in the frankframework repository. Follow the mounting instructions in the FrankFramework repository.
```

## Usage
The application supports two application flows:
1. Account information requests
2. Payment link requests
### Account information request
1. Open a browser and navigate to the endpoint /api/ing
2. The user will be redirected to the bank's login page.
3. After logging in, the user will be redirected to the bank's consent page with a token.
5. The token will be used to request the user's account information within the scope of the token.
### Payment link request
1. Open a browser and navigate to the endpoint /api/pay
2. The user will be redirected to the bank's login page.
3. After logging in, the user will be redirected to the bank's consent page with a token.

```
NOTE: The sandbox environment does not support the complete payment link request flow. The user will be redirected to the bank's login page where no further action can be taken due to the restrictions of the sandbox environment. The assumption is made that the payment link request flow will work in a production environment.
```

## Contributing
Pull requests are currently not being accepted for this repository, as it is a proof of concept.
If a custom implementation is built with this proof of concept as base, these are some guidelines to follow:
* Configurations should contain Adapters that are bound to a specific bank.
* Configurations should implement their own logic for obtaining an application token, these tokens can be reused within the expiration time.
* The structure of the application should look like this:
```
.
├── frank2openbanking
    ├──── Bank1 Configuration
        ├──── Payment Adapter
        ├──── Account Adapter
        ├──── etc..
    ├──── Bank2 Configuration
        ├──── Payment Adapter
        ├──── Account Adapter
        ├──── etc..
    ├──── etc..
    
```



# Convert the application to production
The application can be converted to a production environment by following the steps below:
1. Proper certificates must be obtained from a certificate authority. For PSD2 compliance eIDAS certificates are required. These can be obtained from a local certificate authority.
2. URLs must be changed to the production URLs of the bank.
3. The keyID has to be changed to the serial number of the certificate. Format: SN=XXX where XXX is the hexadecimal serial number of the certificate.
4. The tracing id has to match in between requests.
5. The redirect URL has to be changed to the production URL.
6. The application has to be hosted on a secure server with the proper certificates installed.
7. The application has to be registered with the bank's developer portal.

```
NOTE: When working with live data, the application has to take proper security measures to protect the data. The application has to be GDPR compliant.
```
