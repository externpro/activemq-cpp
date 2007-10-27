/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <activemq/connector/openwire/marshal/v1/ConnectionControlMarshaller.h>

#include <activemq/connector/openwire/commands/ConnectionControl.h>

//
//     NOTE!: This file is autogenerated - do not modify!
//            if you need to make a change, please see the Java Classes in the
//            activemq-core module
//

using namespace std;
using namespace activemq;
using namespace activemq::io;
using namespace activemq::connector;
using namespace activemq::connector::openwire;
using namespace activemq::connector::openwire::commands;
using namespace activemq::connector::openwire::marshal;
using namespace activemq::connector::openwire::utils;
using namespace activemq::connector::openwire::marshal::v1;

///////////////////////////////////////////////////////////////////////////////
DataStructure* ConnectionControlMarshaller::createObject() const {
    return new ConnectionControl();
}

///////////////////////////////////////////////////////////////////////////////
unsigned char ConnectionControlMarshaller::getDataStructureType() const {
    return ConnectionControl::ID_CONNECTIONCONTROL;
}

///////////////////////////////////////////////////////////////////////////////
void ConnectionControlMarshaller::tightUnmarshal( OpenWireFormat* wireFormat, DataStructure* dataStructure, DataInputStream* dataIn, BooleanStream* bs ) throw( io::IOException ) {

    try {

        BaseCommandMarshaller::tightUnmarshal( wireFormat, dataStructure, dataIn, bs );

        ConnectionControl* info =
            dynamic_cast<ConnectionControl*>( dataStructure );
        info->setClose( bs->readBoolean() );
        info->setExit( bs->readBoolean() );
        info->setFaultTolerant( bs->readBoolean() );
        info->setResume( bs->readBoolean() );
        info->setSuspend( bs->readBoolean() );
    }
    AMQ_CATCH_RETHROW( io::IOException )
    AMQ_CATCH_EXCEPTION_CONVERT( exceptions::ActiveMQException, io::IOException )
    AMQ_CATCHALL_THROW( io::IOException )
}

///////////////////////////////////////////////////////////////////////////////
int ConnectionControlMarshaller::tightMarshal1( OpenWireFormat* wireFormat, DataStructure* dataStructure, BooleanStream* bs ) throw( io::IOException ) {

    try {

        ConnectionControl* info =
            dynamic_cast<ConnectionControl*>( dataStructure );

        int rc = BaseCommandMarshaller::tightMarshal1( wireFormat, dataStructure, bs );
        bs->writeBoolean( info->isClose() );
        bs->writeBoolean( info->isExit() );
        bs->writeBoolean( info->isFaultTolerant() );
        bs->writeBoolean( info->isResume() );
        bs->writeBoolean( info->isSuspend() );

        return rc + 0;
    }
    AMQ_CATCH_RETHROW( io::IOException )
    AMQ_CATCH_EXCEPTION_CONVERT( exceptions::ActiveMQException, io::IOException )
    AMQ_CATCHALL_THROW( io::IOException )
}

///////////////////////////////////////////////////////////////////////////////
void ConnectionControlMarshaller::tightMarshal2( OpenWireFormat* wireFormat, DataStructure* dataStructure, DataOutputStream* dataOut, BooleanStream* bs ) throw( io::IOException ) {

    try {

        BaseCommandMarshaller::tightMarshal2( wireFormat, dataStructure, dataOut, bs );

        bs->readBoolean();
        bs->readBoolean();
        bs->readBoolean();
        bs->readBoolean();
        bs->readBoolean();
    }
    AMQ_CATCH_RETHROW( io::IOException )
    AMQ_CATCH_EXCEPTION_CONVERT( exceptions::ActiveMQException, io::IOException )
    AMQ_CATCHALL_THROW( io::IOException )
}

///////////////////////////////////////////////////////////////////////////////
void ConnectionControlMarshaller::looseUnmarshal( OpenWireFormat* wireFormat, DataStructure* dataStructure, DataInputStream* dataIn ) throw( io::IOException ) {

    try {

        BaseCommandMarshaller::looseUnmarshal( wireFormat, dataStructure, dataIn );
        ConnectionControl* info =
            dynamic_cast<ConnectionControl*>( dataStructure );
        info->setClose( dataIn->readBoolean() );
        info->setExit( dataIn->readBoolean() );
        info->setFaultTolerant( dataIn->readBoolean() );
        info->setResume( dataIn->readBoolean() );
        info->setSuspend( dataIn->readBoolean() );
    }
    AMQ_CATCH_RETHROW( io::IOException )
    AMQ_CATCH_EXCEPTION_CONVERT( exceptions::ActiveMQException, io::IOException )
    AMQ_CATCHALL_THROW( io::IOException )
}

///////////////////////////////////////////////////////////////////////////////
void ConnectionControlMarshaller::looseMarshal( OpenWireFormat* wireFormat, DataStructure* dataStructure, DataOutputStream* dataOut ) throw( io::IOException ) {

    try {

        ConnectionControl* info =
            dynamic_cast<ConnectionControl*>( dataStructure );
         BaseCommandMarshaller::looseMarshal( wireFormat, dataStructure, dataOut );

        dataOut->writeBoolean( info->isClose() );
        dataOut->writeBoolean( info->isExit() );
        dataOut->writeBoolean( info->isFaultTolerant() );
        dataOut->writeBoolean( info->isResume() );
        dataOut->writeBoolean( info->isSuspend() );
    }
    AMQ_CATCH_RETHROW( io::IOException )
    AMQ_CATCH_EXCEPTION_CONVERT( exceptions::ActiveMQException, io::IOException )
    AMQ_CATCHALL_THROW( io::IOException )
}
