Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB9C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 15:13:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417352.1646225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52vv-000763-Vr; Fri, 11 Sep 2026 15:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417352.1646225; Fri, 11 Sep 2026 15:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52vv-00075w-Ry; Fri, 11 Sep 2026 15:12:55 +0000
Received: by outflank-mailman (input) for mailman id 1417352;
 Fri, 11 Sep 2026 15:12:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x52vu-000727-K4
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:12:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52vt-006AOs-LB
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 17:12:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa41a5b-2eae-0a2a0a5409dd-0a2a450bcef6-32
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:12:53 +0200
Received: from [40.93.195.59]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa41a73-b7e8-0a2a450b0019-285dc33b12bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:12:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6924.namprd03.prod.outlook.com (2603:10b6:303:1bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Fri, 11 Sep
 2026 15:12:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:12:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLvWXGi71qYmcOvGtqC6WtO6QYYV9Hlfou8NQS9DjLts+EJPpx6BZzKHdIlZGMNbXrFmFBjErSCbxmLH9pkCQkZVHeTNO/qWkyqVk4Axw97wwspUX3Uq7jlGn1itiTFNbI1UbmTPN8qtySGEZwQKb5m3jHbznDk6qQrsA4XeJbCzjAWg3tW21qXzInGxwkn6mXXcECxEHY1bIqLH1vgSzPfpcPy8nf1FsNf7Oj2l7lSN1s2MwIF2WCql8C200g8YSzukjCnpeiLAiPnB7G1jrT/JlDgzCHFd8OfwA6g+z8JJW/F/7g3qmQa5jA8ifC0IsSQxr/BlT+9fMD7ggCo9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySR8o1TKI8v10yWCw67hEJPO+S7CIf5hx7qyuznbsAg=;
 b=hkt6uGCKNCAtNGLymcQomnlWgTB3N1o5ez9o6hwRn0Xrcayv4i/mv/OhVfTwUQoH+KgStWVtlTq6TwDeb6LuPzOxrjq7vrvCn4OzhhxIAZMeHKtwcUpqi35VDpfnEDX60Q/Qo65l/NWiCLd4yLx0eIuS+3PVbiyfAPjBaNyG2dQaYgFRoG+N8yA5bNod4a1A4wBGVitp7t82+eJ5ZNqgq+BCKuHf2KTcFJEafxaU/9de3EmwHIQ4Aqj0TvtBI+IozN2ROXGn4WnrRKW8CwiBKGdfyPbl23NfpXLCpB7BJjkRmLNcXhpVokZuBVU4r3mYmymOoYlJ/jX6ubdmv5qEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySR8o1TKI8v10yWCw67hEJPO+S7CIf5hx7qyuznbsAg=;
 b=K17iLX0cnE3MUCPTK0JblcnOIvMQ8Lno15eIPEfSaNigifg0Y4sx7DUHYuaQiHHKyWE9Dn8ixvtjPLs9N+YMo4W5rp1dSKVIAeSRbJ/bYXU9ILKOjXXoLTi/aAfmp/cW5wLQudCpzI2hb68lFpwdpFEHfwbkHPLdYjTlsvcob9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9da3d6e7-f4db-43c7-b13d-2bf3830caef5@citrix.com>
Date: Fri, 11 Sep 2026 16:12:43 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com
Subject: Re: [PATCH v2 5/7] x86: extend do_mmu_update() to support returning
 the old PTE value
To: Teddy Astie <teddy.astie@vates.tech>,
 Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-6-kevin.lampis@citrix.com>
 <1789129949.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1789129949.8631fc262581453bbf619ec5b2062170.1a09074801c000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ec5732-84f7-4e55-35d0-08df1017229b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IhqXEsI7ezP9yPj3d12qXu9K7+U3n302tA/pOdIFn6NtV3pO4/zNtTfVghABxoOLVeOkVWDC5zdNtPPZ0f5C1zmb72T2dNW5ag53PlbaCRJJ3bOW7yhsUlbTXXywIeXz291jImRqqg0nc/MU0r1jlkFgEp44lBQ/XKVqpgROKAuVBlgGWcGa9AzsNPaptBKtICql4QkbWYrTEv8QoKsHd8YugDou8Z+BD7jDki5dJ53acrbX0Yt9SUhgvtiEs/nOYbV6OYMm8p3qeS+ZjUVqulm5uxyT0G40Wxe5UnLbRY8oxS0tfrUzH/OAQgYyWDBAlJkNRIyZqcb2u4hFMHds3OHOLQUrQ30jmusbk/Ctaar66vkYpPo4C/00yz6qrGK01o/QwFS2WTYCwJGnN2lIIiS+TS/mnbtRVzq3o15eNcD4pWtECeu1dfSStKUmdd3ZEzO2oedOxvvsHF3vVseQTMPaEJjy6Gc6DXR5XqlyROeGMv7zGSCGsSPNDaYNtGeFCHZNyZtln0OxGDdeTJHSJfTvz+C+Bz7xzbzLIcKPE6zrIc8B10v88Dg2ztjbWTdY0aqVNtAvLGLCZ3UoUk2MTZahJBfvpVWFixBnOktRsBChJpe1gWeBor6IbdZdZUwVCVL0Qn+9cig378Sy7zIEwqaN8IaTXD/QLATeWqTsUvo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNDMU5GakRvRkRtR3BaV0pTYnpLRE95VE9Dci9nTmRqM1hFVFdFUzBBUHBP?=
 =?utf-8?B?djAwYjVTMlRCcXQ2bXExRlVYZjlRb1U2UDZhZU4xT012ek92bldnMVhGb2hW?=
 =?utf-8?B?ank3WjFicGZiMmtFS2JFNXBHYjUxU0NQZVRDZEdoTUVaazNRQVJOdUtxOGRh?=
 =?utf-8?B?QTBxNzcxUmxjVjk5bzYwS3lTOFVRUEtlY0NzVzg1VFhTM2FpR3VQcGtUcWt1?=
 =?utf-8?B?alNweThDOXdxY09OUDc2ejlRVDk2eTBJa1M0M0R5NXRMQm8rWUFvYUN2Q3Ns?=
 =?utf-8?B?RVkyVTlXRms5UkZtTUx4aDlFOWNCMEl5L1F5ampCV3NHV2xhTjQzbXAzSXg1?=
 =?utf-8?B?Nkw5dDVOVERrMWRzTlc1TW9LVXJoVWR2d2pGazJrM2c4S3hQSkZ3cjJkTkNP?=
 =?utf-8?B?bktKSjlnc1dMQTBPTk96alFCSVQyb1ZWbUl1bVRVZkQxQXMvSGtTNmlpVzA2?=
 =?utf-8?B?akZqVkZ6R3lYQWRPVU8rb2sxT1Z3YlpwMTdEMk5uODBCcEg3aE5PWHFSNTZK?=
 =?utf-8?B?T0dGVWp4UDByNklJWS8xSi9PdUlIUlR5SHNaa0oxek9GNDFQS0VyUmxhMjNK?=
 =?utf-8?B?YnFiNkh6dDhZbkx6VFQzbzVYeEk5S3hSWWl6amhCbnJ0Y0pEVDQwZDR0akhH?=
 =?utf-8?B?R21ZczFnbzhwT1NNUWtCdndjOVJKR0xKQnd3eC80RTNvSlVWUVZETVRFRGds?=
 =?utf-8?B?MlhRcHVyc3pmWVAvR0grOGNxV1d1THpZR1IzS2FzOHh1eklzbXJpVXNlL3Yv?=
 =?utf-8?B?ZWZyK0xBUFI0cUFucVp3Q245enV5bUxRb01ocFA2YnROT3JSRXdod3plNysr?=
 =?utf-8?B?ME1oaDBHMjhjZHd3ZWp3dzVxMUVvZ21BSDFrTnFQMUU3a1hsNlBucGdQV1JO?=
 =?utf-8?B?QllJRlhnRG5Wa25uTEJ1dFNaOVFSTXNJZGtMMS9LNVg4Y2hIakNPYUk4bU5n?=
 =?utf-8?B?SGsxeW1JMFZTQ1FybUxCOHRvYXhzcTg3WHZSN3p6ZWh1TE5scDAvamU1UytB?=
 =?utf-8?B?SmVHRUUxWFh2SGRVYjRYckMzRms5eHZPWG9KWVEwN3djOXhaUENCVit4Q2Ur?=
 =?utf-8?B?Z2dhSSt2cU40dTVOOWFYcE5DWEZ3dzkrMDI3d1pWUm1OUlhseFd3NDlJaksy?=
 =?utf-8?B?MDduamNwaFY5WGtRbUlXR2VQd1RVc1FLZzNzVVM5akJ3UFJrbVUwaDV0alU1?=
 =?utf-8?B?SEFwZ1hNREhTZTJrZHdFZGZESUhKRldGL3d6R0NvZ0VneTcrRWJyTWcyVTd4?=
 =?utf-8?B?eUgvd0gvQTlSWWlhbU1ZMkFnckRpSmEyNzRVdzZXUFJXb2tSTVc3V25GSllS?=
 =?utf-8?B?RUNSWkpyd1BZNjdxS1RRN2h2VE9UVGFLWFh3alpRK1ZCRmpkZ2s5ak1MZEp4?=
 =?utf-8?B?V2VpZHYzYUh6MG04WTkzbEc2YTBpOWtocmlRd1VVdms5MzdYVWExN0FRanRU?=
 =?utf-8?B?MU5PVm1QQ2dhdDdlMFN6US8rd254d3hmT0Y2Qm15MFFobDZnSGxQZDVMazNQ?=
 =?utf-8?B?L05meUlqaURWS3VzbGpWQUhTUm9NUDNxdnlmODBLM3lVQlVsYUdSRE45bHdF?=
 =?utf-8?B?YkNWRThja3VTS2Q4cG4zK1NFWVRxS2RIY0o1T1d4aGxQZnZkcEUwS2VmNjF4?=
 =?utf-8?B?QmxhUGUzZUp4VmNxaG9NRjZIRG1NNjkxdjRybHlxV2dmT2hYVkZKTkhwTHhS?=
 =?utf-8?B?bW8zbHpQb0tVaGJNVVRTMjdVb1ZQSEFvRDNFamZLWUlVRWVMcnNCdy85U2Rl?=
 =?utf-8?B?Q011MUhhWnhDbnFBOFNhYzU2MTJzRWlicDUvWm9NNy9ua2tMeHNmejNURnM0?=
 =?utf-8?B?NTZBNmtiQTh4UXVpaHZ3bS9HTSs2dFRzdnhsd3lvSk9jdTFPNXJzVmFvWE1W?=
 =?utf-8?B?S1IvQzNzU0hxVU5QaU1ZNGp5Wmh1WDMxVDNManJQN2NjMVZWb3I1YzJwVm5J?=
 =?utf-8?B?c0h0THh2NGJXenNjbHN0Z29rQXRWZUVMWm4zU1NiKzJmMmdWTFBLOVJMUlZk?=
 =?utf-8?B?VWZSZkhNUTJ5TGVaVW1Ia0ZlREJYSER1Nm1BQUtNaHVZMEg3U2hUNnFjVlRW?=
 =?utf-8?B?SlRXY0hxUmpGdDdVd1BEbFUzYWR6Yll5Q1dQaVpHakRwSFlPK3J3b3VWZkNN?=
 =?utf-8?B?OGo3N0pNLzY0MC9hSnRENzVJQWdERkdZVnVOVm85VWx5MnBaUEhTK1pDTitD?=
 =?utf-8?B?Wm5GVVlPM1JaTzNBZUE3WnJnNU12N04rWEFZS25UVXoyNE0vRnNzazFxWXN6?=
 =?utf-8?B?bE9pQk5uaWdQNytRQ2luY0ZER0tBZG5iWlNwdS9ab0Z0S05LNU5XZ1lRcTdh?=
 =?utf-8?B?NXgwVlh1czYyVXVaT0krMklRQVVhRXJnYTJBSjZRZ1NOUlV4alQ0Ty9QSUZT?=
 =?utf-8?Q?6SQYiCwAdXcoZMKM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ec5732-84f7-4e55-35d0-08df1017229b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:12:46.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QK9o1xdN0y9lOTel/xAJCasGGqKHcrgOsD66i7Z1SpVAEYmzjcWfzVW2eH1UnLn+WDJKD0Ays3t+J7y0c2ODEzlnF7nLQaas7YuwxtVjzMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6924
X-purgate-ID: tlsNG-42698a/1789139572-A88C99EA-DD916D2D/0/0
X-purgate-type: clean
X-purgate-size: 855

On 11/09/2026 1:32 pm, Teddy Astie wrote:
> Le 10/09/2026 à 22:31, Kevin Lampis a écrit :
>> A new sub-op MMU_PT_UPDATE_SWAP when used will do an atomic swap to set
>> the new value and return the old PTE value through the req.val field.
>>
>> - The new PTE value in req.val must be 0, at the moment this is intended
>>    for clearing only.
>>
>
> I'm not sure this is a good idea to restrict the feature for only 0.
> If in the future we want to expand this to non-0 values, we will need
> to advertise this property to the guest as well (so that it knows if
> non-0 values are supported). I don't know what supporting !0 would
> require (but it could be useful to get a idea of it).

Going further, this cannot be limited to 0 as an input, or to only L1e's.

What I don't see is why you need any restrictions at all ?

~Andrew

