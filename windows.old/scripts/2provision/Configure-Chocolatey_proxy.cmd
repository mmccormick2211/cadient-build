@echo off
echo.############### Chocolatey Package Manager Configuration Block ###############
:: ## Defaults are listed and commented out. Copy line, uncomment, and modify.
$env:chocolateyProxyLocation = 'http://squidproxy.dmz.unicru.com:8080'
#and optionally 
$env:chocolateyProxyUser = 'prodproxy';$env:chocolateyProxyPassword = 'Pr0dPr0xY'

choco config unset --name="cacheLocation"
choco config unset --name="commandExecutionTimeoutSeconds"
choco config unset --name="containsLegacyPackageInstalls"
choco config unset --name="proxy"
choco config unset --name="proxyBypassList"
choco config unset --name="proxyBypassOnLocal"
choco config unset --name="proxyPassword"
choco config unset --name="proxyUser"
choco config unset --name="upgradeAllExceptions"
choco config unset --name="webRequestTimeoutSeconds"
choco config set --name="proxy" --value='http://squidproxy.dmz.unicru.com:8080'
choco config set --name="proxyUser" --value="prodproxy"
choco config set --name="proxyPassword" --value="Pr0dPr0xY"

echo.############### Chocolatey Package Manager Feature Block ###############
:: ## Defaults are listed and commented out. Copy line, uncomment, and modify.

:: choco feature enable  -name="allowEmptyChecksumsSecure"
:: choco feature enable  -name="autoUninstaller"
:: choco feature enable  -name="checksumFiles"
:: choco feature enable  -name="ignoreInvalidOptionsSwitches"
:: choco feature enable  -name="powershellHost"
:: choco feature enable  -name="showDownloadProgress"
choco feature disable --name="showDownloadProgress"
:: choco feature enable  -name="showNonElevatedWarnings"
:: choco feature enable  -name="usePackageExitCodes"
:: choco feature enable  -name="virusCheck"
:: choco feature disable -name="allowEmptyChecksums"
:: choco feature disable -name="allowGlobalConfirmation"
:: choco feature disable -name="exitOnRebootDetected"
choco feature enable  -name="exitOnRebootDetected"
:: choco feature disable -name="failOnAutoUninstaller"
:: choco feature disable -name="failOnInvalidOrMissingLicense"
:: choco feature disable -name="failOnStandardError"
:: choco feature disable -name="ignoreUnfoundPackagesOnUpgradeOutdated"
:: choco feature disable -name="logEnvironmentValues"
:: choco feature disable -name="logValidationResultsOnWarnings"
:: choco feature disable -name="logWithoutColor"
:: choco feature disable -name="removePackageInformationOnUninstall"
:: choco feature disable -name="scriptsCheckLastExitCode"
:: choco feature disable -name="skipPackageUpgradesWhenNotInstalled"
:: choco feature disable -name="stopOnFirstPackageFailure"
choco feature enable --name="stopOnFirstPackageFailure"
:: choco feature disable -name="useEnhancedExitCodes"
:: choco feature disable -name="useFipsCompliantChecksums"
:: choco feature disable -name="useRememberedArgumentsForUpgrades"
choco feature enable --name="useRememberedArgumentsForUpgrades"
:: choco feature unknown -name="usePackageRepositoryOptimizations"
EXIT /B
