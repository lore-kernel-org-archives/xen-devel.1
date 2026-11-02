Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B22606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 02:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=hLRfr3Ks
Received: from list by lists.xenproject.org with outflank-mailman.1467590.1676683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhOB-00061d-HM; Mon, 02 Nov 2026 02:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467590.1676683; Mon, 02 Nov 2026 02:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNhOB-00061T-EQ; Mon, 02 Nov 2026 02:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1467590;
 Mon, 02 Nov 2026 02:03:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xNhO9-00060u-UA
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 02:03:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNhO9-001ZAQ-Aw
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:03:09 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef52-bab6-0a2a0a5309dd-0a2a450cb3ba-8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:03:09 +0100
Received: from [52.101.84.120]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ae7ef5c-f479-0a2a450c0019-34655478c6bd-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 03:03:09 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS8PR03MB9024.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:03:06 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:03:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm1jjxNXUdGMafCKuqaZ+ngWj74zvfI0fozIwxpU+RRuHYoQB3nhrEj06g8DfXhYRBiGeiaDGQwipdyrLxoXkbsFKE9afcSkTl+L6gvu3hCbvyMaN2Rq92S1dyD6CD9GetwQaascx7IlnPz6Yj6fTCm1eXVurp62FM6bDPYdrIllX6Zwe8Yf2g+zpV1ZbqLv7Fv0T318+3sRIcN0ZkdN1G/MoOOSG5s1crp3y0m8umXri1m9oaPpfFJlMY/ppGJWh5bHMr9MOzWl0QueqJKnwkuO17K+BHqOwnr2mc40mMNN1TZyBBuwR+UAkewq8kI2W3xzckR6V+2G8EoNmHE6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4D0qdgOmXU166wJ9d4zkpWSWIfuPJ3WK0j5lxAWrNA=;
 b=lt3reE86zi3koJIzX8fnVzj/u3WouehNxJ5xqHsP3/8Z2EriWauZtv2knx98oI3UwIgHxuqPvuXBRCotYDQFnvvrmQQwPkrTuVMzdBHBNnnZpD6Ny4q2JSFXFwIt5nx/UpyFXdjQEH28a1NoQdwr4nQEO2x9IBf0K5UzoskgMafNippkkz+VM5ZchpiwsQ0N+6J+7ExelpbpQS6GGu5WAfgMybwqBMRoG3SfMhHM7jAo7v4AjnmRzw7ZeO3xQ8MouPrWVgdsvlEEVyX7p1AH+y7+e/ur+YC4Smw8eqmQdvCSJv9DlVBBiuGq1UFUT+3cL2pYLJJ9WjKBbzLve+mBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4D0qdgOmXU166wJ9d4zkpWSWIfuPJ3WK0j5lxAWrNA=;
 b=hLRfr3KspZQRDPUoSCguxBOgpYGUDPeBIUulTADV+QgS6Fu2MivT9JhLHEoEG6ElruUlaR/+tbJ8OBq11shp2VqO6yeKvKCW6mL87kB557/UPBk5PKEX58AXm/iTad3kQcIkv4X+G+kVno3b5fPxv0BKfA74zECJ7X+qWNbu0RZ5lygqtLCDaz93cXpfHpOMDi7u1WwvfMu0FXRtVYBPyIv/j/sam9RC9uwKBkTAA862ebWj851BvNqGChR9YP6sQ7HA/lPcz0VbmPqeVj4uIhug/nTvTyu+jrgS/yT2jLMlW5TJ53Ne8b1SMbgyiwl2n8KXy6qh2eoI+8PWr54Z8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d19d743c-d85a-49cf-b8a5-1f2829d2c13c@epam.com>
Date: Mon, 2 Nov 2026 03:03:05 +0100
User-Agent: Mozilla Thunderbird
From: Milan Djokic <milan_djokic@epam.com>
Subject: Re: [PATCH v4 12/22] xen/arm: vsmmuv3: Add support for event queue
 and global error
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <1bf1f69e50fa7f6f90bfa6b2c7434c1ba3f65bbf.1791328190.git.milan_djokic@epam.com>
 <ce585f3f-e2f3-46ec-ad5e-50e1f29523ba@gmail.com>
