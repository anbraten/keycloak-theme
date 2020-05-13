<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <meta name="robots" content="noindex, nofollow">
        <link href="https://fonts.googleapis.com/css?family=Raleway:wght@400;700" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>

        <title>${msg("loginTitle",(client.name!''))}</title>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#nested "head">
    </head>

    <body>
        <div class="content">
            <div class="box">
                <div class="head">
                    <div class="title"><#nested "header"></div>
                    <#nested "header-content">
                </div>
                <#if displayMessage && message?has_content>
                <div class="alert alert-${message.type}">
                    <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                    <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <span class="message-text">${message.summary?no_esc}</span>
                </div>
                </#if>
                <div class="form">
                    <#nested "form">
                </div>
                <div class="footer">
                    <#nested "footer">
                </div>
            </div>
        </div>
    </body>
</html>
</#macro>
