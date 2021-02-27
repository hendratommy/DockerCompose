Themes are used to configure the look and feel of login pages and the account management console. It is not recommended to
modify the existing built-in themes, instead you should create a new theme that extends a built-in theme. See the theme
section in the documentation for more details.

# Build
```bash
docker build -t keycloak-dev:12.0.3 .
```

# Run
```bash
docker run --rm --name keycloak-dev -p 9080:8080 -e KEYCLOAK_USER=kcadmin -e KEYCLOAK_PASSWORD=P@ssw0rd -v ${PWD}/is:/opt/jboss/keycloak/themes/is keycloak-dev:12.0.3
```