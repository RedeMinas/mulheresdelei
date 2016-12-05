<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="mulheresdelei" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

  <head>
    <regionBase>
      <region id="rVideo" width="100%" height="100%" left="0%" top="0%" zIndex="1" />
      <region id="rMain" width="100%" height="100%" left="0%" top="0%" zIndex="2" />
      <region id="rIcon" width="8%" height="8%" left="80%" top="80%" zIndex="3" />
      <region id="rExit" width="3%" height="3%" left="90%" top="50%" zIndex="3" />

    </regionBase>

    <descriptorBase>
      <descriptor id="dVideo" region="rVideo" />
      <descriptor id="dMain" region="rMain" focusBorderWidth="0"/>
      <descriptor id="dIcon" region="rIcon" />
      <descriptor id="dExit" region="rExit" />
    </descriptorBase>

  <connectorBase>
    <importBase documentURI="connector.ncl" alias="conBase"/>
  </connectorBase>
    
  </head>

  <body>
    <port id="pStart" component="mVideo"/>

    <media id="foco" type="application/x-ginga-settings" descriptor="dMain">
      <property name="service.currentKeyMaster" value="mMain"/>
    </media>

    <media id="mMain" src="main.lua" descriptor="dMain"/>
    <media id="mIcon" src="media/icon.png" descriptor="dIcon"/>
    <media id="mExit" src="media/sair.png" descriptor="dExit"/>
    <media id="mVideo" src="sbtvd-ts://video" descriptor="dVideo" >
      <!-- sbtvd-ts://video -->
      <area id="icon" begin="1s"/>
    </media> 

    <link id="lVideoIcon"  xconnector="conBase#onBeginStart">
      <bind role="onBegin" component="mVideo"  interface="icon"/>
      <bind role="start"   component="mIcon" />
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

  </body>
</ncl>
