// Generated by gencpp from file vrep_common/simRosCopyPasteObjects.msg
// DO NOT EDIT!


#ifndef VREP_COMMON_MESSAGE_SIMROSCOPYPASTEOBJECTS_H
#define VREP_COMMON_MESSAGE_SIMROSCOPYPASTEOBJECTS_H

#include <ros/service_traits.h>


#include <vrep_common/simRosCopyPasteObjectsRequest.h>
#include <vrep_common/simRosCopyPasteObjectsResponse.h>


namespace vrep_common
{

struct simRosCopyPasteObjects
{

typedef simRosCopyPasteObjectsRequest Request;
typedef simRosCopyPasteObjectsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct simRosCopyPasteObjects
} // namespace vrep_common


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::vrep_common::simRosCopyPasteObjects > {
  static const char* value()
  {
    return "6c736eb743dc1dca49bfc35e3f009776";
  }

  static const char* value(const ::vrep_common::simRosCopyPasteObjects&) { return value(); }
};

template<>
struct DataType< ::vrep_common::simRosCopyPasteObjects > {
  static const char* value()
  {
    return "vrep_common/simRosCopyPasteObjects";
  }

  static const char* value(const ::vrep_common::simRosCopyPasteObjects&) { return value(); }
};


// service_traits::MD5Sum< ::vrep_common::simRosCopyPasteObjectsRequest> should match 
// service_traits::MD5Sum< ::vrep_common::simRosCopyPasteObjects > 
template<>
struct MD5Sum< ::vrep_common::simRosCopyPasteObjectsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::vrep_common::simRosCopyPasteObjects >::value();
  }
  static const char* value(const ::vrep_common::simRosCopyPasteObjectsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::vrep_common::simRosCopyPasteObjectsRequest> should match 
// service_traits::DataType< ::vrep_common::simRosCopyPasteObjects > 
template<>
struct DataType< ::vrep_common::simRosCopyPasteObjectsRequest>
{
  static const char* value()
  {
    return DataType< ::vrep_common::simRosCopyPasteObjects >::value();
  }
  static const char* value(const ::vrep_common::simRosCopyPasteObjectsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::vrep_common::simRosCopyPasteObjectsResponse> should match 
// service_traits::MD5Sum< ::vrep_common::simRosCopyPasteObjects > 
template<>
struct MD5Sum< ::vrep_common::simRosCopyPasteObjectsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::vrep_common::simRosCopyPasteObjects >::value();
  }
  static const char* value(const ::vrep_common::simRosCopyPasteObjectsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::vrep_common::simRosCopyPasteObjectsResponse> should match 
// service_traits::DataType< ::vrep_common::simRosCopyPasteObjects > 
template<>
struct DataType< ::vrep_common::simRosCopyPasteObjectsResponse>
{
  static const char* value()
  {
    return DataType< ::vrep_common::simRosCopyPasteObjects >::value();
  }
  static const char* value(const ::vrep_common::simRosCopyPasteObjectsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // VREP_COMMON_MESSAGE_SIMROSCOPYPASTEOBJECTS_H
