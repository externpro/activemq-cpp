/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _ACTIVEMQ_CONNECTOR_OPENWIRE_COMMANDS_ACTIVEMQMESSAGEBASE_H_
#define _ACTIVEMQ_CONNECTOR_OPENWIRE_COMMANDS_ACTIVEMQMESSAGEBASE_H_

#include <activemq/connector/openwire/commands/Message.h>
#include <activemq/core/ActiveMQMessage.h>
#include <activemq/connector/openwire/marshal/BaseDataStreamMarshaller.h>
#include <activemq/core/ActiveMQAckHandler.h>
#include <activemq/util/Date.h>
#include <activemq/util/PrimitiveMap.h>

namespace activenq{
namespace connector{
namespace openwire{
namespace commands{
    
    template< typename T>
    class ActiveMQMessageBase : public T,
                                public Message, 
                                public core::ActiveMQMessage {
    
    public:
    
        ActiveMQMessageBase() {}
        virtual ~ActiveMQMessageBase() {}
        
    };

}}}}

#endif /*_ACTIVEMQ_CONNECTOR_OPENWIRE_COMMANDS_ACTIVEMQMESSAGEBASE_H_*/