Content-Language: en-US
In-Reply-To: <ce585f3f-e2f3-46ec-ad5e-50e1f29523ba@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::17) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|AS8PR03MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a82144-a482-47ee-2b1a-08df38856fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|5023799004|56012099006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bL5nUGLtA65a8h4iFT9HtcpYcs7xaP6veIwjFkQKOg2OBFpIMFyLrpSlUawDGVLqiIZuTVobap+p/9HQKOJ6p7gmII0FxxoiJ/xtLpbPUoBjRswnrtJJu13y1WKmVFv9DhaDl4Ovem6oJsDfZ3w8qMD4D71NBFKFgt5UWDcZjIKJSBqKkyRzkkRoEyljE/hATj5qmIdnVq434SGB9bFgHf+ODul/pqsH7Uugbh5hOwjUodDNhHDDa/IOyaBz/UoPOmFfSvcr9vwUOn2M4y3G6/VHmIWmcnobjjweeGEUyLh5tRAkaTNwmKWjyBlXDn0zgiF0FaIf6N7tVo2VM84MKaHQW2wbqH5r67F5mEjy/wzWOoT1qUQI9P9QUAKhqzEvn3veYfAan2z/x5DARhDXisngNrMAkDig096rnH1f4SR3We8EvXp9YxeVrloRm9xr3xLfUcHYbiTE6MskLRSH2smrqymQJA+jgZyk0eRvUu8YXyithTEIBNezZ6R4nwioRMucCd4DwZhLQgYMOJ7oQnihnOXDIphf4f1pd138QG+m/8kZbDPb6Uz0UuqeBWeJQuJ7Ve22hnzlKQp6Lv+hxmzhNY3kkS05uWY7oGMYvjmst+7Wji43ZhXOjeY6Zt7RYxeq3mXtZorJwH1N3sw6m6HpfKaN/rWU0zBFFihIc7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjhkU1VUZHppeUs0c1pubklUUmoxZHZPbEZzYmltcXNFWHNvTWdqVHNrMVZD?=
 =?utf-8?B?cForSk1sZmxUaS9TaFFUNUtheTVyRkpVcXd2MzV0d0FZbHBRMWFkSERma3NL?=
 =?utf-8?B?TXUxUEZXbS91YWY0amxScHZNV3NvSFJ2ZHlXSmdwQjZlYWEweXJmbERzVGlx?=
 =?utf-8?B?aDdFcE1mSHdyREFyUWM3L0kzZ1gxSWxTU01LQzByYzdlQWMyTW5wUTNJZkFM?=
 =?utf-8?B?ZnpRMXNwMG9EZk9za0kvYU9kVnkxV1ZrODBWeGpzQXJpUndnZTJnd09CUlVi?=
 =?utf-8?B?VDBFTUJhVDhMSDBBRDJGSzVJVGZaVUJRZkgzRCt6ZzBheHFNek5ybFg0dmpB?=
 =?utf-8?B?cG0vNnFsQmVRQ3gyTFNEUldCbTRDRGtkTWVaTXhIYWlIWnhySk9KUFN1d2l4?=
 =?utf-8?B?UlZRQmJSLzk2aW5XN0E0OWdVdEJyMUpUb0F4cksyS0UycnJNRWdienhHNEs5?=
 =?utf-8?B?TTdVTXlZMU9xeGcrejZzMFIyY3B3bS83Z2lXdnQ3T1lMTVo4WklDK1luMWFx?=
 =?utf-8?B?cFNqRnlET0Evd2hVeDc2WXFnUHFpNzZPMWpMRWR3ZzR2QnIzV0VaTzY0OVND?=
 =?utf-8?B?WnUrRHJMNUNTUktnUUhQeTdPcWdYb1JZc2hhOEVTQVp0ajFCNnBPNE5POVhi?=
 =?utf-8?B?Y3VtSE1oUDFkbmRlRlc2LzNpb1NkQ0lhVVpBd1I5VjZJQ2dWb01MNG9FYzVk?=
 =?utf-8?B?SVIyQUdXOFJ2L2VHeHZVdGdCY1BCS21US3J2MjhNK0dqclNxcUovQlZHMk84?=
 =?utf-8?B?N25YRktDREFEZ0UvcGloRTZyU2cvWjFxOVVMaWxaSXNHNjR4MUFBVTl4VmZ5?=
 =?utf-8?B?RGtycHVLZnpOeTIwTW9YK094bjNpdG5tbW0yb2phdkQ3MGkvUi9FQVFVZTFX?=
 =?utf-8?B?dWNvQjExdWdIdlRja1ZlNmZycXZDaDd2VzRCTU1ickxldi9yc2FKM0Vab1Vs?=
 =?utf-8?B?d3ZnSU1TUWtWTzN5NkFxbk5wL0xsNzNDcUpNeGtYOGFFRmlEeHc1My85U29N?=
 =?utf-8?B?UFhiQkljdDVSdnFvVFg0VEF2Z1I0YnFHZ2d5eWdhVGZ4UVBhM05KNFk4WCtx?=
 =?utf-8?B?Nmljd2FqTHBvZ2lEb2Qxa2JVakVMaUhDSnIySVNack9SNkpZU3pFL09CcEhT?=
 =?utf-8?B?dDFXOXZ2L1pWbVpraVk4alg1MGNOVEY5SWMyM2tQSGlrNFJ4V1F1eXc5Zlk3?=
 =?utf-8?B?M3dzZDI4SUk0ZllNT2k5NE9yM2MzbVNIZWtSTUc2Yzl1OEwzaERQMHVReEVN?=
 =?utf-8?B?QXFISklMMU94RFBiREFaaWNlOC9OUnp6VXVkeVZIM3c2a2laRkxwRmkwRURN?=
 =?utf-8?B?bFAzUis0OWw5ekRhMHV5WEttVEVGQ1NxSHJSYWhEQzZNMkZ3RlhSakxtR3J1?=
 =?utf-8?B?S09HZ1I5Z25DeGw1TUJ6a0FZT0JwZGNZVFBCbzQwYUZBTVA4eXZITFMxZmpY?=
 =?utf-8?B?M0NON05nR0ROZUp5c2VLbFJGNDk5aGIzUWJMTW8zbys4RGF3TkR1NHpoQTQ5?=
 =?utf-8?B?YVlmbCtKcFVXUGYzbFlia0pod3JiTkU4YUZSVHVZM241eW9oR1YzRU8zY0tO?=
 =?utf-8?B?aTlycVJqT2VJUGN2ejRuV2twamFjRnJNRDRtQ1IwRnR4cnFqbTZza0JVc2N6?=
 =?utf-8?B?NEJoSDltV1RKRXVWelVwUEVMbCtTWEl3NnRPeDk2ZnpYSWhnenhIMUNIdW0w?=
 =?utf-8?B?TUhYSzY2cGIxdEFhNWM1YkNkK3JxSWIrMTk3bTk5L24vQThpNjFBOStoOTN4?=
 =?utf-8?B?aXk3STNwaGdlOHVhVjVrNmE2OWhWMG8rYzduQVhZVVlhNHdXUXFSYkV4eFRY?=
 =?utf-8?B?TEFBdEtsUk9WOVc5bWZzeW5HclcycW4yQlE2RW9Haml1OUFMMkpLZXhEMXcx?=
 =?utf-8?B?OTZpMmhtQmRwb0FacmI2dENTcHZLelN0LytKWkZ5V2ZBUVRtLzRTODhHSmEr?=
 =?utf-8?B?dHJCeWI2bWZlWEtsTFBwaTYwTExpaDllWktuOWdpQXZZeWJBT3dZbnExOEtq?=
 =?utf-8?B?SUhRNEwzdlF5MzZDejZ1NlhTMEpJZ1RzTzF5RjJNbTJ6R3RRdWNxUUVwQUVz?=
 =?utf-8?B?dFdFVWJ2eTZGRFhORjlJQkF4elZSR2VBWkg2cmRwcmdhNjRHb21aSG45SER5?=
 =?utf-8?B?NExaN2tEcTd4WmszSlp0S21zRFVhVFNTTzFwWU9LdHQyZzU5c2o0S0hhR3RL?=
 =?utf-8?B?QVlrN3dtTVhDUVhPL3ptcndrTXVQYzZYTVlEZEF2Uk05YU44eTBkYlhRWnIr?=
 =?utf-8?B?NEVOU2l5RURhUHY2enZ6eWxWSUwzNU1yeUpkQnlqaWh0MU12NWJZOTVzTFVF?=
 =?utf-8?B?RFp6VSs2U3BBYTYyUkgzSVYrV1dhSXo4YWlmZTR3YU96Zm9pZHovdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a82144-a482-47ee-2b1a-08df38856fc1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:03:06.7790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfXiSham7bgBslSXYPGHIoIGRWYRUVnWYNyNIAER0cMNO7fIyiHpDmwrllAEtnFW0lUTGhaUpWitRg9OH71sVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9024
