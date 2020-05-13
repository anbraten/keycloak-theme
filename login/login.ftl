<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "head">
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/icons/eye.svg";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/icons/eye-off.svg";
                }
            }
        </script>
    <#elseif section = "header">
        ${client.name}
    <#elseif section = "header-content">
        <#if client.description?has_content>
            <div class="branding-description">${client.description}</div>
        </#if>
        <img class="branding-logo" src="${url.resourcesPath}/img/logos/${client.clientId}.png" alt="Logo">
    <#elseif section = "form">
        <#if realm.password>
            <form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="form-input">
                    <div class="icon"><img src="${url.resourcesPath}/img/icons/user.svg" /></div>
                    <#if !realm.loginWithEmailAllowed>
                        <input type="text" placeholder="${msg("username")}" name="username" tabindex="1" autofocus autocomplete="off" required>
                    <#elseif !realm.registrationEmailAsUsername>
                        <input type="text" placeholder="${msg("usernameOrEmail")}" name="username" tabindex="1" autofocus autocomplete="off" required>
                    <#else>
                        <input type="text" placeholder="${msg("email")}" name="username" tabindex="1" autofocus autocomplete="off" required>
                    </#if>
                </div>

                <div class="form-input">
                    <div class="icon"><img src="${url.resourcesPath}/img/icons/lock.svg" /></div>
                    <input id="password" type="password" name="password" placeholder="${msg("password")}" tabindex="2" required>
                    <div class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/icons/eye-off.svg" /></div>
                </div>

                <#if realm.resetPasswordAllowed>
                    <div class="reset-password">
                        <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                    </div>
                </#if>
                <div class="form-submit">
                    <input type="submit" value="${msg("doLogIn")}" tabindex="3">
                </div>
            </form>
        </#if>
        <#if social.providers??>
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
    <#elseif section = "footer" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <span class="registration">${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
        </#if>
    </#if>
</@layout.registrationLayout>
