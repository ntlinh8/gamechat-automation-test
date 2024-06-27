*** Settings ***
Library    SeleniumLibrary
Resource    webcontrol.robot
Resource    ../resources/CommonKeyword.robot
Resource    ../resources/CommonLocator.robot
Resource    ../resources/AdminLocator.robot
Resource    ../resources/ChatPanelLocator.robot
Resource    ../resources/ChatroomLocator.robot
Library  OperatingSystem

*** Variables ***
${env}    LIVE
${pc}    PC1
${AUTHEN_USER}    staff
${AUTHEN_PW}    Zuff3qaMvlZlGtZT6

${URL}    https://${AUTHEN_USER}:${AUTHEN_PW}@${DOMAIN}/
${BASE_URL}    https://${DOMAIN}/

${DOMAIN}    ${DOMAIN_${env}}
${DOMAIN_DEV}   ddx-chat-dev.torn.com
${DOMAIN_LIVE}   torn.com
${DOMAIN_DOP}   dopp2-dev.torn.com
${DOMAIN_HEIN}   heinddx-dev.torn.com

${ChromeID}    ${EMPTY}
${FirefoxID}    ${EMPTY}

# Make sure name is correct in Json file, init file and keywords
${Account_Chrome}
${Account_ChromeHospital}
${Account_ChromeTravel}
${Account_Firefox}
${Account_FirefoxNewPlayer}
${Account_FirefoxStaff}
${Account_FirefoxTravel}


