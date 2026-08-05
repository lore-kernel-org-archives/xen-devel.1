Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D77C55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 10:07:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383238.1626507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYWV-000111-7x; Wed, 05 Aug 2026 10:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383238.1626507; Wed, 05 Aug 2026 10:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrYWV-00010u-5R; Wed, 05 Aug 2026 10:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1383238;
 Wed, 05 Aug 2026 10:06:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrYWU-00010m-45
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:06:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrYWS-00EVwl-QM
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:06:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a730b31-5cb7-0a2a0a5109dd-0a2a4504c2d0-34
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:06:52 +0200
Received: from [52.101.53.26]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a730b3a-b57f-0a2a45040019-3465351a0a1b-4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:06:52 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5934.namprd03.prod.outlook.com (2603:10b6:a03:2d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 10:06:48 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 10:06:48 +0000
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
 b=rZpW0BROxTfHjzuJU4o1GkK8FP1LTcwLhbe0ORRr/6owjGw86iXsl0O+ZXE8ltdHeP2sqDFcAUKuQ7iY5Z0+zCwGG+In7ByXobsRlSljMiGOkaElnPND1Y4wlzKpAKLVd1EHWR8Qx/1xh+nXm8+o3jCJQutuWh3KLdZO1Fy3xpg8/kC7myyuw5FYGQegqvDWgkCAbUboGIDPYDuoYb5hSM7dSx0VoP5ZZ12lqjGmedVULivHNKnsi8J6h5pIMstzBdBVDzLcMGdrVCjJYoiYbAKH21hyGqe6Ok44jG+cItP6wMVOA/iYNWKV8NgMw92VW9b/w7heeis0JPFbQVwt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ngLbiuAqbM9UA+pFpFmc+uYb8kAOJKSP7HZondo4IE=;
 b=SU79PPMnLEXMkygTdWYzxWbjgfl/CDQP3uVRRtuAqd3Owt/mgEGonjilqlKqS+3VkNqCRMpw1MpVSuWapnU3W7WowEN7aKdLqC9YfdGivCyBB6hirYb4Uw1+x7flEtC7MppMIudRfqyZnwTGeQmY8hRsTIrEeNNqC6cFmXXrAukSxcByKfdwI3Og1o2c+k/lJrPktNVGqwyeviiAdGxre3evlCOuoba9pYPLoprI+VErp7WO0I9YOAtWFr/BeoKCWpPKnpVk+D+UfEiZwdxSW/C9cyiOZCUhKnYqxrFYtWMFvCqb4pRhBODX3qe/qCprzC2GPsQIaBr7cS1SQZPu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ngLbiuAqbM9UA+pFpFmc+uYb8kAOJKSP7HZondo4IE=;
 b=ptx8NVG/S7FsCtDsFQzBvrs4/3ZOFPSIs6yROOn/vX4LsQGTlu4WAdijuZZrmkt6fVoSQrI/VcQKQoF2WBCjFmK81zPajGTFS90QTXSAdRKtcJH2JM+ru6dNSpu2g1gHQivv79jAUMpF2YowToMcoPfLNWeJWMkcDcxpSVk2ZjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <59d0de8f-2d97-4f65-af16-876be20398fa@citrix.com>
Date: Wed, 5 Aug 2026 11:06:45 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org, George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH 5/5] vtd: Move intremap table to xenheap
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@vates.tech>
 <451978a5-7dfd-4b91-a241-eb13caf6d394@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <451978a5-7dfd-4b91-a241-eb13caf6d394@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 00404da1-281d-4aab-e806-08def2d9435d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NZDK67+P31eRWs/XL9YxnZy8QNfGQ97iYJ9YMjT1ybptJCdQP6QOr/8tuIAqWK8p5AwK8HoMBKMOZ7Ixz+2u4qkYcqjjpId8BSzHdO9e2/REON2EBykS8qM3Krcv7qH9TnkIRjpoqpsMYTftdc/g+xc/E3ILwuCdFx3Bh81OLEJvzRZOOu+fMUa9gj0Rsfifqi7Q+KCw5gsEfSGNyCh79okpCXWwl6PiHF4FQlIav0Juf9kmJzF+HTiaB5pUxhDyP79crRRchTj10UHpPhEQr+vO7xscNZboqUiEXIWDCuWJFHrQkYZKj00wJ1ELVT/6OsJi+UF8srfIvubu74/KSyPEwkqZkT02Q98PjTBHDpwQOJmeYtS4cjtgBy+4zgXwfNBOUsb9eS+2Fv4eC4c/PAdK2dVPo+j48MQuf5vXBAi0BkZNe16KujfeJqFgfW09VndVjLwD/4UnG6SCbSbeJ9i3ZAofNphMss70sQlixA4ofFq/Jwqy7epjztLm7W4Dg0/dPCks2UyObozjmvea1/a3+GtutD9Q8XFbqyksbcEyWmZUrdQxi+RPKBoxnj/PIDohEZi1DXutTAKQ51lD8I11ytHlQaHrlBdqk5pi2a3PQIN0KC9Pnkb05bCBJVRH5dgYdqySr134LGb/N/xwAg/nEC3trSwFdqe7PNLT0rY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpMa0FUU1VER05VOHk2aEpKUlVHQ2JqNjZ2cnA1Tk9TYm1Ob1JrT3NPN0lZ?=
 =?utf-8?B?Y0FDZ0FrQkpYRjZ4cmEwNWo1OEJySGMycWdWc3JBZnJxQlhYaXhFbk9TQlQ5?=
 =?utf-8?B?d3VlVk92Q0dxazV0clFTbXRSRDZXbmxmOTRnSWJvZVNETUJ6SnI0SER4UStm?=
 =?utf-8?B?c0pySkgvV2NhNkZjN3d1VkZVWGRqdjNsNkdrQzNWNkg0NlRzeGxyS1praUZL?=
 =?utf-8?B?SVl0Qkg5eWpSOG9RYVN2Y2VEekpzM09ldjZCdml1QWpBcDhrd29DL05jWkRQ?=
 =?utf-8?B?V01Kd1pTUFBQRHE3dVQ0bFpwWlJqUVBmSFFGS3EzUVQveDFsN3MzM2VCcWtR?=
 =?utf-8?B?QVBESnJuMHFrRFM2WmlKQmZXdmhTSHZEdHdqencrV25lZThpMXp4NGk0L0o4?=
 =?utf-8?B?cDB0b1VmU3prUWhCWmxIaGwyYitBaEdNdUs1dE92UEsxMnJxVmRmTEF0Zk93?=
 =?utf-8?B?WGY1VktzZzQ5NXVGUVdjTFhnZE9yTEZaYkU2TEdhajBlUElYSExibmFjSDg5?=
 =?utf-8?B?MmNFTU5EOFdQVis5ZHFYWTgzZE5sQS9UdmRHcE5VQnF5dHlUTG40UitkNjRY?=
 =?utf-8?B?TTQxZDlBOWN3dTdNM0hWM0RVV2FlNnJpbWZScFVNVzVrTjh6VzJPVGZ0R2Nz?=
 =?utf-8?B?WWlHWVMzelU5aWlSV0tzMWlVR0dDK1RaQ0ZDMFp1R3VUQ3gvd0d5NWtDa1RD?=
 =?utf-8?B?eEM4bThNZWlZUVk5b2loYVU2U1d3cmd1cHZtZ2ZNbk1sSnRNejlIWFhCNVdy?=
 =?utf-8?B?bGxmQjZ4VXhrdkNWQ0RadHdld3RqOVhmZlZubEwyQXNSUUtGSlBGak9Fbm9K?=
 =?utf-8?B?Vlp2VW05enBBQ0xCTy9VSVFmN01vQTAzNWVJOW8wNmU1SnBrSzlnVmljMzlC?=
 =?utf-8?B?WndhMndUUW55ckhnMmJrNnd3aTR3VnQ2eFZWNnJTckR6L2lEUFJNcWZNYVR5?=
 =?utf-8?B?amJjT2UzSWhVdlhwWlNJaWpJbW0vOEdTWnJIeTNsYW9vUlhySHZ4Q0FMQlRQ?=
 =?utf-8?B?SExxaVdSbkkxcHFsajdEc25ieFBXTkpsSHBiUndLT1pJUzRxRU9KRmJlZnNs?=
 =?utf-8?B?aFVUOEhabTE3V0hRSW02b3o0M0krT2dxc2ZrbVFNQkQvcEkxSElzZTA3ZWRa?=
 =?utf-8?B?d1Bld3ZCY1hxSlhqZi93VXE5YlVUNEFwL082NVEva0hwV1pUZkxmTkF2VEJz?=
 =?utf-8?B?SXZsWC9HeC9idHFFUVZGQU9qenVKUVlCdU5rdUV4RFo2UCtXZUFZWFl4T1RB?=
 =?utf-8?B?QzRjQ3pmaU8zSk5IQmRVYVNRQnhIK09CWXlSbUErdWs0UGxxUEd5TnVaaFgw?=
 =?utf-8?B?V3BPQkVtMC8vWHdRWjFNUXpaVTRmcnFYaWV4Nng3cStGMHZKNFlTSWtnYnRI?=
 =?utf-8?B?YzZ5WXFvVmFqWEs0WjZOSVdSSnJFbXhsLzlYbVpzZURHTUdJQVdXbGVJZ09Q?=
 =?utf-8?B?T09IVzFxdDBDc0xCeTV5djB0RnRJVGNrcGIzZ1NFWHlmUDZQV3hHazQ4Qjhy?=
 =?utf-8?B?QkR2enBqTnE2RHZiR1pyd2ZWNWRRUExYN3N0TGd1cG1qNy92emhMcXZ2TkhG?=
 =?utf-8?B?cEJJVFF0UXhDdnZ1bnZuUHJpWnBUVUFwSE5XTXRibG9zeWpGcWtwRnNOZ3Fv?=
 =?utf-8?B?V0lOWnJmSWRrdzg0M2ppeEJoR2NmZ09mNjMrNCt2bVBNUFBnV2NTcDUrV3oz?=
 =?utf-8?B?amhsc3A2WXl1cFdoR2pGVUd4cTk4a0F6N2tUTGh0Q0pHZWRxYnorVlMweHZ1?=
 =?utf-8?B?ZEZvNW5ZTmtMQlhoWjAxSTRhdThSZmNKZFk0TGZlMU8wc212azMvQm1pdE9r?=
 =?utf-8?B?UEx3clNiNmJLLzV3QlczeGJNRkVIdldBMUhnMDlYVWk3c0k5T0k3MWVadUVr?=
 =?utf-8?B?S1dnTDBlZ0V0SFVyK3dBV3drQ3FJUFV6YXdTcU1xZmJwUXYwVGpsYVl5MGpJ?=
 =?utf-8?B?RXFNazVWaGNqdzZHVnRSbis2bHZjU21oeVpxYjBuenFmeDE4TzhUSVlZY2NU?=
 =?utf-8?B?VkVlTGRRTlRkNlR2Si9lemRvOVRiZmZiM3grMzNZc3orNUFGNnNRNUdxOTZJ?=
 =?utf-8?B?ejEzN01WeDduYVZKZmkrTGQzYmRmMkRTb05wL3RoNEpSYjJHS2RKZElXYklI?=
 =?utf-8?B?bW5Ccks1MGZwckt6dndWbDBraXhPVDRYVGN4ZzB0enFBSWlqdWdLSzMxN0xV?=
 =?utf-8?B?alMzOURDUmdoeW04Mm1JMVorZStzaFNNWVFSYXU5TU5VSGVSR0d5TjBoNDd2?=
 =?utf-8?B?YWF3SVhRUi9rRDh6UWdCWVNrejlkK2w0c1ZGMnFHdnEwU1BWT09NLzV1S09E?=
 =?utf-8?B?TENScHZsTFk5aGx6cXY4c1Mzb1VBNGE1UmEwZ3pSU1VWOURaSjZyS2VEdGVU?=
 =?utf-8?Q?uGeaMyYmGgluv8lg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00404da1-281d-4aab-e806-08def2d9435d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:06:48.6855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xi/qAKsVZtzFpjbb9EwtP/JeNaykidKn+Na7v+39dYVrsa48NtHPtMWAc4MQgzPvWe9FUabqJezjEMOzKBORi27i1Zon4S3mcGK5gTOnIS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5934
