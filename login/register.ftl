<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
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
        ${msg("registerWithTitle",(client.name!''))}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/user.svg" /></div>
                <input type="text" name="firstName" placeholder="${msg("firstName")}" value="${(register.formData.firstName!'')}">
            </div>

            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/user.svg" /></div>
                <input type="text" name="lastName" placeholder="${msg("lastName")}" value="${(register.formData.lastName!'')}">
            </div>

            <div class="form-input">
                <div class="icon"><img src="${url.resourcesPath}/img/icons/email.svg" /></div>
                <input type="text" name="email" placeholder="${msg("email")}" value="${(register.formData.email!'')}">
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="form-input">
                    <div class="icon"><img src="${url.resourcesPath}/img/icons/lock.svg" /></div>
                    <input id="password" type="password" name="password"  placeholder="${msg("password")}" autocomplete="new-password">
                    <div class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/icons/eye-off.svg" /></div>
                </div>

                <div class="form-input">
                    <div class="icon"><img src="${url.resourcesPath}/img/icons/lock.svg" /></div>
                    <input type="password" name="password-confirm"  placeholder="${msg("passwordConfirm")}">
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            <div class="form-submit">
                <input type="submit" value="${msg("doRegister")}">
            </div>
        </form>
    <#elseif section = "footer">
        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
    </#if>
</@layout.registrationLayout>
