<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <header class="pf-c-login__main-header">
            <div>
                <h1 class="pf-c-title pf-m-xl">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</h1>
                <h1 class="pf-c-title pf-m-3xl">Log in to your account</h1>
            </div>
        </header>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="pf-c-form" action="${url.loginAction}" method="post">
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
            <div class="pf-c-form__group">
                <label class="pf-c-form__label" for="username">
                    <span class="pf-c-form__label-text">Username</span>
                </label>
                <#if auth?has_content && auth.showUsername()>
                    <input type="text" id="username" name="username" class="pf-c-form-control" autofocus value="${auth.attemptedUsername}"/>
                <#else>
                    <input type="text" id="username" name="username" class="pf-c-form-control" autofocus/>
                </#if>
            </div>
            
           <div class="pf-c-form__group pf-m-action">
                <button class="pf-c-button pf-m-primary pf-m-block" type="submit">
                    ${msg("doReset")}
                </button>
            </div>
        </form>
    <#elseif section = "info">
        ${msg("emailInstruction")}
    <#elseif section = "footer">
        <footer class="pf-c-login__main-footer">
            <div class="pf-c-login__main-footer-band">
                <p class="pf-c-login__main-footer-band-item">
                    <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </p>
            </div>
        </footer>
    </#if>
</@layout.registrationLayout>
