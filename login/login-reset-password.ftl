<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
    <#if section = "header">
        ${msg("doForgotPassword")}
    <#elseif section = "header-content">
        <div class="info">${msg("emailInstruction")}</div>
    <#elseif section = "form">
        <form class="form" action="${url.loginAction}" method="post">
            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/email.svg" /></div>
                <#if !realm.loginWithEmailAllowed>
                    <input type="text" name="username" placeholder="${msg("username")}" autofocus/>
                <#elseif !realm.registrationEmailAsUsername>
                    <input type="text" name="username" placeholder="${msg("usernameOrEmail")}" autofocus/>
                <#else>
                    <input type="text" name="username" placeholder="${msg("email")}" autofocus/>
                </#if>
            </div>
      
            <div class="form-submit">
                <input type="submit" value="${msg("doSubmit")}" />
            </div>
        </form>
    <#elseif section = "footer">
        <div class="footer">
            <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
        </div>
    </#if>
</@layout.registrationLayout>
