<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="conBase" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
  <head>
    <connectorBase>
      <causalConnector id="onBeginStart">
        <simpleCondition role="onBegin"/>
        <simpleAction role="start" max="unbounded" qualifier="par"/>
      </causalConnector>


      <causalConnector id="onSelectionStartStop">
        <connectorParam name="keyCode"/>
        <simpleCondition role="onSelection" key="$keyCode"/>
        <compoundAction operator="par">
          <simpleAction role="start" max="unbounded" qualifier="par"/>
          <simpleAction role="stop" max="unbounded" qualifier="par"/>
        </compoundAction>
      </causalConnector>
    </connectorBase>
  </head>
</ncl>
