## Example executables
set(example_exes
  example
  simple_async_consumer
  simple_producer
  chat
  cmstemplate_sender
  cmstemplate_receiver
  advisory_producer
  advisory_consumer
  tempdest_advisory_consumer
  tempdest_advisory_producer
  cmstemplate_stress
  stress_test
  )
## Main Example
set(example_srcs
  main.cpp
  )
## Simple Async Consumer
set(simple_async_consumer_srcs
  consumers/SimpleAsyncConsumer.cpp
  )
## Simple Producer
set(simple_producer_srcs
  producers/SimpleProducer.cpp
  )
## Chat Sample
set(chat_srcs
  topics/chat/Chat.cpp
  )
## CMSTemplate Message send Sample
set(cmstemplate_sender_srcs
  cmstemplate/CMSTemplateSender.cpp
  )
## CMSTemplate Message receive Sample
set(cmstemplate_receiver_srcs
  cmstemplate/CMSTemplateReceiver.cpp
  )
## Advisory Producer Example
set(advisory_producer_srcs
  advisories/AdvisoryProducer.cpp
  advisories/AdvisoryProducerMain.cpp
  )
## Advisory Consumer Example
set(advisory_consumer_srcs
  advisories/AdvisoryConsumer.cpp
  advisories/AdvisoryConsumerMain.cpp
  )
## Temp Destination Advisory Consumer Example
set(tempdest_advisory_consumer_srcs
  advisories/TempDestinationAdvisoryConsumer.cpp
  advisories/TempDestinationAdvisoryConsumerMain.cpp
  )
## Temp Destination Advisory Producer Example
set(tempdest_advisory_producer_srcs
  advisories/TempDestinationAdvisoryProducerMain.cpp
  )
## CMS Template Stress Test Example
set(cmstemplate_stress_srcs
  cmstemplate-stress/TestSenderAndReceiver.cpp
  cmstemplate-stress/Sender.cpp
  cmstemplate-stress/Receiver.cpp
  cmstemplate-stress/MessagingTask.cpp
  cmstemplate-stress/ConnectionFactoryMgr.cpp
  cmstemplate-stress/CMSTestMultipleSendersReceivers.cpp
  cmstemplate-stress/CmsMessageCreator.cpp
  )
## Stress Test Example
set(stress_test_srcs
  stress-test/TestSenderAndReceiver.cpp
  stress-test/Sender.cpp
  stress-test/Receiver.cpp
  stress-test/MessagingTask.cpp
  stress-test/ConnectionFactoryMgr.cpp
  stress-test/CmsStress.cpp
  stress-test/BrokerMonitor.cpp
  stress-test/CmsMessageCreator.cpp
  )
foreach(exe ${example_exes})
  add_executable(${exe} ${${exe}_srcs})
  target_link_libraries(${exe} activemqcpp)
endforeach()