X-purgate-ID: tlsNG-ebf023/1785924412-C3EC6B50-0B76682F/0/0
X-purgate-type: clean
X-purgate-size: 1432

On 05/08/2026 10:44 am, Jan Beulich wrote:
> On 29.07.2026 11:59, Teddy Astie wrote:
>> Interrupt remapping entries often needs to be accessed, and we're creating
>> pointers to it on demand, which brings a lot of complexity (e.g
>> GET_IREMAP_ENTRY() macro), move it to xenheap such that it's persistently
>> mapped and we won't have to worry about mapping and unmapping individual
>> intremap table pages.
> Afaic: No movement from domheap to xenheap except for _very_ good reasons.
> For the case here that is - maybe establish a permanent mapping using
> vmap(), but no change in where the memory is to come from. Whether such a
> permanent mapping is really worthwhile may also want supporting by numbers.
> You say "often", but you don't qualify / quantify this any further.

To expand on the "why" a bit more.

For systems with all RAM below the 4T boundary, domheap and xenheap are
equivalent.  We have 5T of directmap, but xenheap allocations have a
width restriction which is a power-of-2.

For systems with any RAM above the 4T boundary, you can't have xenheap
allocations be NUMA-local for all NUMA nodes.


As for "often", the IRTEs are modified every time a vCPU moves to a
different PCPU, because the target addresses need updating.  While it
probably doesn't matter much today, in the context of ASI it's something
which would want mapping permanently, rather than on-demand.

~Andrew

