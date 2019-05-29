# hello-it-compliance
Compliance Checks for [Hello-IT](https://github.com/ygini/Hello-IT)

To utilize, add the scripts to `/Library/Application Support/com.github.ygini.hello-it/CustomScripts/` and add the following dict to `/Library/Preferences/com.github.ygini.hello-it.plist` (or whatever configuration file you have made)

```xml
        <dict>
            <key>functionIdentifier</key>
            <string>public.submenu</string>
            <key>settings</key>
            <dict>
                <key>content</key>
                <array>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                        <dict>
                            <key>script</key>
                            <string>gatekeeper_check.sh</string>
                            <key>title</key>
                            <string>gatekeeper_check</string>
                        </dict>
                    </dict>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                            <dict>
                                <key>script</key>
                                <string>updates_info.sh</string>
                                <key>title</key>
                                <string>UpdateInfo</string>
                            </dict>
                    </dict>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                        <dict>
                            <key>script</key>
                            <string>filevault.sh</string>
                            <key>title</key>
                            <string>filevault_check</string>
                        </dict>
                    </dict>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                        <dict>
                            <key>script</key>
                            <string>sip_check.sh</string>
                            <key>title</key>
                            <string>sip_check</string>
                        </dict>
                    </dict>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                        <dict>
                            <key>script</key>
                            <string>polp_check.sh</string>
                            <key>title</key>
                            <string>polp_check</string>
                        </dict>
                    </dict>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                        <dict>
                            <key>script</key>
                            <string>firewall_check.sh</string>
                            <key>title</key>
                            <string>firewall_check</string>
                        </dict>
                    </dict>
                    <dict>
                        <key>functionIdentifier</key>
                        <string>public.script.item</string>
                        <key>settings</key>
                        <dict>
                            <key>periodic-run</key>
                            <integer>3600</integer>
                            <key>script</key>
                            <string>detectx.sh</string>
                            <key>title</key>
                            <string>detectx</string>
                        </dict>
                    </dict>
                </array>
                <key>title</key>
                <string>Compliance</string>
            </dict>
        </dict>
```