X-purgate-ID: tlsNG-d25034/1793584989-52132A5B-43ECDEEB/0/0
X-purgate-type: clean
X-purgate-size: 18383
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Oleksandr,

On 10/11/26 15:27, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:07, Milan Djokic wrote:
> 
> Hello Milan
> 
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> Event queue is used to send the events to guest when there is an events/
>> faults. Add support for event queue to send events to guest.
>>
>> Global error in SMMUv3 hw will be updated in smmu_gerror and
>> smmu_gerrorn register. Add support for global error registers to send
>> global error to guest.
>>
>> Add architectural error handling to the emulated command queue,
>> updating the global error register and stopping command consumption
>> on error.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/drivers/passthrough/arm/smmu-v3.h  |  20 +++
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 233 +++++++++++++++++++++++--
>>    xen/include/public/arch-arm.h          |   2 +
>>    3 files changed, 244 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
>> index 4a912be740..44ecb5d89c 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.h
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
>> @@ -358,6 +358,26 @@
>>    
>>    #define EVTQ_0_ID			GENMASK_ULL(7, 0)
>>    
>> +#define EVT_ID_BAD_STREAMID		0x02
>> +#define EVT_ID_BAD_STE		    	0x04
>> +#define EVT_ID_TRANSLATION_FAULT	0x10
>> +#define EVT_ID_ADDR_SIZE_FAULT		0x11
>> +#define EVT_ID_ACCESS_FAULT		0x12
>> +#define EVT_ID_PERMISSION_FAULT		0x13
>> +
>> +#define EVTQ_0_SSV			(1UL << 11)
>> +#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
>> +#define EVTQ_0_SID			GENMASK_ULL(63, 32)
>> +#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
>> +#define EVTQ_1_STALL			(1UL << 31)
>> +#define EVTQ_1_PnU			(1UL << 33)
>> +#define EVTQ_1_InD			(1UL << 34)
>> +#define EVTQ_1_RnW			(1UL << 35)
>> +#define EVTQ_1_S2			(1UL << 39)
>> +#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
>> +#define EVTQ_1_TT_READ			(1UL << 44)
>> +#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
>> +#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
>>    /* PRI queue */
>>    #define PRIQ_ENT_SZ_SHIFT		4
>>    #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> index 3f557d1c4d..87342fdf69 100644
>> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -85,6 +85,35 @@
>>    #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
>>                                        FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
>>    
>> +/* event queue entry */
>> +struct arm_smmu_evtq_ent {
>> +    /* Common fields */
>> +    uint8_t     opcode;
>> +    uint32_t    sid;
>> +
>> +    /* Event-specific fields */
>> +    union {
>> +        struct {
>> +            uint32_t ssid;
>> +            bool ssv;
>> +        } c_bad_ste_streamid;
>> +
>> +        struct {
>> +            bool stall;
>> +            uint16_t stag;
>> +            uint32_t ssid;
>> +            bool ssv;
>> +            bool s2;
>> +            uint64_t addr;
>> +            bool rnw;
>> +            bool pnu;
>> +            bool ind;
>> +            uint8_t class;
>> +            uint64_t addr2;
>> +        } f_translation;
>> +    };
>> +};
>> +
>>    /* stage-1 translation configuration */
>>    struct arm_vsmmu_s1_trans_cfg {
>>        paddr_t s1ctxptr;
>> @@ -115,6 +144,7 @@ struct virt_smmu {
>>        uint32_t    strtab_base_cfg;
>>        uint64_t    strtab_base;
>>        uint32_t    irq_ctrl;
>> +    uint32_t    virq;
>>        uint64_t    gerror_irq_cfg0;
>>        uint64_t    evtq_irq_cfg0;
>>        struct      arm_vsmmu_queue evtq, cmdq;
>> @@ -160,9 +190,15 @@ static inline bool smmu_get_evtq_enabled(struct virt_smmu *smmu)
>>        spin_unlock(&smmu->cr0_lock);
>>    
>>        return enabled;
>> -};
>> +}
>>    
>>    /* Queue manipulation functions */
>> +static bool queue_full(struct arm_vsmmu_queue *q)
>> +{
>> +    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
>> +           Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
>> +}
>> +
>>    static bool queue_empty(struct arm_vsmmu_queue *q)
>>    {
>>        return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
>> @@ -175,12 +211,133 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q)
>>        q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
>>    }
>>    
>> +static void queue_inc_prod(struct arm_vsmmu_queue *q)
>> +{
>> +    u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
>> +    q->prod = Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
>> +}
>> +
>>    static void dump_smmu_command(uint64_t *command)
>>    {
>>        gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
>>                 smmu_cmd_get_command(command[0]), command[0], command[1]);
>>    }
>>    
>> +static void arm_vsmmu_update_irq(struct virt_smmu *smmu)
>> +{
>> +    bool evt_pending = false;
>> +    bool gerr_pending = false;
>> +    uint32_t irq_ctrl;
>> +
>> +    spin_lock(&smmu->irq_cfg_lock);
>> +    irq_ctrl = smmu->irq_ctrl;
>> +    spin_unlock(&smmu->irq_cfg_lock);
>> +
>> +    spin_lock(&smmu->evt_queue_lock);
>> +    evt_pending = !queue_empty(&smmu->evtq);
>> +    spin_unlock(&smmu->evt_queue_lock);
>> +
>> +    spin_lock(&smmu->gerror_lock);
>> +    gerr_pending = (smmu->gerror ^ smmu->gerrorn) != 0;
>> +    spin_unlock(&smmu->gerror_lock);
>> +
>> +    vgic_inject_irq(smmu->d, NULL, smmu->virq,
>> +                    ((irq_ctrl & IRQ_CTRL_EVTQ_IRQEN) && evt_pending) ||
>> +                    ((irq_ctrl & IRQ_CTRL_GERROR_IRQEN) && gerr_pending));
>> +}
>> +
>> +static void arm_vsmmu_set_gerror(struct virt_smmu *smmu, uint32_t gerror_err)
>> +{
>> +    uint32_t pending, new_gerrors;
>> +
>> +    spin_lock(&smmu->gerror_lock);
>> +
>> +    pending = smmu->gerror ^ smmu->gerrorn;
>> +    new_gerrors = ~pending & gerror_err;
>> +
>> +    if ( new_gerrors )
>> +        smmu->gerror ^= new_gerrors;
>> +
>> +    spin_unlock(&smmu->gerror_lock);
>> +
>> +    arm_vsmmu_update_irq(smmu);
>> +}
>> +
>> +static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
>> +{
>> +    struct arm_vsmmu_queue *q = &smmu->evtq;
>> +    struct domain *d = smmu->d;
>> +    paddr_t addr;
>> +    int ret;
>> +
>> +    if ( !smmu_get_evtq_enabled(smmu) )
>> +        return -EINVAL;
> 
> If the queue is disabled, the event is simply discarded and nothing is
> wrong. Why do we then raise GERROR.EVTQ_ABT_ERR via arm_vsmmu_set_gerror()?
> 
> 
>> +
>> +    spin_lock(&smmu->evt_queue_lock);
>> +
>> +    if ( queue_full(q) )
>> +    {
>> +        spin_unlock(&smmu->evt_queue_lock);
>> +        return -EINVAL;
> 
> This does not look like a global error either. From what I got from the
> SMMU spec (ARM IHI 0070/H.a 7.4 Event queue overflow), when the queue is
> full the event should be discarded and the overflow flag should be set
> in EVTQ_PROD.
> 
> "The Event queue overflow condition is present when:
> SMMU_EVENTQ_PROD.OVFLG != SMMU_EVENTQ_CONS.OVACKFLG
> When an overflow occurs, the SMMU toggles the SMMU_EVENTQ_PROD.OVFLG
> flag if the overflow condition is not already present."
> 
> Otherwise the guest might show a misleading message (an event queue
> memory-write error instead of an overflow).
> 
> Or I really missed something?
> 

You're correct. This is not handled according to the spec. I'll fix this 
and also the previous case when the queue is disabled.

>> +    }
>> +
>> +    addr = Q_PROD_ENT(q);
>> +
>> +    ret = access_guest_memory_by_gpa(d, addr, evt,
>> +                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true);
>> +    if ( ret )
>> +    {
>> +        spin_unlock(&smmu->evt_queue_lock);
>> +        return ret;
>> +    }
>> +
>> +    queue_inc_prod(q);
>> +
>> +    spin_unlock(&smmu->evt_queue_lock);
>> +
>> +    arm_vsmmu_update_irq(smmu);
>> +
>> +    return 0;
>> +}
>> +
>> +static void arm_vsmmu_send_event(struct virt_smmu *smmu,
>> +                                 struct arm_smmu_evtq_ent *ent)
>> +{
>> +    uint64_t evt[EVTQ_ENT_DWORDS];
>> +    int ret;
>> +
>> +    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
>> +
>> +    if ( !smmu_get_evtq_enabled(smmu) )
>> +        return;
>> +
>> +    evt[0] |= FIELD_PREP(EVTQ_0_ID, ent->opcode);
>> +    evt[0] |= FIELD_PREP(EVTQ_0_SID, ent->sid);
>> +
>> +    switch ( ent->opcode )
>> +    {
>> +    case EVT_ID_BAD_STREAMID:
>> +    case EVT_ID_BAD_STE:
>> +        evt[0] |= FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
>> +        evt[0] |= FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
>> +        break;
>> +    case EVT_ID_TRANSLATION_FAULT:
>> +    case EVT_ID_ADDR_SIZE_FAULT:
>> +    case EVT_ID_ACCESS_FAULT:
>> +    case EVT_ID_PERMISSION_FAULT:
>> +        break;
>> +    default:
>> +        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
>> +        break;
>> +    }
>> +
>> +    ret = arm_vsmmu_write_evtq(smmu, evt);
>> +    if ( ret )
>> +        arm_vsmmu_set_gerror(smmu, GERROR_EVTQ_ABT_ERR);
>> +
>> +    return;
>> +}
>> +
>>    static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>>                                  uint64_t *ste)
>>    {
>> @@ -189,6 +346,14 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>>        uint32_t log2size;
>>        int strtab_size_shift;
>>        int ret;
>> +    struct arm_smmu_evtq_ent ent = {
>> +        .opcode = EVT_ID_BAD_STREAMID,
>> +        .sid = sid,
>> +        .c_bad_ste_streamid = {
>> +            .ssid = 0,
>> +            .ssv = false,
>> +        },
>> +    };
>>    
>>        spin_lock(&smmu->strtab_cfg_lock);
>>        log2size = MIN(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg),
>> @@ -196,7 +361,10 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>>        spin_unlock(&smmu->strtab_cfg_lock);
>>    
>>        if ( sid >= (1U << log2size) )
>> +    {
>> +        arm_vsmmu_send_event(smmu, &ent);
>>            return -EINVAL;
>> +    }
>>    
>>        spin_lock(&smmu->strtab_cfg_lock);
>>        if ( FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->strtab_base_cfg) ==
>> @@ -249,6 +417,7 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>>            {
>>                gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
>>                         idx, max_l2_ste);
>> +            arm_vsmmu_send_event(smmu, &ent);
>>                return -EINVAL;
>>            }
>>            addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
>> @@ -277,6 +446,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
>>                                    uint64_t *ste)
>>    {
>>        uint64_t val = ste[0];
>> +    struct arm_smmu_evtq_ent ent = {
>> +        .opcode = EVT_ID_BAD_STE,
>> +        .sid = sid,
>> +        .c_bad_ste_streamid = {
>> +            .ssid = 0,
>> +            .ssv = false,
>> +        },
>> +    };
>>    
>>        if ( !(val & STRTAB_STE_0_V) )
>>            return -EAGAIN;
>> @@ -312,6 +489,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
>>        return 0;
>>    
>>     bad_ste:
>> +    arm_vsmmu_send_event(smmu, &ent);
>>        return -EINVAL;
>>    }
>>    
>> @@ -362,16 +540,19 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>>        if ( !smmu_get_cmdq_enabled(smmu) )
>>            return 0;
>>    
>> -    while ( !queue_empty(q) )
>> +    while ( !queue_empty(q) &&
>> +          ((smmu->gerror ^ smmu->gerrorn) & (GERROR_CMDQ_ERR)) == 0 )
>>        {
>> -        int ret;
>> -
>>            addr = Q_CONS_ENT(q);
>>            ret = access_guest_memory_by_gpa(d, addr, command,
>>                                             sizeof(command), false);
>> -        if ( ret ) {
>> -            queue_inc_cons(q);
>> -            return ret;
>> +        if ( ret )
>> +        {
>> +            smmu->cmdq.cons &= ~CMDQ_CONS_ERR;
>> +            smmu->cmdq.cons |= FIELD_PREP(CMDQ_CONS_ERR,
>> +                                        CMDQ_ERR_CERROR_ABT_IDX);
>> +            arm_vsmmu_set_gerror(smmu, GERROR_CMDQ_ERR);
>> +            break;
>>            }
>>    
>>            switch ( smmu_cmd_get_command(command[0]) )
>> @@ -395,6 +576,10 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>>            default:
>>                gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
>>                dump_smmu_command(command);
>> +            smmu->cmdq.cons &= ~CMDQ_CONS_ERR;
>> +            smmu->cmdq.cons |= FIELD_PREP(CMDQ_CONS_ERR,
>> +                                          CMDQ_ERR_CERROR_ILL_IDX);
>> +            arm_vsmmu_set_gerror(smmu, GERROR_CMDQ_ERR);
>>                break;
>>            }
>>    
>> @@ -405,6 +590,15 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>>                         ret);
>>                dump_smmu_command(command);
>>            }
>> +
>> +        /*
>> +        * Stop consuming the command queue if a command error occurred.
>> +        * CMDQ_CONS continues to point at the offending command until the
>> +        * error is acknowledged.
>> +        */
>> +        if ( (smmu->gerror ^ smmu->gerrorn) & GERROR_CMDQ_ERR )
>> +            break;
>> +
>>            queue_inc_cons(q);
>>        }
>>    
>> @@ -443,6 +637,7 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                vreg_reg32_update(&reg32, r, info);
>>                smmu->evtq.cons = reg32;
>>                spin_unlock(&smmu->evt_queue_lock);
>> +            arm_vsmmu_update_irq(smmu);
>>                break;
>>            default:
>>                printk(XENLOG_G_ERR
>> @@ -573,6 +768,7 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                vreg_reg32_update(&reg32, r, info);
>>                smmu->irq_ctrl = reg32;
>>                spin_unlock(&smmu->irq_cfg_lock);
>> +            arm_vsmmu_update_irq(smmu);
>>                break;
>>    
>>            case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
>> @@ -602,6 +798,10 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>>                vreg_reg32_update(&reg32, r, info);
>>                smmu->gerrorn = reg32;
>>                spin_unlock(&smmu->gerror_lock);
>> +            arm_vsmmu_update_irq(smmu);
>> +            spin_lock(&smmu->cmd_queue_lock);
>> +            arm_vsmmu_handle_cmds(smmu);
>> +            spin_unlock(&smmu->cmd_queue_lock);
>>                break;
>>    
>>            default:
>> @@ -905,9 +1105,10 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
>>        .write = vsmmuv3_mmio_write,
>>    };
>>    
>> -static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
>> -                               uint32_t features)
>> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>> +                               paddr_t size, uint32_t virq, uint32_t features)
>>    {
>> +    int ret;
>>        struct virt_smmu *smmu;
>>    
>>        smmu = xzalloc(struct virt_smmu);
>> @@ -916,6 +1117,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
>>    
>>        smmu->d = d;
>>        smmu->features = features;
>> +    smmu->virq = virq;
>>        smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>>        smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>>    
>> @@ -928,6 +1130,15 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
>>        spin_lock_init(&smmu->strtab_cfg_lock);
>>        spin_lock_init(&smmu->irq_cfg_lock);
>>    
>> +    ret = vgic_reserve_virq(d, virq);
>> +    if ( !ret )
>> +    {
>> +        printk(XENLOG_G_ERR
>> +                 "vSMMUv3: Failed to reserve domain vIRQ %u\n", virq);
>> +        xfree(smmu);
>> +        return -EINVAL;
>> +    }
>> +
>>        register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>>    
>>        /* Register the vIOMMU to be able to clean it up later. */
>> @@ -953,7 +1164,7 @@ static int domain_vsmmuv3_init(struct domain *d)
>>            {
>>                smmu = (const struct arm_smmu_device *) hw_iommu->iommu;
>>                ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
>> -                                      smmu->features);
>> +                                      hw_iommu->irq, smmu->features);
>>                if ( ret )
>>                    return ret;
>>            }
>> @@ -983,7 +1194,7 @@ static int domain_vsmmuv3_init(struct domain *d)
>>            }
>>    
>>            ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE,
>> -                                  features);
>> +                                  GUEST_VSMMU_SPI, features);
>>            if ( ret )
>>                return ret;
>>        }
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index 8863e2e457..c43b8b7b71 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -538,6 +538,8 @@ typedef uint64_t xen_callback_t;
>>    #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
>>    #define GUEST_VIRTIO_MMIO_SPI_LAST    43
>>    
>> +#define GUEST_VSMMU_SPI         44
> 
> So this is the same emulated SPI as the one used for vPL011. You likely
> need to update d_cfg->arch.nr_spis if vSMMU is enabled for the domain,
> to ensure that we allocate enough SPIs for it (refer to
> arch_parse_dom0less_node(), when "nr_spis" is not explicitly specified
> we update nr_spis if vPL011 is requested). Moreover, you already do this
> in libxl.
> 

Agreed, I missed handling the number of domain SPIs in dom0less mode. 
I'll update this.

> 
>> +
>>    /*
>>     * SGI is the preferred delivery mechanism of FF-A pending notifications or
>>     * schedule recveive interrupt. SGIs 8-15 are normally not used by a guest
> 

BR,
Milan


