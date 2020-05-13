choco install choco-upgrade-all-at-startup --yes --acceptlicense
choco install disabledefender-winconfig --yes --force
choco install desktopicons-winconfig --yes --force --params "'/AllIcons:NO /Computer:YES /UserFiles:YES /RecycleBin:YES /RenameComputer2:YES'"
choco install explorer-winconfig --yes --force --params "'/SHOWCHECKBOXES:no /SHOWDETAILSPANE:no /SHOWDRIVESNOMEDIA:yes /SHOWENCRYPTED:yes /SHOWEXTENSIONS:yes /SHOWFULLPATH:yes /SHOWHIDDEN:all /SHOWPREVIEWPANE:no /USESHARINGWIZARD:no /USEVIEW:details'"
choco install taskbar-winconfig --yes --force --params "'/AUTOTRAY:no /COMBINED:yes /CORTANA:no /INK:no /LOCATION:bottom /LOCKED:yes /PEOPLE:no /SIZE:big /STORE:no /TASKVIEW:yes /KEYBOARD:no /USEPOWERSHELL:yes'""
choco install homepages-winconfig --yes --force --params "'/ALL:YES /URL:about:blank'"

choco uninstall desktopicons-winconfig --yes --force
choco uninstall explorer-winconfig --yes --force
choco uninstall taskbar-winconfig --yes --force
choco uninstall homepages-winconfig --yes --force
