<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="form-input">
                    <div class="icon"><img src="${url.resourcesPath}/img/icons/user.svg" /></div>
                    <input type="text" name="username" value="${(user.username!'')}" />
                </div>
            </#if>
            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/email.svg" /></div>
                <input type="text" name="email" value="${(user.email!'')}" />
            </div>

            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/user.svg" /></div>
                <input type="text" name="firstName" placeholder="${msg("firstName")}" value="${(user.firstName!'')}">
            </div>

            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/user.svg" /></div>
                <input type="text" name="lastName" placeholder="${msg("firstName")}" value="${(user.lastName!'')}">
            </div>

            <div class="form-submit">
                <#if isAppInitiatedAction??>
                <input type="submit" value="${msg("doSubmit")}" />
                <button type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                <#else>
                <input type="submit" value="${msg("doSubmit")}" />
                </#if>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
