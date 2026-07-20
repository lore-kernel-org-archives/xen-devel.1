Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314AAC4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:19:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366617.1616551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloq6-0005gX-B5; Mon, 20 Jul 2026 14:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366617.1616551; Mon, 20 Jul 2026 14:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wloq6-0005gQ-8S; Mon, 20 Jul 2026 14:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1366617;
 Mon, 20 Jul 2026 14:19:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wloq5-0005gI-1v
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:19:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wloq4-006vRc-9r
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:19:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5e2e63-e002-0a2a0a5209dd-0a2a4503b84a-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:19:24 +0200
Received: from [52.101.193.46]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5e2e6a-fae8-0a2a45030019-3465c12e8f5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:19:24 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CY2PR03MB192490.namprd03.prod.outlook.com (2603:10b6:930:114::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:19:21 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 14:19:21 +0000
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
 b=aHsFHM72rN2/MPZD4zgSgZFHUrn9VDOReWwY1n5JwJJpDqtVD+kz8/W8Bld0Bl0U+8XKBe4GuV8cz1+RPT98Gf00xw0F8GleJOcEhIMqenjj6KEwSiroPQD0LicsH9iwjG5aLc8pchXET2Rast7YDusTm61wzkiW0jovEzxz8tLCoWb8n0Bx1b0S85W7oMZFlMY4zgp6ssMMJf09wNgEUNTZoBeBeg8Wl5qCZm/SZR5pTbt9CS5AR5og2bTzgnnd7ocbMKwFeO0hjYOMukR+Xv0fE+9U+GgMbn58oU9dlsvK4O5dmxOdWIjJsFjIzmsKGLpZgFhphhd9eJAhhBrDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfENnASAEPURJeNZVaMWUj1HrsAiqnu55Q3FMJw+6jI=;
 b=QYwevx1tXxwEQsazC1I81g1ZZEWQWWu4cDn7VAnkDZ8dTSo23pxsJ+CBVpet6/2gTS3siMa/xziKbnnsjs0VmAJ+0jdfd2GD1YKwbyMhCopIJoMhjnsCZC1YlheYvY1Cg0WvcuyqnnNgSUoqhy6F7Tr5o7bMsGHf4UL01JDaRBiGqZlHwvK08sYc3zYsb+q0Dmt5SZsLSmG1mx0KcRucwJnUt91v8vryTyarzHBWaFKqxoqgx45i+AFBtMRE3hLu2rpKLIx7TI3DnZ88Ra4acHTE325qN5CPMLiBAro41mBzT5/njObKG6N7RK5ip9qvMAXeh9e3kSromZ5ZLEwhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfENnASAEPURJeNZVaMWUj1HrsAiqnu55Q3FMJw+6jI=;
 b=G0eezDOArrPrqet3j3cG6Eq783YqoMFiu2f+QxTWxdr7vC2OfnpTgN8Tu+Fw3B3eNdznnp+DPNAPn10TDSHRJXcjSt9WVcut1oJx7zXdHonX6hFYmH1j2TqUkn+uaJqBJwCmQaX6GUQP6hDQEkKDu3E4nBTfuq0UWrHEvqB269U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2edd358b-f29a-4458-a8d1-30e81640986f@citrix.com>
Date: Mon, 20 Jul 2026 15:19:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86emul: prune an excess EVEX.Z check
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0c34b3d1-2567-4d08-811b-12f9d49f95d7@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0c34b3d1-2567-4d08-811b-12f9d49f95d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CY2PR03MB192490:EE_
X-MS-Office365-Filtering-Correlation-Id: df9531b1-a5ab-481a-5db8-08dee669e437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KtrmsMPQIgymp3OXIZ2kTiLwUHZey3wqykbM4ffvW4exQJf7mFxFwb4yUHyKiq0g63n4+ffunFn4ZfQIZ+UhKUGo5solv9MS8UHkkGyefa7OGlBYNJaOmh3OKi1i8c6EpATjDgK9dErC+Z4Wct0+Um+MCjr1iD7Y5sA2BK+TQqqK+MoZhm4p3IXb2fRLSQYXh0l2zVlyTI7b49iWVJ31B5JrlmVJ9tGNZH1l2inYaKN6+V3n+r+7s8kegFkAPDxJfFdNyaxDzcWUmsOXpO4YGB66JSzKYvo69CR8F5aWzhxIUcbOojWeDU76Kz5IEWCTi/gFVchdrJwx2po7KIv3+aqrG2Ml6rd4XA5h4reD5s5p1F+d9+YLGYAV01mw+HxCuBdxVe9aJzDDLlAjxYb/LrvpAmbDLSZvThE4nmzVdJ6+R+eHQdEfchZZTPmJcZVhVutjfSIDz/PMQg9kyjMbxKGIn5YrwRNJh7kCVAcM0pJhy/tVek1M/iaxFDSY4P+kH5rS4HICZLc9Kzt677QlIATE2r57KQ4HCT/FKeHEHFD55OIlthzjsR5jIjnW73E9SYZT3idBjamH1jZimM/E0eq5mwhIX0mdUSrSipnvtlLM46RZg8E/ghA9T9IhHfXynsGVH+SDJMyIhkDOhu0+WEUWHDv9X40YG/5Lhf96AdE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NndyNW01TlhZcE5KS0JTYjkyaDZod0Y4NCsrT3JlbWVpUmtvMkRINDRRdDVG?=
 =?utf-8?B?WkRQamxJWlZoYVhrVXkrVk4xaHpSZlpQNHF6ZUdBS1NlWXlNSEN1S3VZUXJ1?=
 =?utf-8?B?dTIwQkxBcTR3Wmt4aVo3UElTK0hxemRrMjNRMjcrVUQ3WGlQVzFDdERaY0VY?=
 =?utf-8?B?R25qb0o4VU1GbjJKTXRmS0VabzErUDdaQ3JCRU1jQjNJWnVKSEtJb1A2MzMr?=
 =?utf-8?B?ajVoOVVQd3BJcmVqa0VYZlpUZDRFQkNsTlFDWGxwWFdPK3Z2MkpLaTF6MUFW?=
 =?utf-8?B?S2d2Wm9PditIOGVIWmVjd2V2a1lWMEFacGVWSWZ2cVdFWXZTNUdKcGdNYUwz?=
 =?utf-8?B?a2tiTXJydmVvcjJ2YlVZUHNPNFhzMGdrZEZBWjhsSFZQLzhPSWFkNzA0cEVl?=
 =?utf-8?B?MjFOaHJnVlAyT0JqVWVJd0VyT1p5bVFLM2lHWTRQMk5DQ3lYMGJlRGVVc1lK?=
 =?utf-8?B?aVJ2Qk00T0RVeFNEenBCd2Yxb0swbGRtbmRKZ2hIS2N6WkQ0ekxTaUNzbHB4?=
 =?utf-8?B?QWhiRExBaGVDRGgrU2tsVVRlOGUxNmw3Zll0SFBnQjlBeUFrYzhqUVQxU1pL?=
 =?utf-8?B?MzVVYldqeTBBS1N5OXlXU0J2T3pZNXlnTHUwekl3b3BPZkp3Qk55V1VnZkt2?=
 =?utf-8?B?dXFLV3hWOEM3ZnQrcnh1c2JGUmw4dkczYnRXdjMyS05vc0dLMFZIK3JjVllD?=
 =?utf-8?B?YUphS0RNdkhoVVh2YTRYY1JMbzhmcFF0VDJLN3Y5TmRjOTlZKzcrSWdSY2pm?=
 =?utf-8?B?UFRJVmdPUXdSVmpYYnlRUEZ2eCtIRG94U1JzVkNqZ1UwWXZ2RWhjR3J3NnZF?=
 =?utf-8?B?UWVYZnNCeGdGL2F1ZmY4RDF3SU8rNFRxcFloNlpBak0xWkVhL3hiZFZsWXEw?=
 =?utf-8?B?SVdDN3VHWHlRVGo5bUVrNTJCU0FRTVhhVGwxbFk5TnpSNjRBZC9rZzlDbWZH?=
 =?utf-8?B?Q3B1eGViWmczQk40SU1oZEcwTGQrVWdJNlRLNGRrenVLOGEzY0dMcmtYZWdN?=
 =?utf-8?B?QmFvaHNtek1Wc3VuQXZHMWhCNHNrSEVzSDN0d0lkMlA5blRhSTZtVGpRRm9P?=
 =?utf-8?B?T0twdkt3WXF0NWxNYWpWUlNwOFpiSVJWOHl5cHJ5ZUVhVzFKcUtiaDlvOGZs?=
 =?utf-8?B?Y2xNUmJlZ3Fvb2w4aG54Q2hGS1VzSnNnWngwa0N3Z0lYMmZlRjdMVm43K1h6?=
 =?utf-8?B?S1lBZ2swOVBnV0RzNGIxS0o3b1RPM3Z3ZkR4R2M1djlCcVJkcnlwcFFMNXlm?=
 =?utf-8?B?UDB0dGlJTE1nUVF4QndBWGZHMkU2VzA3ZitBY3YyRWRqN3Vocmp5SksySTlt?=
 =?utf-8?B?YWVyRm5ONFZ5U1liVThEM09JQmIrUDVZbDA5a3IvaHJEMFF5cTU1NFdYMHpa?=
 =?utf-8?B?YUc2S1pFd3drS1gvL3ZBRFFSMXN6bGdSSXZqU0szOXZWdmtVcFNvTG1SUkNk?=
 =?utf-8?B?dUpzbzZzMXM2QVI1c0l3M1U0anNONnp2elVrQlBndXZrR2xjcGdjUVV6ek02?=
 =?utf-8?B?QTVSM3R0SXBpVHFyTWRvUXZTS0pkRGdYN0txNFJnTWtwMXhvei8vZTVMVnBP?=
 =?utf-8?B?NGlXVGQ2dmF0TXYvbElXMnFDOWtUZDZURHFucG1FZGovS080ZnRWb0lGZ0ZC?=
 =?utf-8?B?YVhFRmpSaiswMndLSGlheks3ZWl0RE9Nc2xmR25LOG1ZcnFpQjZMTU5WS0dO?=
 =?utf-8?B?TDZENU9qaGx4M3h6SkpaV2JpWElTQncyeGI1bGd4MFBTaVRsUVpUaU44ZFVV?=
 =?utf-8?B?Q2pPMTcxcTZ4clIzWndUekJZQ25nQzR5TzhiUWpkQVFYWlF0SG9tbjM4QkdY?=
 =?utf-8?B?TjFiSVlNM1AyeHlvZjdaNi80cDdzUnozTGJ4OE5ibXNSMzB6UHpGRXZKa1R2?=
 =?utf-8?B?U3IxR2M1a0FaWW1TZHJ0MlZaa2pqc29HRlN6MkQ3THJwY3g3aVlobUtEb2xZ?=
 =?utf-8?B?R1YveS9LNXg0QTdvVHp5OGl0Y1hGNEl2aDIzYjIxMDJwRXNnd1I2eHl5YmhP?=
 =?utf-8?B?S1RQdzhsc1JrVHQvdmxyd1BHK29pbG8xT1BRdzNDTVFYS01DOU9rUGR4S1Vj?=
 =?utf-8?B?UUMyVFNuTElubkhhRFZYZXN6eS9RMURvSFNRb01mT293ZXFrNS9HTlplNnUy?=
 =?utf-8?B?am1GTFN0clZxQmhVSEZzbmxUeDdOQ1pyQ05DSXdObE5SME1NYkR4cHNZalZj?=
 =?utf-8?B?M1IwMlFHK25vQW5lbndyaGdGNzlKblVEVGZqM2pGM09DZUgzbmluOTVnTlVE?=
 =?utf-8?B?aGRJeHVqVG9hc3N3eUpyUlQ0ZWxzRURJRFAvUU9kSnNlMnlkbkthUFpPMFhl?=
 =?utf-8?B?VlMzQTJXUW9rUEJOaU5LZTJiOEhleGkwZHR4M0RZRjR5NVY4eUNCdmh6VUFo?=
 =?utf-8?Q?8ct63bZIH6eR0Qj8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9531b1-a5ab-481a-5db8-08dee669e437
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:19:20.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8oDbH/VcuiQjl8fED/34hbWU07lMZ8g0AMReXLp8WdTy20ymNPAYUDsooqW4rX7H2dhweXjZAMJzhJ+B2UJdzH5cQpSNSlFVbRXM263/FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR03MB192490
X-purgate-ID: tlsNG-33051d/1784557164-6E0D14E9-17543828/0/0
X-purgate-type: clean
X-purgate-size: 436

On 17/07/2026 3:06 pm, Jan Beulich wrote:
> DstMem processing early in x86_emulate() raises #UD when EVEX.Z is set
> with a memory destination. Open-coded checks like this one are therefore
> dead / unreachable code, violating Misra rules.
>
> Fixes: 4037a62ef93e ("x86emul: support AVX512F floating-point conversion insns")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

