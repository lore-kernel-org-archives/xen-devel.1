Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6279FCCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:37:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452410.1667217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkvX-0001NS-PW; Fri, 16 Oct 2026 16:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452410.1667217; Fri, 16 Oct 2026 16:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkvX-0001NL-Mq; Fri, 16 Oct 2026 16:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1452410;
 Fri, 16 Oct 2026 16:37:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHkvW-0001NF-51
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:37:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkvV-006dcF-BC
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:37:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad252a4-2eae-0a2a0a5409dd-0a2a450bc9a2-14
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:37:01 +0200
Received: from [40.93.201.6]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad252ab-b7e8-0a2a450b0019-285dc906a879-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:37:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5166.namprd03.prod.outlook.com (2603:10b6:208:1ed::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:36:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:36:57 +0000
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
 b=b0YlZ+KLAH19vGhVGjje0mM9nSyLqW9NLaJaf+mwVL6s1LOTDO6nPGjkdSHt9g4du6LV/NfsNDAFirELHMSXV+ZUVif4lUsmmqKjLoDeS8tusUxP+c0NbeEMRGUw1CdEEVurb0eORnyhE+s8tu07dCi1ZVdFQGF56OmF5VJ1gY1RkHHtZVCu+dZJKv/QNIZKnf6Del+vI+ajWknWQyPQyAvNsbutd7qJtRDCtkbJINnShXNFwN2RU82y1ikF4ifTTKgQJTMhGSTgc885JXrXXJOeyn9/JE6335CESev9up34YP2dO0ymDytEJdlfIorVxOxqVywFfrF6XEpTzGpoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQ+KiWd7RVdspkZs+Vz/zKm2XUDqRv7uJws7Rmry7Zg=;
 b=s6jt+STMYNpWRPHzsCuonWYPxjEx3XKizpJufbvXNHtJV17cryg7JLLFCvTdRJmuWu5XQkRioo4/nEVVKSbEt+BNJE7Zi2MAC34QdIwxWIBVR2/VSeDAc0Utpe6LqbQOKSYPDFWyW5+gthBoZxwO2Rp09VbKS8N5rowFl+mG4X4YVYpPf4yfqe1eFLBFL1FoSGroENgSwQfBWQdji0l1sraXJ7vMQsPivO6XsHdNn6K/vNLg9VzfSu2ejL1DJzo5FcUgPqZHcI9hCpCUeFNCm0s4MDriB3FRGdFTkJmMPZz0WB/5SbNp0wDvNpUd74N7Gys87oiEClIoMual+JuWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQ+KiWd7RVdspkZs+Vz/zKm2XUDqRv7uJws7Rmry7Zg=;
 b=Mb+SKqC2GO9EwYSXPm+NlJ12xdJ1I05GFrs9CQR4tsl7q88CUNAKOmFU43ssy5SqxqZq8AoNGnT/kNB8mXKQQ8MeWmt289aU1obDCIk1ek4+yFr52mhpk7R659ReTYMDkVaK6zgTVaUedv6uSe6k5tCHlM8mv+6qL339X0mLLNM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <63025824-d15f-4697-97c0-e90d59fa813f@citrix.com>
Date: Fri, 16 Oct 2026 17:36:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v4 3/4] x86/traps: reduce indentation in
 fixup_exception_return()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
 <dd38f7cd-a823-4569-b5f1-7358ae6325fd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dd38f7cd-a823-4569-b5f1-7358ae6325fd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0413.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::25) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 901a8910-9d4a-49a4-f4a7-08df2ba3b19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2xELuQVUsE8OHZSkeCmpQ/gGOF/qvwwacWIAaDYdFbpAsV1EWWk7G/lXv3RiYJ/h3Pw77Z8ujMqMvZKTQvqR6hHy/dtCmIkJ31CXmYKulejW1RI/RMJy0ULp6h5LldLOeWrGL5caHFK3X4mqSa2ZUsQkpqvrI7VhAzfea95Hy7uxqecvDRwBYMT7e2MrPfnzRHF0qtgP53wrG5TUoU5G8Aqn6FlU0GH+15jcFg5EXxfy674MzIjk1AYNxiyn/P37qvNREnKORv2q5Qe3i7dGkVaEkwd/aiJAyEwFfdkTCsydaai8kRqoTpdI+fiYHiD6eeJ7x4YBF0Uw9FVeX2cY7fnj/8xmPnzjmMPb+gd6SXxPd1gqYP7U0quS+hIhVWFiBgxOn5ga5wfE3V4UlRrdzsYFjJEfvVru5qVfltV1KSJy2Xd+R/vs2fw1TS0np35A22UixMaCc2SN9LT+FJEBcz2KkxsMcMuqFIZJTnDVXuZdya5BKh0NIQRZ7Z1VdiTS6NnLJWZPDxUdwBzVmfTlIiacxnBfYs+hw3MoX5qrMKO95sG5ZIa3Jdj/0ocxBZ8XNwmujxbsxDseZ8P9s9rxu0ouL+rzh5XWJfKa6QdAE3MUT91NStPiYiOL89dv0yjAKXgjvJ7JhDrX3bpZDN+/tlrrwtaq4BBS/uX64BB6WvM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFg0NGdMcVNUNzZaayttRnkrRk5waWNSU3NJQk1wTlg5UVRwS1RZQ1NsNkI0?=
 =?utf-8?B?bUxDaHhFaDlzYS9kMG9TMEZHcjNHRTdsVlcyQVNUR1l4WXJCdUdMTi9UaWhX?=
 =?utf-8?B?ZExBOExuV1FrcXA5ekhqQjMrNUMwTWZNZ2tkc0hlYXk5cFNIUUxBZUJ3VHdO?=
 =?utf-8?B?YkJESE5ZZ3pVN01YeC9SZ2hoVEZiRVlDZExHMUd5M0dzbEQ5c3dDdDA5cGow?=
 =?utf-8?B?alZhOGtyZVdKTmpLSzdRMjB6QVRiNElybFJ1TUhQa1MrbVd1T3BRMElXaktS?=
 =?utf-8?B?ZjZ0K1JrZU5maTlscGJlUEdEUGFuc01MeGFDUEFRd05tMEJneVZHRDZVS3A4?=
 =?utf-8?B?ZklYZVA0TlRNMnZ6MXhQbzFDV1dPNUNvYzV4RVlZSnlHSlNEWElUT1dmSEo5?=
 =?utf-8?B?YlBSZEhacWFqbk1hSmlENVl6YVNoRGlVajBiS0QxbzBINkYwcThrQkdqZXdN?=
 =?utf-8?B?SGRtR1MrMG1RNnhFb0FUZXBOMGZ3RENneUo4K1cvdkpvSGJvK0RXL1RicStv?=
 =?utf-8?B?WStrK1dlNVlyR3pabmJ1dXYwanAzTjhIWHhRbms3TXBMeElzbmtzZXVZSTMv?=
 =?utf-8?B?RzF2ay9QNi95RWdENHJ0NDFCRVlkdnpGZUcyMU0rMWJ3SDZ3RjRud1BNeVlm?=
 =?utf-8?B?WC9vQitFTVJJcFdnTXVFUm9ULy9rRW56RWQyMlJ3ZVE0UWFZdGVMMUR4bnQv?=
 =?utf-8?B?MWpPV3BFa1BxL3B3eHQ1Y1NWdmVkU3pjSGt3QkdkRlRMTWdhT0o5Vkd2Mmpt?=
 =?utf-8?B?NTJFWFlVbk40SFBHY3JuUjN2UWcwamN2clBDMFJQQzk0OTRNK0xYbFNKYnlI?=
 =?utf-8?B?d3MzTlZSbzZxZngySStQaDJMcVhvWEtKQ2QzdE1vcjBqMjBDN2czdXlnVWNQ?=
 =?utf-8?B?dXNuZHpaWG5xd2pRamIrQmF4ZDUrMkNSaWtoRVVvbU8xTEt6SGkrQk9iejRZ?=
 =?utf-8?B?M2dTdWk3eld5WkZZeTY1QmxuSGtpakVjb0cyZk5lVUxPdUlFV28rVTJKd0l1?=
 =?utf-8?B?STJVMTh0OXIwZkFpRmJKL2lEbDArTU01dC9DREJHMTk0MTRyQUhvMzVDdkNC?=
 =?utf-8?B?dG1JQU5YQmFBaWZNeGtVUHE3ZHBpaDNVSmhkaTVvVzk1ZGRNRXBuZmJ4QTlx?=
 =?utf-8?B?MFNacTBTVGYvcTlhbnJ4eWMvbnVUdXpYYmRDYnphQUMrcXVsUG11NlA2b3BI?=
 =?utf-8?B?Y2dwMm5zdlNkZTNpY2gwRXJUd3lIbzhBYXZUOFhhSHJwcENKdE5Ldi83Qk5E?=
 =?utf-8?B?bHNaTU56WVVuWjR3V0p1UmYwYzFQcU03bzJxK2JmZ0lwM0puc092M28zUzIy?=
 =?utf-8?B?SUNZYllPemZORDY5SFUxaDFVWS9BVlNxOXNwMWhveDlXNFltOWIweGZ2UG9L?=
 =?utf-8?B?M3ZyNDFQRUVKMC9CUmZ3enRVbjVQbTI0d1BWbW80WlVyMmxQWHBNWm9SZmJj?=
 =?utf-8?B?MDJaZFhibDlLeTN5THVXWmMyTVBMdFM4L2lMMHVuWmh1dEM0VDdqSmFobVZ0?=
 =?utf-8?B?ZVhUNFNHaFB3RFhtaE9wVHFub1Q1dFlqZ3NQWGg0TkpUeGdCU21yL0VsdTNV?=
 =?utf-8?B?SFFuN3l6aEtid21IUHRSVHB6ck9uQmd1OXh1RlBncUcyWmlOTHlRSkQwRzR3?=
 =?utf-8?B?V2pDMnJzWWdtczNMeVBaVW9yQTg3K2k3MkJMRkQva0VraVYwK2dXTTQwQStp?=
 =?utf-8?B?WENvdVJLaWg3ZDlqMGR6YlcybnlCbHhmcmV6bm5EZVp6dXdGU1VyUzNBb2Qx?=
 =?utf-8?B?UmNSTi9tSkZ0WDVWaWZxSS9OcEErLzRjdUZYRG5SRFZVUXJ0Z3Rjc2t3YWxK?=
 =?utf-8?B?ZDIzQnluSSs4MW5ZVm5oTWNiVUZPSFNFSHF2L0NRR3RYVmo1L1lBQlVjRytB?=
 =?utf-8?B?dkJaUmFhd3c4MjY3b1lLVmw5Mi9va2JsNFRXaEt6TWxXV1pRMVFnc2dJNlJT?=
 =?utf-8?B?aUI2cDB0L3hDeWNsMDZhT3RqY0c4U0FJOGJ1OFBDUkpvMVpQZXZ6U0VNbWE4?=
 =?utf-8?B?dSt4SVJva1l2NWdSNUFCYmN0M1M4ancyUWNBUUxqYVZEaCsrcDFrMWNsRUFL?=
 =?utf-8?B?cU1ZSlJUd1NmMi9kbjc5Zm5INCtiMW5lbGZNNVJNa0tJbm1CMHZhMlcwWm5j?=
 =?utf-8?B?QzVFUERoK1k5U1p2K1QxRjRoUitaMjF0eUU3Q012NkxGaEdXUHBiZnJlcXA4?=
 =?utf-8?B?SWhzZ3NHa0tnNU81c096YVRtVnB1OFl0Y24xV2FLdE9Jamk5enZLV251VHJW?=
 =?utf-8?B?R21iZmNWQXVoakE4WnZEUmNqeTJscERMcE9LMFRSakJZM2JqWGVJZUlOMFBZ?=
 =?utf-8?B?cHhUUFhPQ0RFZmpzREJQMFUvR3M3Wkx5VWNLRnFoNTVLSWl4RCtLZWtxdHBT?=
 =?utf-8?Q?ikCjgYn+FN1Rt0Vs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901a8910-9d4a-49a4-f4a7-08df2ba3b19e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:36:57.1176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWkB+yWzI5MrrdjzfSUHDBN4VdPqxSWJPrjfvCx3uixIofK5IV3ROyN3A0hLf8YNtRblYykrwtE1CF+OxWBuTMWijf12JT0+ubi+cQkxMss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5166
X-purgate-ID: tlsNG-42698a/1792168621-AA0C59EA-1BE4BB71/10/78276251493
X-purgate-type: spam
X-purgate-size: 378

On 27/07/2026 11:27 am, Jan Beulich wrote:
> The earlier "x86/traps: use entry_ssp in fixup_exception_return()" left
> unnecessary scopes and hence unnecessarily deep indentation. While that
> was intentional (to improve readabilirty of the diff), rectify this now.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

