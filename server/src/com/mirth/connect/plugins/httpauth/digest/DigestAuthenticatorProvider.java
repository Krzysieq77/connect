/*
 * Copyright (c) Mirth Corporation. All rights reserved.
 * 
 * http://www.mirthcorp.com
 * 
 * The software in this package is published under the terms of the MPL license a copy of which has
 * been included with this distribution in the LICENSE.txt file.
 */

package com.mirth.connect.plugins.httpauth.digest;

import com.mirth.connect.donkey.server.channel.Connector;
import com.mirth.connect.plugins.core.httpauth.Authenticator;
import com.mirth.connect.plugins.core.httpauth.AuthenticatorProvider;
import com.mirth.connect.plugins.httpauth.HttpAuthConnectorPluginProperties;

public class DigestAuthenticatorProvider extends AuthenticatorProvider {

    public DigestAuthenticatorProvider(Connector connector, HttpAuthConnectorPluginProperties properties) {
        super(connector, properties);
    }

    @Override
    public Authenticator getAuthenticator() throws Exception {
        return new DigestAuthenticator(this);
    }
}