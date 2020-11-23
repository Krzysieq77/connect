/*
 * Copyright (c) Mirth Corporation. All rights reserved.
 * 
 * http://www.mirthcorp.com
 * 
 * The software in this package is published under the terms of the MPL license a copy of which has
 * been included with this distribution in the LICENSE.txt file.
 */

package com.mirth.connect.model.datatype;

import com.mirth.connect.donkey.model.message.SerializationType;
import com.mirth.connect.donkey.util.DonkeyElement;

public abstract class SerializationProperties extends DataTypePropertiesGroup {

    /**
     * If this returns null, the data type default serialization type will be used.
     */
    public SerializationType getSerializationType() {
        return null;
    }

    public void setSerializationType(SerializationType serializationType) {}
    
    // @formatter:off
    @Override public void migrate3_2_0(DonkeyElement element) {}
    @Override public void migrate3_3_0(DonkeyElement element) {}
    @Override public void migrate3_4_0(DonkeyElement element) {}
    @Override public void migrate3_5_0(DonkeyElement element) {}
    @Override public void migrate3_6_0(DonkeyElement element) {}
    @Override public void migrate3_7_0(DonkeyElement element) {}
    @Override public void migrate3_9_0(DonkeyElement element) {} 
    @Override public void migrate3_11_0(DonkeyElement element) {} // @formatter:on
}
