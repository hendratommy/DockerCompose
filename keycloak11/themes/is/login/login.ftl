<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <header class="pf-c-login__main-header">
            <h1 class="pf-c-title pf-m-3xl">Log in to your account</h1>
        </header>
    <#elseif section = "form">
        <form id="kc-form-login" class="pf-c-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <#if message?has_content>
                <p class="pf-c-form__helper-text pf-m-${message.type}">
                    <#if message.type = 'success'>
                        <span class="pf-c-form__helper-text-icon"><i class="fas fa-info-circle" aria-hidden="true"></i></span>
                    </#if>
                    <#if message.type = 'warning'>
                        <span class="pf-c-form__helper-text-icon"><i class="fas fa-exclamation-triangle" aria-hidden="true"></i></span>
                    </#if>
                    <#if message.type = 'error'>
                        <span class="pf-c-form__helper-text-icon"><i class="fas fa-exclamation-circle" aria-hidden="true"></i></span>
                    </#if>
                    <#if message.type = 'info'>
                        <span class="pf-c-form__helper-text-icon"><i class="fas fa-info-circle" aria-hidden="true"></i></span>
                    </#if>
                    ${kcSanitize(message.summary)?no_esc}
                </p>
            <#else>
                <p class="pf-c-form__helper-text pf-m-info">
                    <span class="pf-c-form__helper-text-icon">&nbsp;</span>
                </p>
            </#if>
            <#if realm.password>
                <div class="pf-c-form__group">
                    <label class="pf-c-form__label" for="username">
                        <span class="pf-c-form__label-text">Username</span>
                    </label>
                    <input id="username" name="username" type="text" class="pf-c-form-control" value="${(login.username!'')}"/>
                </div>
                <div class="pf-c-form__group">
                    <label class="pf-c-form__label" for="password">
                        <span class="pf-c-form__label-text">Password</span>
                    </label>
                    <input id="password" name="password" type="password" class="pf-c-form-control" autocomplete="off"/>
                </div>
                <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="pf-c-form__group">
                        <div class="pf-c-check">
                            <#if login.rememberMe??>
                                <input id="rememberMe" name="rememberMe" class="pf-c-check__input" type="checkbox" checked/>
                            <#else>
                                <input id="rememberMe" name="rememberMe" class="pf-c-check__input" type="checkbox"/>
                            </#if>
                            <label class="pf-c-check__label" for="rememberMe">${msg("rememberMe")}</label>
                        </div>
                    </div>
                </#if>

                <div class="pf-c-form__group pf-m-action">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button class="pf-c-button pf-m-primary pf-m-block" type="submit">
                        ${msg("doLogIn")}
                    </button>
                </div>
            </#if>
        </form>
    <#elseif section = "footer">
        <footer class="pf-c-login__main-footer">
            <div class="pf-c-login__main-footer-band">
                <p class="pf-c-login__main-footer-band-item">
                    <a href="${url.loginResetCredentialsUrl}">${kcSanitize(msg("doForgotPassword"))?no_esc}</a>
                </p>
            </div>
        </footer>
    </#if>
</@layout.registrationLayout>