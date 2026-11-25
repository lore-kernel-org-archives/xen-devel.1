Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA97606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=fyGfTF2/
Received: from list by lists.xenproject.org with outflank-mailman.1502568.1698593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWFbT-0004uw-4L; Wed, 25 Nov 2026 16:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502568.1698593; Wed, 25 Nov 2026 16:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWFbT-0004up-1h; Wed, 25 Nov 2026 16:12:15 +0000
Received: by outflank-mailman (input) for mailman id 1502568;
 Wed, 25 Nov 2026 16:12:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWFbR-0004uj-E8
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 16:12:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWFbQ-00DmBT-QW
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 17:12:12 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0708d1-2eae-0a2a0a5409dd-0a2a4509a62a-18
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 17:12:12 +0100
Received: from [52.101.201.59]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b0708db-be1a-0a2a45090019-3465c93b7278-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 17:12:12 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB989236.namprd03.prod.outlook.com (2603:10b6:8:397::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 16:12:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 16:12:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VucZneTL53ILX20QB92G/CQxCht28MdA46eOGIi4j9SOjL8IQcXou4ecgx2OAQlaibZdxq2NTR7Ml752Yf4vG8LiayW6d+c7hEFAGlDjT5qI30WoLyv/0Y7MhDbueDdUEjrTLHsadj/zmafmwJPhwz4gp3llNAUEiNnuYvIp/No+dH1XLfaBxC8KqVdN6i1TlM5Vg1kfeCgNjqre7vSehIyk0+f9UlG4U5h4Uw9MoxYVHsCNIXglG46o2GT3GvuTTjYbDXo7jCvubaEkMOEqhVLJnOWOLxzaVTJ5/94p9Ms2oy5kc5NFVnu0oDycLqEtacQ/Woz+ag2yPyV2H+tX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxiRqGcP71sS0nraMc+qREbx0Ou57I8rqEFW/j1ogEo=;
 b=lU9ngloFkHNb6sEQ21x9NIF7b0nOS3QhSfEYOPEnd9iH3iPmirXLotGcCUPGPhI9DWZ7JY4fWI9Qcluj3HtacLADadRW7S9Sie+G6/mBV1Ysw01eIuNtnlF05yxvrvOq6RjitQSApQD6sMSjMOG5iyER0jDyxZka71jvzhIvQrJ62OkJtqFWj95DQavktOjP1mQu78gtArSvWKU4qV94fR0R68om5Xc6p2NwUL1UKIyEaNbjmkHwln2u/trXyS0/8LXBBCQCi6TySmLNtcOdETKz0q9laLLCJo30uw3IgqOFf3qsNlcURPNMOTW1eSlNRX+P+f1mvot659zhSJkfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxiRqGcP71sS0nraMc+qREbx0Ou57I8rqEFW/j1ogEo=;
 b=fyGfTF2/3/QBJWEF0bfTEFVKV/12DZUha+JyvF1tLjcZ7/gF8dShqmJkm+7mUYNF7AvN5mHxAT4wTD9xUY8HLx1uEaARnjoZ9giYj/P+4HaVdXHWFPxuaOBWf401zRXVeK49bCUWWBW3jX110Uyp6zq/jboaIZuzrgVB31jtDCo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5696f82e-d33d-4f31-a30b-3d2008534e1a@citrix.com>
Date: Wed, 25 Nov 2026 16:12:05 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v5 2/3] common: introduce brk_end
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
 <0862b74c-181f-444c-889c-164547819baf@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0862b74c-181f-444c-889c-164547819baf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB989236:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb72b75-42ac-4e9e-fd6f-08df4b0edb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|261022115727099003|56012099006|4143699003|261022075727099003|261021121427099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rsyBhqeKtv19Ny67wDsjfM4zDnIvMXcm0xZkdgO6UxZGJlnR27UGKPEUw0VpTIYrF+g8R4O1fD4nfQcxdx6rVP1OhLdlhSI0jzMcU15E+Yx6mqOBhwyPj75ZILMKvjScdh37evOV16Bkce2i1+xd92JepVbm48SM1sRhn80YWaxTP1vQhY6GDdIoXlwm9EuM9Vbo2f64wE94T66hvRgkwguyyRf2ybzBHnsfTisiAFqkKz3Mr1r3ijKlm3ZPZz2rCVikn60Ywm+oB3aI0/H1qOzI/Sx1hwSswm4WyQf9eqzYiZhxGjo2hRuVFou6unVs4BMfdhxVW2DerQewp0v1wSJ6ionEDqGbqxDQm0uQY9xnEBFKcG0zr1UvSoOYzEmALw6rkRZLSkCJmSb+70Yc9TzDorX1PSn5ZMqUgUaqH8op+TAb+fq0AD+okovUJx/N+0YR3On/cBxS2uHPON9fOmkqIqAgCBJiPgx+FfgEnD6thiKgLM94KqbcXEG4Saxp9HtRUw3+WSWHdj41b8BRxrvhhtPEBj0w4g3Jniwih75Br32TtopktVlYrGoOiWxxdvutMYz+jGNz2bYxl5zjC7rySIWaU1qrcdlpQ6Wgf+E8QyQB6pQ1dv/q8p5/Dpzlnw/8/BepQuV4IZ31SBB/FR+t2yzUOB4wS8iA8BSe02g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(261022115727099003)(56012099006)(4143699003)(261022075727099003)(261021121427099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxIeTl4dUNrbEwydnpmTksvSGZaRm5SS3ExT1g1VDBXUzJjVXZkUngzRTFw?=
 =?utf-8?B?OWtHbDl5bTNvaWFKclFMQ3pPVWh3V2F3eWp4NVo1VzhKdlVlRTNCQnJzRkE4?=
 =?utf-8?B?QzFUbXJtNHlCblFlOFVIK1p0VVVEUVhSbE8yVzhTcU45aUdOY1d5cEU5cHBh?=
 =?utf-8?B?L0ZGTkxCcWhCRGQxTXBqV3VpUXF4T3BHeGxUN0duNWl1cDZ4Sjk1VVhXdkdX?=
 =?utf-8?B?OXpjbEtsRWFld3A4ejVLMURXV0xsWmRIL3MxT280RWkvSDZRbXFjL053bW1o?=
 =?utf-8?B?ZjR2S1hFUFVES2Z0bE5HbUkvMGFvSDlaTHppeUFPUU5zd1E5WWZ2VENTZEls?=
 =?utf-8?B?aW05UHNjSDVzdGRSYzFFUVdrZlV0dTVOWU16WStmNDJEK2s2dXZFK3BnU0M0?=
 =?utf-8?B?akZsU0YwUkR6WXpUV2l0WlR3M1Z2ZmdSSkRqRW5nNlV3cUNoOEZ0aG52TjVM?=
 =?utf-8?B?MWx6MmlTZjNCeWpvcWJaLy9ETkZqUUVDN0hNS3pTTVB2enpXdnJIcm81bUpG?=
 =?utf-8?B?SUZkNU1oWHMydWE5VUVZTDZDczR6ZTgzYzRETHQrUlAwcFY0cTRmYVppQlhl?=
 =?utf-8?B?MXBhazgxWEZ4YjliS20zTmJwWEx5alFNdkNsbnBZRXhreGlJK2tSa0RSNmJ2?=
 =?utf-8?B?a0JEZTZzUEpwT0x4WEFPZmtXcitQZXV3d2NkTm00cTE2QUtpRm83QU1vUEFP?=
 =?utf-8?B?Q3ZIUll1OGg3ckxKanpzY2Z2cWxCYVd6TXlnZXZmRHNYR1h4aGlFNDQ5SUNh?=
 =?utf-8?B?YnhYQ1VzYzRzV01Ja3d5Z2ExREpQUDNyUEFsTWljZDFvMmpaV0dTNmhQUms1?=
 =?utf-8?B?L1l5a0JYamFHeTBBNGQ2eDhacFhkbHZOeWFPbWxJTC9YQjhiTUlITzR3U21k?=
 =?utf-8?B?WU1INUJacUNvWFFUV3BEMTlJdTJoRm5UL3VyZVRnbXZ1ekZJRThYYUdBNWtj?=
 =?utf-8?B?bWFmSStPMnpTenhvUDQrNm1tZUh4cnhndnFXSEt3OWxCVDJ2YThJeEpQN0g2?=
 =?utf-8?B?ZGlmUjdkNTlQbTF6TUZzZEUzbkoydDJOdU1wR0lMWThueEFMQUQ5M2tyTVU3?=
 =?utf-8?B?Zm5uM0VJUG1IOGcwQVpIMElSdlhtY2xGcnNpaUNTczJXb1hjU011M3hpYWNM?=
 =?utf-8?B?MnVrWFhKNk4ydlZ3cWpEdDFEekIwU2ZVSUhaNXV5SFNMUll0RmRVQlBLZWQx?=
 =?utf-8?B?cVJ6UXpvWUFiajZ1ZDZsSFdKdGhwb3RkU1BHTHZkZW45VWFqRms5aXloTVZG?=
 =?utf-8?B?UDh1bjZIRThJY1ZPZ1JDTVV6c3o3anR0bFV2azgreFhsMnhzTmJmcXl1eHJZ?=
 =?utf-8?B?RlRxcDFiYVptU3BrWE5hVDJCU3BhRkw4VW5QVy9xeEhQWmE5MVBYU0tCQW5Z?=
 =?utf-8?B?V1hoQVYrSElmcWh5WDk0Vy9nbWtVam9OK0hWWnUxY011ZzJZejFsMW8vVkhB?=
 =?utf-8?B?c1NnaXJsMExudU1HMnZKUEZVY1ZDd085Mk1GSGNPaHpSS1dPVk1DQ2JybEQv?=
 =?utf-8?B?L3gvQ21VRXJPQVkyQ0sxb1RJb21LZUhLRE5McGxGc0JNNUxCMm5xRFovWWVC?=
 =?utf-8?B?dUhXUnRsS3crdlNMQjhlTEJycTlzaFRKalBNWVlRY2w4K0l2L3pqNEVtYkxC?=
 =?utf-8?B?VCtTL3FRQlZYem5vdTh4anJOT05MZVBRQ01LSlZWTldXV042V1ZMV3hYUjZN?=
 =?utf-8?B?Ync5N2U2bVo0R21NTEZvOE1NNUI2WUNKaG1xcGMxbFVHb0l1S0xtRVVsMU10?=
 =?utf-8?B?SHdYTExvYW9oemJGM1R3NFZvRk9nQW1oRjVNQVdXZ0JGSEphTDdDbkZTVGRl?=
 =?utf-8?B?d0wrTEI2bVBBMEZkTkJiRTltMzM1OHFlS08vK1JGT29oVnNaczQvREl4bzVa?=
 =?utf-8?B?NzdYOVl4SEsweEZmOUhmNWlpK203THp0UG5UTGtFL255ekdXUGk3OGl0Y09j?=
 =?utf-8?B?ZnlQKzRCbVM1ODdSTVRyTjVnOU0wb0FpTEprUVRPL2lOMUZEOXh2MWxGekpo?=
 =?utf-8?B?MzV5aXdRZlAzZVBTQ0RwR0FLSkRlWUUydTJLYmdvK3pGRWJLUktzOEwwQk56?=
 =?utf-8?B?V1ZFY3A5K3p1b2dxMkpQOUR4ZnJDc0lFVGljcytaakFHSVpwTmxydysvL2Ey?=
 =?utf-8?B?MVZZdm9wSUFFa0VZV2JpZjV3OTdIWk04ZkFYaHQycG5GVUhzdTlLWEV0c3BG?=
 =?utf-8?B?bkpJdE11VW5mN3U5a2JTZjBKUy84KzFGeU55TFV3SmUwcDB4U2p1ZTBGM3BF?=
 =?utf-8?B?bWcvbjBFSmtFWTNaQk5vVTl4RXp0TVhnYytnRjVKRkRPbEcrc09pczJyUURF?=
 =?utf-8?B?R1IyaFpPR2t0cEJZWW1sVmU0M1A1ZzBXNFJ1ZiswR2Y1enIzVHR3R2xhV09J?=
 =?utf-8?Q?JcVV6VAUctX62VZE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb72b75-42ac-4e9e-fd6f-08df4b0edb1e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 16:12:08.9317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0hzIfQjsEx4nqHKGarIq8izEUxaHzGFHLsq6tvUM4Y9+iDVeuZus1ILFGUyLmHWrt7fpHDJLrxxpHzqYs4lYiz5XFVmmOiwZ80egTbTVQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989236
X-purgate-ID: tlsNG-bad1c0/1795623132-3BCD7034-01757E54/10/78276251493
X-purgate-type: spam
X-purgate-size: 2149
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 2:36 pm, Jan Beulich wrote:
> It is anticipated that all architectures meaning to use the BRK allocator
> will have a need for this variable. With this there's then also no need
> for brk_cease() to have a return value; it simply sets the variable.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Looks like "finished" could then be dropped.

Yeah.  Probably best to fold into this patch.

> ---
> v5: New.
>
> --- a/xen/common/brk.c
> +++ b/xen/common/brk.c
> @@ -18,6 +18,8 @@ static inline unsigned long brk_adjust_s
>  extern char __brk_start[];
>  extern const char __bss_end[];
>  
> +unsigned long __ro_after_init brk_end;
> +
>  static unsigned long __initdata allocated;
>  static bool __initdata finished;
>  
> @@ -52,20 +54,22 @@ void *__init brk_alloc(size_t size)
>      return ptr;
>  }
>  
> -unsigned long __init brk_cease(void)
> +void __init brk_cease(void)
>  {
>      finished = true;
>  
>      allocated = ROUNDUP(allocated, PAGE_SIZE);
>  
> -    return (unsigned long)__brk_start + allocated;
> +    brk_end = (unsigned long)__brk_start + allocated;
>  }
>  
>  void __init brk_free_unused(void)
>  {
> -    unsigned long start = brk_cease(), end = (unsigned long)__bss_end;
> +    unsigned long start, end = (unsigned long)__bss_end;
> +
> +    brk_cease();
>  
> -    start = brk_adjust_start(start);
> +    start = brk_adjust_start(brk_end);
>  
>      if ( start >= end )
>          return;
> --- a/xen/include/xen/brk.h
> +++ b/xen/include/xen/brk.h
> @@ -24,8 +24,10 @@
>      static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
>          __used var ## _brk_[size]
>  

/* Set by brk_cease(), and becomes a permanent extension to the Xen
image. */

or words to this effect.

~Andrew

> +extern unsigned long brk_end;
> +
>  void *brk_alloc(size_t size);
> -unsigned long brk_cease(void);
> +void brk_cease(void);
>  void brk_free_unused(void);
>  
>  #endif /* XEN_BRK_H */
>


