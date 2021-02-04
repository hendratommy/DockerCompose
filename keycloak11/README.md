# Keycloak

We're using custom keycloak to customize the welcome page (disable/remove it) which require to modify `standalone-ha.xml`.
Refer to below documentations for more information.

[https://developer.jboss.org/thread/242941]
[https://stackoverflow.com/questions/57474253/how-to-edit-standalone-xml-file-dynamically-in-keycloak]

## Build

```bash
docker build -t identity-manager:1.0.0
```

## Issues

- KeyCloak cannot start with error `User with username 'admin' already added to '/opt/jboss/keycloak/standalone/configuration/keycloak-add-user.json'`
(https://stackoverflow.com/questions/59599620/keycloak-8-user-with-username-admin-already-added)
