Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F4E606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 24 Oct 2026 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=oXFIs/8C
Received: from list by lists.xenproject.org with outflank-mailman.1460074.1671540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcVf-0005bA-2j; Sat, 24 Oct 2026 14:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460074.1671540; Sat, 24 Oct 2026 14:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKcVe-0005b3-WD; Sat, 24 Oct 2026 14:14:11 +0000
Received: by outflank-mailman (input) for mailman id 1460074;
 Sat, 24 Oct 2026 14:14:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1xKcVd-0005ax-Sh
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 14:14:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKcVd-00CpPD-9e
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2026 16:14:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcbd24-e002-0a2a0a5209dd-0a2a45099204-8
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:14:09 +0200
Received: from [52.101.193.22]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6adcbd2f-be1a-0a2a45090019-3465c1165ccb-3
 for <xen-devel@lists.xenproject.org>; Sat, 24 Oct 2026 16:14:08 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by CH5PR03MB7888.namprd03.prod.outlook.com (2603:10b6:610:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Sat, 24 Oct
 2026 14:14:05 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0546.021; Sat, 24 Oct 2026
 14:14:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXvkzzTgiP+PIJ/hqNMVRNo0U+o/K6E20eB62hd+/OKs4HJj61K1sAob6FHjhwNQyTZk12PSQaNiAbqOZAw+35iiVFTQ80Nu6xyq8M71p6ZdAU3FrEb/FqCJZez692+r0q3KFLR5QaF9Rg5xFOR7HLgR5K+PWfYKG1VzzEfwY+QHKBU9LWe+iNwJiV90xFbDoq6ftUN3aumjmZQB52Qh7CzD6ZTA/pFwolO+6a6FJo5nnIkycLDRgN+2vmXOcSmGPoraXxq3AOOGOkQsxjzI5oaelxN4LlXUZbrfwuLsy3npr2hMEKInXgEV2LxZDa1zcozhRi8nlIbQuy6jFEjc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGktxpiLJd+By9hMcQEkWdxSfmT0yiUXOtnLuesASFM=;
 b=avsfWq115dyHTK4nSCnmlDCnovZmHdGPa8+CWGBHsVLWc5HrXVJehkAL3j0XvXFoT6Mg7lkKSvpxJcuvHbi7GZFFQ+/0FaUj+xTKECCXpT2i9g1KDPetxqzWLScY+fIHyXYZOTS0t3agpZj3GxgS8ZYI3MccPF7TSrktaAgkijYwVPJ23OI+1KkZ6USEKzzm52Sm9Bg9IyXr/0ZAYSvA997DMylTguvwgFAC82reasI7Lueml93p7oV651bIFTtw+3MXIPqa4hoRNf9hMqg6sDgmrvD4aqo68kisgajoftK2KDmwzxt/Aqq2M1R2iawEceUKTH2wh1XcilJn7TT2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGktxpiLJd+By9hMcQEkWdxSfmT0yiUXOtnLuesASFM=;
 b=oXFIs/8CO02S9tY191R9xRbc1uypo2Hkug7wYhNP3wV53qaB7rURSV9GSgKmrqP0+yr9bOynG4elb/8rwsLqdmNvf/SIODJeF4Wd/y8zRUOYS5G7S4kS5KDAy+OaBkK07P5rAZC/EvAIjAaktEiR7DAAWG0Nzwgar65WxnTDa3I=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC 3/5] xen/tracing: prepare a livepatch payload and its
 controling interface
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Ryo Takakura <takakura@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, 
 roger@xenproject.org, ross.lagerwall@citrix.com, jgross@suse.com
In-Reply-To: <20261023045543.164658-1-takakura@valinux.co.jp>
References: <20261023044809.162759-1-takakura@valinux.co.jp>
 <20261023045543.164658-1-takakura@valinux.co.jp>
Date: Sat, 24 Oct 2026 16:13:58 +0200
Message-Id: <179285123800.1706038.4978498781229199186.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792851239; l=8586;
 i=bernhard.kaindl@citrix.com; s=20261024; h=from:subject:message-id;
 bh=TI0wo2frgW/d7qpZB28q/IUgZL2lkOPX8H2yk99frYI=;
 b=AzkqG+bEXeyBiI6Yq9SPfz8khXQxJAHI1IZB8bq449dLMvj4VbtmPcWvpoNnONPMlKFqFCoik
 1DMj3HUeInlBG4x5M5jt/KZ68qXHQArtjRbLE9dwWwckoulUpj26CFC
