Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FEDC5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 09:30:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390959.1631040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuoEt-0003Qb-Kx; Fri, 14 Aug 2026 09:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390959.1631040; Fri, 14 Aug 2026 09:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuoEt-0003QU-IF; Fri, 14 Aug 2026 09:30:11 +0000
Received: by outflank-mailman (input) for mailman id 1390959;
 Fri, 14 Aug 2026 09:30:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wuoEs-0003QO-2k
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 09:30:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuoEq-005gex-No
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 11:30:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7ee01e-e002-0a2a0a5209dd-0a2a450391be-8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 11:30:08 +0200
Received: from [52.101.193.53]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7ee01a-fae8-0a2a45030019-3465c135e55b-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 11:30:03 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PHXPR03MB989208.namprd03.prod.outlook.com (2603:10b6:510:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 09:29:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 09:29:59 +0000
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
 b=orqWp8BaFpIEZJ/R5oiCM2Iv5ivnLRQvbk5krN63uSD/n3AQGhq7Ixvemg7EU5mn7Xfk1WnO1OhIjy21g55l9CO3stDvf5eGlBY/w4LS0EPDzW562VPMO0idOq67KGV0R2XNTjNonPEZor2aJo0OFJdwv0b82y3JumtZErYCs0MI8zpUrUL7WSvVlrhIn7tVqN68rdYdH+I47HSnCRrlYwdMAm15CjCLQmSBdbuhS2qxCBAdH8Fw8V5klR7BQ/fawzvkJwhzVy+vVeqzjf+szyTwl031E0fk3DpWoOQWel7hziFSmhZJCYRhde1B5XgvZLRLbBygjd5ekHW0EQmAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPZ+wEMd7iQZnQWPYOwnXmHCthqDB4Vq6R1ntqFV5RE=;
 b=Cr0TtJI2oIUivXBL9hauEUK9t/hWEu/787DLNmkYgDBWGYW7IGcnSzhiKMFEWcxbMfEmWwYGXrSFKpV1soMUFzoBgB/gPfiUvOy602UoQvhL2RX00B1VwwmpjA1WvxMhxMDnY1Xa0X4b+e/uZEPf3BSnpc78Vby+1XqRpFelqEtIm3LbdVEn5+V4O/a6eepSjzFRGqKZM/XFHOKljiw/4cwcNkAF4nXod8s9/6xZ2RyeLZR4UabVvlPyUzspONTr1cdNIxTlxHWJTmgYYkBFbc1+kjwTiWC1iPDM9a3rDZEme9nBfN/mVIcTd3wF92bqxKxJ3UMp7EP9XnfJAQMi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPZ+wEMd7iQZnQWPYOwnXmHCthqDB4Vq6R1ntqFV5RE=;
 b=l9U3aAiOLFrfcZ2GgFbHfbMwpbReKaptqgLl3bNVcpHWf6cdoNxk0Ltm+tMLYXp3nXkhEM4eSqe8e9Kaiqn9yFXv/+U2739ujUkbK6sgK4mEQ9FIhBmWw4UY3hSN83nByjkdzVasPfbK/Ov0mfTpu05Q6IfJRAxuJ4XQklIYERg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <74777a38-125d-422a-9114-b147edca903d@citrix.com>
Date: Fri, 14 Aug 2026 10:29:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/nmi: Fix mis-classification of watchdog NMIs
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PHXPR03MB989208:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bbd75d7-4bb7-4421-1101-08def9e69c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o8KkCm7pdlUvoqS/4XYuoLhQnkdWy0C7BcsydqETvuJnaPgS9APLa7GWU4aKKcFX3pSyAHfdD/R3Pna6sjK6tmvX517AD8VjpRnZ0bJbFR5FTDAOIr/QK7bkyPl7Qmyk+pkX5R7P0srRXiOPjz6atGVpkDnoK/eDqgMFlKW3hsS7D8OTjoP26B9OgTEXcKMnLwhErSRNppw0iKC8+xR1dC6o/iFgft+QiKFk2ZCXY/oTtHKjlep2lgMzHruFX/5AhneMuyYs5U+igpLFHH0GN4IwqOmG8iAhF70Tov/ca2ophc9otIKZdichz9nHKCGtowCM8MiwZYjQijLDWfp+wXk0oZXUfX0avNnVIjVsyt/mqRCy/LQwwVStcWgIdH4Q/E2lKh0KjmsdHugg8si6XZE2w20vVySqdtfNtt4FeEJf4RofpQu7NNU0U6kJHb/TaLEp2J3YIq6iWqBA6EvBafJJUiPbHmaHKa2maToK81AF4qke6VypyN0nmqg10Cqv4Nv7h8wIPV8ZCip8kEIgcI5tvK7rVqLnx0Aqc+cU2xdQQV/Do6fcbuIfNh+HkPTcRuykLFk9HRECI4Rl4o7gHchWjsvP7w23mBxlmQnu0iaZGY9klybh7h4WCogXp07ouETtRY6w+7OEx8iA8EFVVJkUQXTgB5Zw2A6Io02yC20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDg1SE11cG5CQkVyK1JIUnMrWmFvUjV5dmtrV3Z2OXk2N3lWL0VJZzc2QU1X?=
 =?utf-8?B?ZWhLa0h5eERqWXRLeTVpZWZ1L1A5aGtrTkNCcEpzYlpaeWo3cjcwTStqRTRH?=
 =?utf-8?B?aUp6NUtPc2hUSndNMDBZTGpPRXdNdkdNTlRBUUpWRlNQWUtaTFloZTBZdGJv?=
 =?utf-8?B?WUxLSTFJakZRdWJ6Tyt2YkxHRlpqMEtqNU5qaFl3UnBvdWVjMWpVc1pLeERZ?=
 =?utf-8?B?M3Jvb2p4WFAvNUcra3Vwc1pjSnJrbmd0YXFtSnUwQytROWFLRTBVUTlkUFk3?=
 =?utf-8?B?VkNoSkZWYWdtaDI5dXF4SlVXUkpzR2RtTHh3SzdJemlKRDVNMklOMHd5emVN?=
 =?utf-8?B?a0RHYU5CUDlZMU9TRDgvRmJtQWJDMnJEb045cEN4UklJOGZHWGJZWDRnVFhD?=
 =?utf-8?B?cHZ5empDSjA3V2IvU285WmFBdjE0bXJRRmFPV2JESkZXMzRSa2RqR09rYkwv?=
 =?utf-8?B?Q3Z1emdMdjhFTXRCaWRXcnNZem5hcnpBMnJUTFNwUHo0UThMVGl4RDQ2S0Rw?=
 =?utf-8?B?T2xyeHU5aFMyMW54bFgrLzlWV29QU1hpaFZyS3FETXlXRzdYa2EzL093Ylhu?=
 =?utf-8?B?Wk1Fb3R1M1hXRWdqaWY0M0NsaGRYMU56M2Q5YTdSZkxpcXVRTHUwVjlRUndz?=
 =?utf-8?B?WmtrZkZadThYd1lVYmFRTWYrMk5lQ01XNjdJN2NlN3lnSVI4L2F5bUU2dGRL?=
 =?utf-8?B?dzY5ODA3d1NncW5mQnl1dkgwR29PNnZHb2xtTU13S3pibVZuYlpJTDdrT0M1?=
 =?utf-8?B?RU9UYUc2Lyt4U2VwSjV3NDZHSDduUk1DODlPNTBlME5PZU0ra3ByZGhOcFVS?=
 =?utf-8?B?NkZPTEl0d0NSbjBNNHZXOCs1eG10NncxS0Ria1V1Q2cwWDhKVkQzOFVjeGkv?=
 =?utf-8?B?NTdieDYxcXdsNTFWRjFoTkVTTHZpSE9od2JJRWJ6Wk5qbHJ5OGVyUlNHeW8w?=
 =?utf-8?B?cnJvM1YxbkxlUmtGOUhXMWdkWUljZ0EvbStpQnMyd3U3MzYxRUVuV3BLRlgz?=
 =?utf-8?B?eDRiSktRTWV5VmlrOXdhQjZTU1I1WktWR2g0SU1tcm4ybjBZYVU2ay9uL1dq?=
 =?utf-8?B?Y0NSQnJxeTB0andOVFRZOHJhVkRBZDJVbzBpdjJJVVVJeVJLOXI3b3N0dEdM?=
 =?utf-8?B?ZER4MHNoRzA4Zm9UTUkvZ3BaRzRXamh4UzJpY2x0RndUblc0WWNNNkNpTEkx?=
 =?utf-8?B?K0lCQWYxZFpoMEJOVE95b0ZMcW8yU2xDUVRvSEhpMVM5aVUxS1l5Q3NGc2NM?=
 =?utf-8?B?VXczREw1eWhobmNLbkE5dEtKTmRPcUdRaWsyL2Z6TktOdVV4bXNlTXN5dGFi?=
 =?utf-8?B?MXFiZTErS0VSdG5mVDNrSmtXMWQyQ1hWQk1QSEdzSnZvV1pBWUtXTFNrYTRY?=
 =?utf-8?B?eU1ySWRvQms3L2IycXk5SytUTTIrbVhDeHdpWDdsR0FjS3EyNm9RZlJXc3M2?=
 =?utf-8?B?akpsMzZwRlBuQ0w0cjRaelZyRXVJRmNEdFZxeDBUMWNFdWRxOGpSaWQvRTJr?=
 =?utf-8?B?UUlaV3dTVm1aYi9DRmZYM3NiZm05bTFQWUdGaUJFN0xsMlY4eXR2NDBqZjFv?=
 =?utf-8?B?dzZtWTEzVklwWFpkd290YURLUnhnMGZhT2hob083RjZzYU1DTkVsYUNkVEZj?=
 =?utf-8?B?bC95TkU5Z2xoVExwaUphcnp6d3RnRWp5RndoeUhVOUpya283S1J3eWlNOXZU?=
 =?utf-8?B?djkyZzQ4SU5BM1hYMEpHcVJmMnp3a2ZRMnBySzdUVlEyM3BhRCtTczJMdm1v?=
 =?utf-8?B?bnBwU2JRUUZSVEROWG1QeEdsVHlIYkJlQ01KQm14c1BNRUJTaFVycUM4M3Ry?=
 =?utf-8?B?Y1IxQXRjdlpFMmwyRHhLVmdiME1EK0hScDBQeXJ2Z3JkT05sRTJYN25CR052?=
 =?utf-8?B?NkJGYWlETTIybTY0UE1YcmQ0eFhoa05hRmpVd2NFZ05DTkhBZEoyUld5Y2tM?=
 =?utf-8?B?SmIwaEEwZjR1eDAxTm1NRmN4cDdsdVBVbVJzREhoeTN2UDJBTmZVSGlqSG5z?=
 =?utf-8?B?MUJwMWVBMWR1WjVTR0twL1VFWU1XMjc4QzFRR3VZNTh2djdUZlp1TUh5bjJS?=
 =?utf-8?B?UW5lMUo5bXBaMCtaOStLWkh5TXVLUkRiZmxycEw4N0lDVGVsVFZjVUZNSkxi?=
 =?utf-8?B?MERoaW1wSTFBOG41aTBpb1FDVWM3WFVzSTU5MWtiQk9haExlUWxKVGtGb2lV?=
 =?utf-8?B?SW9Yb3dwL0FtWDNNUDJuNy92MEcyS0dTVitLNHpyWVpIQys2SGNUVUdBWVZR?=
 =?utf-8?B?cnMyU2Y4bHFUdWsvK1BINkR0dERIQ1lBbWVBN3Erb29SNUorcmtyNzZFUTBv?=
 =?utf-8?B?UFUrczFpNHJrNCtTQmFRb0ZUUWcveDVGYlRFTE0zWkxNRFZzU1NRUWJ5a0lP?=
 =?utf-8?Q?YbC90Rrx8arJKImA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbd75d7-4bb7-4421-1101-08def9e69c33
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:29:59.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOSLZgpvfiqIQD4rgZRfRiIpdlqPG2VtFnlJLtCNve6RkF4nNZ8LNQMERUxqetT0HF8Mohj/rvejEhJaGJ5WyMdyXp5tiJVIeu8dcGuf9BE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR03MB989208
X-purgate-ID: tlsNG-33051d/1786699808-6D2D84E9-A840F72A/0/0
X-purgate-type: clean
X-purgate-size: 3458

On 13/08/2026 6:43 pm, Andrew Cooper wrote:
> It used to be the case that cpu_data[] inherited the BSP's cpuid_level until
> the AP had calculated it itself.  Following the rework, cpuid_level has a
> placeholder 1 until it is caluclated propely.
>
> setup_apic_nmi_watchdog() happens to be called on the BSP after SMP bringup,
> meaning that the first call is on CPU1.  It is also positioned in the window
> where cpu_data[] is garbage.
>
> As a result, setup_p6_watchdog()'s one-time calculation of the performance
> counter width falls back into Pentium compatibility mode assuming 32bit
> counters.  This causes a watchdog NMI which is delayed a little (e.g. from an
> SMI), to appear as if it hadn't overflowed, and therefore be (mis)classifed as
> not a watchdog NMI.  On systems where unknown NMIs are treated as fatal, this
> results in a spurious crash.
>
> Switch setup_p6_watchdog() to use boot_cpu_data.cpuid_level, which is how this
> is checked almost everywhere else.
>
> core2_vpmu_init() used the same pattern to look at leaf 0xa.  Despite being
> init code and only running on the BSP, {boot,current}_cpu_data are different
> objects, so switch it over to checking boot_cpu_data.cpuid_level too.
>
> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
>
> Found on a system where:
>
>    [root@box ~]# time xen-ucode ./blob
>
>    real    0m9.166s
>    user    0m0.001s
>    sys     0m9.165s
>
> is changing several expectations, and spurious crashes from mis-classified
> watchdog NMIs is just one part of the problem.
>
> I hate this fix, but it's the only thing which I consider remotely safe to
> backport.  Recent attempts to alter CPUID ordering have 0 success at being
> bug-free.
>
> I have not investigated what else was broken by the cpu_data[] change, owing
> to a lack of time on my part.  I would be amazed if this is the only thing.
> ---
>  xen/arch/x86/cpu/vpmu_intel.c | 2 +-
>  xen/arch/x86/nmi.c            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
> index ed9f62b9366d..af6cb0a85cdd 100644
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -896,7 +896,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
>      unsigned int version = 0;
>      unsigned int i;
>  
> -    if ( current_cpu_data.cpuid_level >= 0xa )
> +    if ( bsp_cpu_data.cpuid_level >= 0xa )
>          version = MASK_EXTR(cpuid_eax(0xa), PMU_VERSION_MASK);

Hmm, this is a stale copy of the patch.  Fixed locally.

~Andrew

>  
>      switch ( version )
> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> index 91f95fe6d080..ec85516609b0 100644
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -321,7 +321,7 @@ static void setup_p6_watchdog(unsigned counter)
>  {
>      unsigned int evntsel;
>  
> -    if ( !nmi_p6_event_width && current_cpu_data.cpuid_level >= 0xa )
> +    if ( !nmi_p6_event_width && boot_cpu_data.cpuid_level >= 0xa )
>          nmi_p6_event_width = MASK_EXTR(cpuid_eax(0xa), P6_EVENT_WIDTH_MASK);
>      if ( !nmi_p6_event_width )
>          nmi_p6_event_width = P6_EVENT_WIDTH_MIN;


