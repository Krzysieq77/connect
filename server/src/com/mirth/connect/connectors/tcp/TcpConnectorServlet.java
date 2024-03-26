/*
 * Copyright (c) Mirth Corporation. All rights reserved.
 * 
 * http://www.mirthcorp.com
 * 
 * The software in this package is published under the terms of the MPL license a copy of which has
 * been included with this distribution in the LICENSE.txt file.
 */

package com.mirth.connect.connectors.tcp;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.SecurityContext;

import org.apache.commons.lang3.math.NumberUtils;

import com.mirth.connect.client.core.api.MirthApiException;
import com.mirth.connect.connectors.core.tcp.ITcpDispatcherProperties;
import com.mirth.connect.connectors.core.tcp.TcpConnectorServletInterface;
import com.mirth.connect.donkey.model.channel.ConnectorProperties;
import com.mirth.connect.server.api.MirthServlet;
import com.mirth.connect.server.util.ConnectorUtil;
import com.mirth.connect.server.util.TemplateValueReplacer;
import com.mirth.connect.util.ConnectionTestResponse;

public class TcpConnectorServlet extends MirthServlet implements TcpConnectorServletInterface {

    protected static final TemplateValueReplacer replacer = new TemplateValueReplacer();

    public TcpConnectorServlet(@Context HttpServletRequest request, @Context SecurityContext sc) {
        super(request, sc, PLUGIN_POINT);
    }

    @Override
    public ConnectionTestResponse testConnection(String channelId, String channelName, ConnectorProperties properties) {
        try {
            String host = replacer.replaceValues(((ITcpDispatcherProperties) properties).getRemoteAddress(), channelId, channelName);
            int port = NumberUtils.toInt(replacer.replaceValues(((ITcpDispatcherProperties) properties).getRemotePort(), channelId, channelName));
            int timeout = NumberUtils.toInt(replacer.replaceValues(((ITcpDispatcherProperties) properties).getResponseTimeout(), channelId, channelName));

            if (!((ITcpDispatcherProperties) properties).isOverrideLocalBinding()) {
                return ConnectorUtil.testConnection(host, port, timeout);
            } else {
                String localAddr = replacer.replaceValues(((ITcpDispatcherProperties) properties).getLocalAddress(), channelId, channelName);
                int localPort = NumberUtils.toInt(replacer.replaceValues(((ITcpDispatcherProperties) properties).getLocalPort(), channelId, channelName));
                return ConnectorUtil.testConnection(host, port, timeout, localAddr, localPort);
            }
        } catch (Exception e) {
            throw new MirthApiException(e);
        }
    }
}