<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="mulheresdelei" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

  <head>

    <regionBase>
      <region id="rVideo" width="100%" height="100%" left="0%" top="0%" zIndex="1" />
      <region id="rMain" width="100%" height="100%" left="0%" top="0%" zIndex="2" />
      <region id="rIcon" width="5.2083%" height="9.2593%" left="90%" top="85%" zIndex="3" />
      <region id="rExit" width="8%" height="12%" left="85%" top="60%" zIndex="3" />
    </regionBase>

    <descriptorBase>
      <descriptor id="dVideo" region="rVideo" />
      <descriptor id="dMain" region="rMain" focusBorderWidth="0" focusIndex="luaIdx"/>
      <descriptor id="dIcon" region="rIcon" />
      <descriptor id="dExit" region="rExit" />
    </descriptorBase>

    <connectorBase>
      <importBase documentURI="connector.ncl" alias="conBase"/>
    </connectorBase>
    
  </head>

  <body>

    <port id="pStart" component="mIcon"/>

    <media id="foco" type="application/x-ginga-settings" descriptor="dMain">
      <property name="service.currentKeyMaster" value="mMain"/>
    </media>

    <media id="mMain" src="main.lua" descriptor="dMain"/>
    <media id="mIcon" src="media/icon.png" descriptor="dIcon"/>
    <media id="mExit" src="media/remote.png" descriptor="dExit"/>

    <link id="lFoco"    xconnector="conBase#onBeginSet">
      <bind role="onBegin"        component="mMain"/>
      <bind role="set"            component="settings" interface="service.currentKeyMaster">
        <bindParam name="value" value="mMain"/>
      </bind>
    </link>

    <link id="lIcon" xconnector="conBase#onSelectionStartStop">
      <bind role="onSelection" component="mIcon">
        <bindParam name="keyCode" value="ENTER"/>
      </bind>
      <bind role="start" component="mMain"/>
      <bind role="start" component="mExit"/>
      <bind role="stop"  component="mIcon"/>
    </link>

    <link id="lExit"  xconnector="conBase#onSelectionStartStop">
      <bind role="onSelection" component="mExit">
        <bindParam name="keyCode" value="EXIT"/>
      </bind>
      <bind component="mIcon"       role="start"/>
      <bind component="mExit"        role="stop"/>
      <bind component="mMain"        role="stop"/>
    </link>

    <link id="lExit2"  xconnector="conBase#onSelectionStartStop">
      <bind role="onSelection" component="mExit">
        <bindParam name="keyCode" value="ENTER"/>
      </bind>
      <bind component="mIcon"       role="start"/>
      <bind component="mExit"        role="stop"/>
      <bind component="mMain"        role="stop"/>
    </link>

  </body>
</ncl>