X-Developer-Key: i=bernhard.kaindl@citrix.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=
X-ClientProxiedBy: VIZP296CA0024.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::12) To LV3PR03MB7707.namprd03.prod.outlook.com
 (2603:10b6:408:28b::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7707:EE_|CH5PR03MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae1dec5-9629-4b5d-323d-08df31d90fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|18002099003|22082099003|6133799003|10067099003|3023799007|56012099006|11063799006|4143699003|261022115727099003|261009223027099003|261022105027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	+JW5eO2HdrfhIO/T25AO9X6FLoN33WjT7jQR2Iga+sU2RClzmAqAaQFJBSs90OlOc7Xp9MIcZqa18ckV//b0UDAbLDTVYDeuU7HGZZwW+zwo/bGiROUm2Rl/Ji3Tw07ATjWVu/CQz3ZGKsQWSPMMmp9Zdkn4Zl0rMOhuQM0q9YbgXvM5GIDm90MMY3q1dYUEUdKlf9U2ud7XYclGtQt0n6d+dzSdiqV9zryCY1uWyxDHoAZNVsCUSJLFYR1LDLJ+o6KsScBTd5XNW24tUqMx/SRotcILqkBJis4Ug2Jk+Xv5oyTd76wzss3nquTSXceDBPUzWEVgr9r9XLdwQhmTflo7ubH3IIrIkLobgTskL61kmhQcIYBMH6SUHnOMi1eU4iy99ivRDrzEwhkIHFw77XYxWq0C+wSt6LnwuL833FTRu5sLSJpRHDn6S/oCq4dfBFck1rSFuj6aK0dlNy4oUxVo9ypn8GYo7+sYsyjXAXVyCntN0Wg9jbvlyMPal7P7bhqy9cRgXRvSxcMod/ffV05ft17s25EXgLCDnUgEKuB0wFBbdznuVDc8havSb5XA/eEdI20ebEQgfFCRppQ24kyUkuWRc8yQA95dNmjQWLaI1U1kdQGghMT1jtMDJJnpwtj4OI64E05HMEcaBP0ibf3RX0bzeVIgwjOBP/dEbv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(4143699003)(261022115727099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHZrTWFTMFd4czVYWEh6Q2FyNU5PSENzVnkxelk3bzIzQSsrRDRVVTJoYWdO?=
 =?utf-8?B?b0VxcVR6UzZXOUpGZUR4WnRKdkNXYzcraDlnbW95TUhNM1dkbStTVTVxRnBW?=
 =?utf-8?B?QUVtNVdMd1ZZazNlTWZJWXQ4bmVubkd3ZmoxN21zVXBxMHBjMjdMaXdkTGxm?=
 =?utf-8?B?RThtZ2RrUHhaZmJtWUlCejB4VVVVVkpVeGlhdUJ1VEUvYlB4MWwzWkJPWHls?=
 =?utf-8?B?NTBlaFV5R3ZJbjZ1WTZtSkl6bUk5SHd0WTFCSTJCL01xaHhUcDZEU3pxajBU?=
 =?utf-8?B?NkV6QlFrK1JNL21RWFZWWWczVVJUa1Y4aVpjREpWb3NCc1dxQzVoNUl4TFRv?=
 =?utf-8?B?cm82ZHhRZk54UmVNZFRhbnNoM3lqWXk5RmFiM0QydjRqVTcySVgzTThNS0l1?=
 =?utf-8?B?dHRaK2c1TTJpcjZFNTBWNFd5OFd5TGljcXdQQXRUdUZ0ODBKOCtPeUZvRWxG?=
 =?utf-8?B?K0lYSnpZcDh3NTd5ODdldHA5UGZqVWRuampaRm9wRFZtd2JWNXcyT2Y4Q2hX?=
 =?utf-8?B?MVhTRkFLTytFdW81L2xWeHNpRGFaSEpYdkgwNXdxc1dsd0VvN0g4Z293enk3?=
 =?utf-8?B?cWs4RGxHZDdHWWF5MVRUa2o1VzdvK3BVVThHUGJGcElwandPdnhBNmE0RG1U?=
 =?utf-8?B?L3N4cjV0eFV1bGh1ZFN0MFJtTCtTUGxpVndzT3B3RjRuemtzZVo1Uy9YREd1?=
 =?utf-8?B?RWVKOGNsb1AvbStXdjdYVXlIeE1wbytscWhBU3h1TmZGVUR0RG1qSFk1dXd6?=
 =?utf-8?B?T0JuS3VibkRvSU83cFd2K1VuRkM4MUtxbUgxWDhteHByK013cFN0M1Rrb21R?=
 =?utf-8?B?QkYvUnkzN3R3c1pTN1Fja0RpUUJUbXdFcmRPZzMzTUdMQVNIZFNuc0xyWkZq?=
 =?utf-8?B?Zis1QUxkTXhGSlBRK3NHNXdscjlMQS9ldTFnR0w3elZ5dUlDaE91VklMeFpJ?=
 =?utf-8?B?ejdVTk05UWhaL29RSlNrZjRNMktpanl3clo3UGU1SXVFb0pQZDNocGNSd3pO?=
 =?utf-8?B?TjJES2RodGtqVGFMV210OWhyOWlTOWlnV0pNb2g5cDNSMGUzRk9TV05OTGlO?=
 =?utf-8?B?YWd4RWVYTmVYMEFxSnd0eGxYanE4SFZMR0k1VnRmNEEwaEZzUGU5d0JzWTVs?=
 =?utf-8?B?Y3l4ZDRFd09vTW5QUjhIMUNPWjhHSkVNN24xc1ZOaTBwRVY4ZC91QjJBd3No?=
 =?utf-8?B?RWFPLzRIblVmeldEZERFbTR4U3Q1Zkt5OWVxaGtOWlVYRGVUUm45ZnVOUTlh?=
 =?utf-8?B?eENaT2ZrNC9Lb0p6VVcxK21qcmVWWkFwdVIzQ3hPVlIxSXh3Z2VtQ29EQTFq?=
 =?utf-8?B?S2ZpVXB2SHJyQ0xLQ21yZVk1WnlSSWRQOTJtZkJyZzBHempsSnhBb3M4L2pV?=
 =?utf-8?B?YzAyVnQzcFhiUkVBcTNzZG9teWlKZ3E2SUJpbXVSVjBtV1BJNHZlemRzN1Uz?=
 =?utf-8?B?WG1uUFRlbi9JS082TEovN1Jpajg0ZU9yZVZDQ1BrbUJ2V0dLc3d6R1JHcVNs?=
 =?utf-8?B?N280RU1YSEJocCtWbEFZOTRwZUxZK29sQWZBNDRER2o3YmhjOXp6NmRYd05v?=
 =?utf-8?B?RExMRDlCeGVDYy8wZ1JGK2xCdHZsRWlNUnJONEpKRWRySElEcnlzQTJsd1N3?=
 =?utf-8?B?YU5KNjdpQmhPdzFCSmk2UFc3c2oyRU1nbndhcHM5Qmxyd041UG04L1JRZDI4?=
 =?utf-8?B?bWl0RTIrODZkOU5zajhpczkrWEhud2xDTjNqK09YVUMycit5Sk1UNTZuR01S?=
 =?utf-8?B?aE9HS1lNbFNIblpzdzBEQkc1OWIxOTRBZHFvK3BHdlhrbVFGZ2ZTU2luOExH?=
 =?utf-8?B?dkxwQTltai9hUi83N29qcVdxYllvR29HS0NHK3kvRy9GT01kdzlQMHdaSFE4?=
 =?utf-8?B?VC9ubVhoUk55NjM1a3I4L0Z6QWNieGdkeWY4K0dWejJrRmpjTzY4QmZkQ1Rz?=
 =?utf-8?B?VGNuOW9HZHN2T05MUFZ0WDNKOCtKelc4QktFOXlXWUZmSk9ycUx4cEJwSW9a?=
 =?utf-8?B?aEVva1pzbzBGempoZ2tDaTVQMGxZYnM4b3Y4WWthRFNweitoQUlxcSszVnVI?=
 =?utf-8?B?U0VXL01TdEI1aE1odjEzSGFXaTJLU2NMZ2xaNXJZNm83cU45RytheTk5K2Zh?=
 =?utf-8?B?cjhsWUd6VFVFa3JRRFdKdStzcHREOVZleGIxNHdLcXd2dkZ0UkJiNGFyQS9u?=
 =?utf-8?B?L09pOHFoaFpxSDl6cTB4em9lelNVUFN3VUplS0tvaXNVa2l5QUk0ekMxWXV3?=
 =?utf-8?B?Um4zbXc3N2RFT0s1cGNkQy9TOTBPdVV3MFdZQkVidUlMZWF0UmdjakJNY2lP?=
 =?utf-8?B?RTJSeklxeDhoaGg4VkRvZlhCQjdmM1M1bDE4OU9LOEhCa2Q4d1ZkVjM2dFVi?=
 =?utf-8?Q?tzqecWJVStIUZbXw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae1dec5-9629-4b5d-323d-08df31d90fa1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 14:14:05.1024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT2cUvCB1k08zdfNOMbRVHdsdN4RyrZHq8ELWnNS5hiAdlgZ3ZldHytRyNk8YI/YQF8GT+xEopP0TReqfQ5Fn283MnDY5dgydL73ypxCkPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7888
X-purgate-ID: tlsNG-bad1c0/1792851248-FD668034-06512BC5/0/0
X-purgate-type: clean
X-purgate-size: 8586
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryo,

Thanks for making the tracing controls available through HypFS. I'd like
to help review this part too, although I'm still getting familiar with
it and have used LLM assistance. I may have overlooked an existing
synchronization rule; could you help me check these cases?

> --- /dev/null
> +++ b/xen/common/hypfs_trace.c
> @@ -0,0 +1,741 @@
> +void trace_dispatch_callbacks(unsigned long ip, unsigned long parent_ip)
> +{
> +    livepatch_trace_func_t callback;
> +
> +    if ( !tracing_is_on() )
> +        return;
> +
> +    if ( !trace_callback_registered )
> +        return;
> +
> +    if ( !global_trace_func.old_addr )
> +        return;
> +
> +    if ( (unsigned long)global_trace_func.old_addr != ip )
> +        return;
> +
> +    callback = global_trace_func.new_addr;
> +    callback((unsigned long)global_trace_func.old_addr, parent_ip);
> +}

What synchronizes this reader with callback removal on another CPU?
The corresponding part of trace_unregister_callback() is:

> --- /dev/null
> +++ b/xen/common/hypfs_trace.c
> @@ -0,0 +1,741 @@
> +int trace_unregister_callback(void)
> +{
> +    int rc = 0;
> +
> +    spin_lock(&trace_callback_lock);
> [...]
> +    trace_callback_registered = false;
> +    global_trace_func.new_addr = NULL;
> +
> +out_unlock:
> +    spin_unlock(&trace_callback_lock);

Could CPU A pass the enabled and registered tests, then CPU B clear
new_addr, before CPU A loads and calls it? Would that permit a NULL
indirect call despite the writer's lock, since the reader does not
take that lock?

I wondered whether the existing payload RCU region might cover this,
but the new dispatch appears after its unlock:

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -232,6 +236,11 @@ xen_livepatch_trace_dispatcher(unsigned long ip, unsigned long parent_ip)
>  out:
>      rcu_read_unlock(&rcu_payload_lock);
> +
> +#ifdef CONFIG_LIVEPATCH_TRACER
> +    /* Call tracer callbacks. */
> +    trace_dispatch_callbacks(ip, parent_ip);
> +#endif

Would an ordered publication and reader-lifetime protocol help here,
including draining callbacks before unregister/reset completes? Could
it cover registration as well, where the registered flag is currently
set before the callback pointer? Merely checking the pointer for NULL
would not seem to protect callback state already being used elsewhere.

Separately, could a pending filter apply survive a successful clear?

> --- /dev/null
> +++ b/xen/common/hypfs_trace.c
> @@ -0,0 +1,741 @@
> +    /* Schedule removal of the current patch. */
> +    if ( global_trace_fstate.applied == LIVEPATCH_FUNC_APPLIED )
> [...]
> +    /* Clear the filter if no target function was requested. */
> +    if ( !ip )
> +    {
> +        /*
> +         * Keep global_trace_func.old_addr since livepatching
> +         * might be in flight. Only clear global_trace.filter_name
> +         * which will effectively update /tracing/set_function_filter.
> +         */
> +        global_trace.filter_name[0] = '\0';
> +        return 0;
> +    }

If I select a function and then clear the filter before the trace-on
worker runs, wouldn't applied still be LIVEPATCH_FUNC_NOT_APPLIED?
Could the clear therefore return success without canceling or removing
anything, followed by the queued worker installing the original target
while set_function_filter reports an empty filter?

Would it make sense to track pending work explicitly and either return
busy or arrange a safe cancellation/removal before accepting the clear?

There seems to be a related completion-status question at the end of
trace_set_filter():

> --- /dev/null
> +++ b/xen/common/hypfs_trace.c
> @@ -0,0 +1,741 @@
> +    rc = livepatch_schedule_trace_on(payload, global_trace.func, ip);
> +    if ( rc )
> +        return rc;
> +
> +    strlcpy(global_trace.filter_name, name, sizeof(global_trace.filter_name));

Am I missing a place where the controls consume payload->rc after the
worker finishes? The existing livepatch worker can fail during CPU
rendezvous or application after submission has succeeded. Could the
displayed name then describe a target that was never installed? The
removal path clears the name before completion, which seems to allow
the converse if removal fails.

Could requested and installed state be kept separate until completion,
with a way for the user to see the eventual result?

What is the intended contract for changing current_tracer while
tracing_on is still set?

> --- /dev/null
> +++ b/xen/common/hypfs_trace.c
> @@ -0,0 +1,741 @@
> +    if ( prev->reset )
> +    {
> +        rc = prev->reset(&global_trace);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    global_trace.current_trace = &nop_tracer;
> +
> +    if ( new->init )
> +    {
> +        rc = new->init(&global_trace);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    global_trace.current_trace = new;

Could a tracer change either be rejected while recording, or perform
a stop-and-drain transition before reset and initialization? For a
tracer using the optional start/stop hooks, wouldn't the present path
leave recording reported as enabled without stopping the old tracer
or starting the new one? What should tracing_on report if the new
initialization fails and nop remains selected?

One more target-validation question: what excludes discarded init
functions from filter selection after boot?

> --- /dev/null
> +++ b/xen/common/hypfs_trace.c
> @@ -0,0 +1,741 @@
> +    if ( len )
> +    {
> +        ip = symbols_lookup_by_name(name);
> +        if ( !ip || !is_patchable_function_entry(ip) )
> +            return -EINVAL;
> +    }

The new linker table appears to retain the compiler-generated entries
without filtering out init functions:

> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -61,6 +61,11 @@ SECTIONS
> +       . = ALIGN(8);
> +       __start_patchable_function_entries = .;
> +       KEEP(*(__patchable_function_entries))
> +       __stop_patchable_function_entries = .;

For reference, the existing symbol_valid() in xen/tools/symbols.c
retains symbols in init text too, and symbols_lookup_by_name() in
xen/common/symbols.c returns matching addresses without an active-text
check. Its non-FAST_SYMBOL_LOOKUP branch contains:

>         if ( !strcmp(name, symname) )
>             return addr;

Meanwhile free_init_memory() in xen/arch/arm/mmu/setup.c removes the
init mapping and returns those pages to the heap when appropriate:

>     rc = destroy_xen_mappings((unsigned long)__init_begin,
>                               (unsigned long)__init_end);
> [...]
>     if ( !using_static_heap )
>     {
>         init_domheap_pages(pa, pa + len);

Could an init function's name and compiler entry therefore still pass
this selection check after its code has been discarded? Since the Arm
patcher writes through an alias of the original image's physical pages,
could that write into memory which has already been reused?

Would checking active text before accepting the target address rule out
this case? To illustrate, I think this could be addressed with a small
change like:

--- a/xen/common/hypfs_trace.c
+++ b/xen/common/hypfs_trace.c
@@ -3,6 +3,7 @@
 #include <xen/init.h>
 #include <xen/hypfs.h>
 #include <xen/hypfs_trace.h>
+#include <xen/kernel.h>
 #include <xen/livepatch_payload.h>
 #include <xen/symbols.h>
 #include <xen/string.h>
@@ -266,7 +267,8 @@ static int trace_set_filter(const char *name)
     if ( len )
     {
         ip = symbols_lookup_by_name(name);
-        if ( !ip || !is_patchable_function_entry(ip) )
+        if ( !ip || !is_active_kernel_text(ip) ||
+             !is_patchable_function_entry(ip) )
             return -EINVAL;
     }
 

Would this reject discarded init text before either scheduling path,
using the same text-region safeguard as address-based symbols_lookup()?
This only checks whether the target is currently active text. It does
not validate reserved instruction bytes, reject overlapping livepatches,
or establish the lifetime of a dynamically removable target. The pending
operation and callback-lifetime questions above would still need their
own solution.

Thanks for looking through these questions. Is there a lifecycle,
completion, or target-lifetime guarantee elsewhere that I have missed?

cu, Bernhard

-- 
Bernhard Kaindl <bernhard.kaindl@citrix.com>

