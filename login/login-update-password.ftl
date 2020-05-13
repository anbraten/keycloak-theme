<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "head">
        <script>
            function togglePassword() {
                var x = document.getElementById("password-new");
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
        <div class="title">${msg("updatePasswordTitle")}</div>
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/lock.svg" /></div>
                <input id="password-new" type="password" name="password"  placeholder="${msg("password")}" autocomplete="new-password">
                <div class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/icons/eye-off.svg" /></div>
            </div>

            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/lock.svg" /></div>
                <input type="password" name="password-confirm"  placeholder="${msg("passwordConfirm")}">
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
