/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequestMarshaller.h"

@implementation ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequest *)applySecurityGroupsToLoadBalancerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"ApplySecurityGroupsToLoadBalancer"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[applySecurityGroupsToLoadBalancerRequest delegate]];
    [request setCredentials:[applySecurityGroupsToLoadBalancerRequest credentials]];
    [request setEndpoint:[applySecurityGroupsToLoadBalancerRequest requestEndpoint]];
    [request setRequestTag:[applySecurityGroupsToLoadBalancerRequest requestTag]];

    if (applySecurityGroupsToLoadBalancerRequest != nil) {
        if (applySecurityGroupsToLoadBalancerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", applySecurityGroupsToLoadBalancerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (applySecurityGroupsToLoadBalancerRequest != nil) {
        int securityGroupsListIndex = 1;
        for (NSString *securityGroupsListValue in applySecurityGroupsToLoadBalancerRequest.securityGroups) {
            if (securityGroupsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", securityGroupsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"SecurityGroups", securityGroupsListIndex]];
            }

            securityGroupsListIndex++;
        }
    }


    return [request autorelease];
}

@end

