Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F22AC5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 15:56:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393088.1631982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzgx-0005jr-Bm; Mon, 17 Aug 2026 15:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393088.1631982; Mon, 17 Aug 2026 15:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvzgx-0005jk-8q; Mon, 17 Aug 2026 15:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1393088;
 Mon, 17 Aug 2026 15:56:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wvzgw-0005je-6v
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 15:56:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvzgv-003TcE-5l
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 17:56:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a832ef4-e002-0a2a0a5209dd-0a2a4503b05a-46
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 17:56:01 +0200
Received: from [40.107.201.51]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a832f0a-fae8-0a2a45030019-286bc933b61a-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 17:55:55 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL4PR03MB8105.namprd03.prod.outlook.com (2603:10b6:208:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 15:55:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 15:55:52 +0000
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
 b=kfkttt0AuGQQIjSUnpj36YLc4Z7mdSoNx2tqCAPGjxn5APCXkuw9nuNWaCPxa9N/Fx5gniCE9umM09T8UwWwgaYCoO12qR8qvso9y5PPzlPpbeZkySyZppdrFNw40UW+bSReZ95ixgUjr297W+B+o2dRIi9Ze0oxLq7KLzHH6Sgl4W7NUALODuBYvkJ9VzCAZNP6vFB4RIRmYy1X0q2bXplx+EeJDwoRV8hHRsyJ0laPFzg/FDKYy/fGgKxurkEElgNTiEYSPq9b4+DhOaB6UUef8sItkJfxERGxUkak0xumNzUgw1WB+YwTCKqY3ScvdnpWWWEhkxAhMAHE38pv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzTyTjOryEThhLGo2ffDznBm8Dy2ZHnhlRwu6jqfVIo=;
 b=N7qtQfbjI/Dw1ZubTpnDI+xep5x/QesVEvNvbDWjr3UvH7f5lVubOn23z5SQ52cFo62S58AgbIz+3DV+ZYwFT/3LhhZzv7b7c60SO0SioWbH74ZeXx2YpA1rVwvAknsC8bWAPlt5BJbRDv7brUNv9hxHPtrtZfPwL/zjjbSDMqqfQ43YqLKBM1i75DWTm7WqX8ZqWIkbO5Pu2Xd4dw4gRNRK/diGSnMUqzVSt1KlPwQp8cRAEZS2jmfMaCEq5gJdJY6+4E1/QBghL93m2oxqJl7C35OpwwH9Ezl9is7t6xjONpRw6kx2qdbM+qJfpe2eLiYk3h1ShkFKnzfILVpgjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzTyTjOryEThhLGo2ffDznBm8Dy2ZHnhlRwu6jqfVIo=;
 b=QgaxA56OS9ZVriGbwDaZnuW7SkkSadBqDjUO+AD7t4Xv1XW750S1z9k1AYCOBunBuJ3Fae8d7n/V66q5b3KkmccQzMWv6na2MmE5zV2oU2fdmlrGRQCCrQT1iHTBSHQJh2k3N+ptX8xnCgc8Qib6WnT7CAXy+Q8BPjLlzWRWweA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <33aab2bd-db13-43f6-9616-5e75fd79b81d@citrix.com>
Date: Mon, 17 Aug 2026 16:55:48 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/nmi: Fix mis-classification of watchdog NMIs
To: Jan Beulich <jbeulich@suse.com>
References: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
 <4f58e236-c40b-4fcc-82e8-5b6f3eafe656@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f58e236-c40b-4fcc-82e8-5b6f3eafe656@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL4PR03MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd22daf-1ae4-4d22-b034-08defc7803a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|3023799007|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Nqb99md9urF6Q6Pw/cDyEPnLw9N8goGKFyZwJliyz9ks30nj1wtng9AJgzuEV2OLfX2XaL9SP2KbmmC+ucuWhxNlWIruvRQeYuDTt6lPS5MOOZVglDnGbO5aRysnha94Ewejq5f90V4u0NLEPKpQjtD07J7Pc0oJfvMZg5rV3h9q1XaxqUeNwsipznfLuzn2AwCLPaFQLUO36AbVqFOGt6qY+0ympjYK1DwWNK5FpiQez7hyrD6K3yMTAubCP7SncDCJtwiWIH9aMymrHsR2WXYi6VIHLEJCkPdqmRzPCAKqyOteA9ngxMHtJR9DET/APlsAJCo1TfJMjerNthBlH0Qo5UCzskOVuLCfWykNU34ctWsADzQynLNqAlP6m+4oEwgQ6B+GGIiLb4hm/J5REFwfqg+5pJAdHXeDVJUdL96wYbCLWBrOtDFAv6VPpza5nFH/Y4HlIas2jFDX0KlHI8hPIaS9sRlsG0v3ucY+tMhh5r/9h1xSdw4YuYwV7JvWpVipS0skaTTVfAS3Ld0lNTJcph6tvG/CKy8Py0uxLw+irK0QAMHKBKQEGZWLG6BnG5jIWtzjtpItAN6pugkFGS3svr86MKl4KZ9MMBSESgBJinN1YJJqWMcSkHHI3iVF3AMZ8yLRkSN23lNw3LfGiSXTR1ACgq5K0OhE01isfHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGs2ai9DeVlKYjNJbDlKTEhwbWF5M2Npc050ckNEdWI4NWM1T01hUTBBN3J4?=
 =?utf-8?B?NG1QK3ZKL2JmQnlaQmNuRHBWSTAraTQweUtOZEZkTGhrREtGY205MWtsVkIy?=
 =?utf-8?B?TkFtSDR3ZjlhaDV2dEdtbWFqSVdrRFQvdDBiSGY3cXNpRm9KV2wwYStXMzhr?=
 =?utf-8?B?SmVvUVV5RUZzMjA3NWhuUjBnNXJLUTVuNEVQcG05TjcyNXNkMzFlYXZYdDda?=
 =?utf-8?B?MkRyUStIa3JDajExa1doVXlnYUVwZHM3TE1FZjZVaVpJc3Y1ZDlxeDJ6emN6?=
 =?utf-8?B?bzA2YzBXaU83N2I3bVUxdGtKYU1PbGRYRG8wbjVoZTVSQ3M2ZkExcEVuQ2Na?=
 =?utf-8?B?R1NPOHlDbTFobzVaVjJkeERiUEo0Sy9QNUdHSXk3Z1ZjM3ZVTHpycGMvYU1L?=
 =?utf-8?B?UFdtY2E1QjZ2VGxHc1BuY0tWYXpVYVFIY2YrRVdtZ0VVWmNKcEc4QStwWS9R?=
 =?utf-8?B?dHlVeUU2QVZsMzVkVVJxVmFxbWtiUHRaTUgwZzBheVNmZmtLOGN5UTBTWHN1?=
 =?utf-8?B?enRrbE1BODYwUGs1bEZvRnlVQmY4L2Vjc1JuWWRuK3JoMXF0VjFNR1RCSlNs?=
 =?utf-8?B?WkRmai9jTkF6VjQrSURETExVYkpOeklhd3FlV1JoZHowb2tyclREa2NENkk5?=
 =?utf-8?B?aDNZWGt2clJEWS9ZOCtXblhPQzlYZ0t4cWY0UTBTeFNyYWE0dmw0VUVtd0lz?=
 =?utf-8?B?S0RrQno0ZDd2aktUc29zbXh3RGovK3duM0lTakdhQktDeitjbGtTeVErSDdW?=
 =?utf-8?B?K1dybnBWM0hOWTJkSjJVaGNrZXIrS1dIbHlZNVhPZlZlUm1VbDB0YmE2RzhW?=
 =?utf-8?B?RFZPZHRXV1ZuMm9RcHVKZWQzcnpWQ2lSVjZUSi91ZkMwY0pFMXBWVWs2ckpQ?=
 =?utf-8?B?dGx5alFsaFZuc0NoTHdCOXlxeUI4OHM4Qm16RWhhdW9Zb2t5SjV0N25CQ1hE?=
 =?utf-8?B?TXdhRnVBMGZpRFJhQXJVSnVaMm5kR3d4bTJhUnhsZnhCQk1uRWY5SnBzdnFw?=
 =?utf-8?B?TlNLc2RqZDhSTVhRUXBRVU9KTmlQTUxGejZtSjdsVUI1SU1kUU9EVGhXdStS?=
 =?utf-8?B?QmZMczB3dThPUXVJd0l1emVDR3JQT2JLeGNwOEF3UTg3Y2EzSzNQdEU5ZjhI?=
 =?utf-8?B?YXhpZmpFK2hzTXFObFhldVk0SHh2THEydERUZzkyRi92WXJpSVg2Q3JrRDRH?=
 =?utf-8?B?SDRqMnpJd3F1UjYzcndXUC9ISkRScDJlYS8vZVBSZnlVSlBhazNkRzRYeVhr?=
 =?utf-8?B?LzRTekVVbUEvT2VOeTN6cGl5TVcxL0x0L1pZbDMwbENjUUtKWnRnMGxueDNE?=
 =?utf-8?B?dk9kMzZMTEY1eHl0bmQ3VzB5a2VCbFlTY1g1YjlxWUU1T1VoVG1yQzl6WWh3?=
 =?utf-8?B?OTVya2QrWTZlSWtOQ1laNGF5RTREM1JiS0FLaXZlU2dIYW5hblN6ckh1SWMw?=
 =?utf-8?B?aTNVZ3F0c0NzSERET3hUT3Iwc2F0OWZ5L0NualpMUUhiSmVPOUJlbTlVOFhE?=
 =?utf-8?B?Rm9PQlkwS1dsVHMwT3l3c2RwdXVQNlhTK3M0dHNxWjZyVzd4UWk4bVdINjhS?=
 =?utf-8?B?SjhkMTJQbzRTck5JVFh0clB6VkhkTDE0K0NBWURwWlF3VjlmaG9BUyt5UHkw?=
 =?utf-8?B?ODdxU3Ard0dQbE9mQk1VaC9KSm0vVndPNHZZK0dJTkx0ZE94c3U0V3BjVHdH?=
 =?utf-8?B?MW1kcWpRL0tOU3dxb1Y1Y3hVaUJ2ZE1lSmFtT3h2SmNkSzFGOWllTThYbFhm?=
 =?utf-8?B?Rms5K0xENkI4NlIrRDliWmR0QkIyM3FMQ0ZDUVNab0RoOUY3d044aEFrUFMv?=
 =?utf-8?B?dGZTejJPVWVDeUxFWFlwd2I3RHR1S2ZmUmNScTA3MGg5NHk3aUowWnprVU0r?=
 =?utf-8?B?U3N2bFNEa1hRMXRqSmpQM0xZQklndzhvdnR2cHRCcEpnQThGUEl6aWJnY0p6?=
 =?utf-8?B?RjR2TXZkenIrK21uMFJhZHYvM21MNHhENnN3YWdIeHVSSkhXSlZWMHhTL3Ay?=
 =?utf-8?B?VGc0emwvd0FIWFBwbjJvZVN4VVdxaWxoOFRVL0hyaGozL3ZFL0lReFB1WWJ1?=
 =?utf-8?B?TjZURFFrTnNpRGpiV1cxbjhKRDJ5RjZ5NEdCcU5NanRKQ1drNGt0d0RHOVl3?=
 =?utf-8?B?dUhvUE1URHh2MDBTRkVIT0NZTWJaZjVHb3IvUytpNVJXWkNyd0sxNzFyN2xn?=
 =?utf-8?B?QmRraTZndWR0dG5IZkVLU3M0SXhWTVpINy81ZWlkOEtaU0dWZWtOVHhtY2ZD?=
 =?utf-8?B?dUpmSUZGSWFTR2cwd3pnREsrcVhyMDAwYTVESWlFVVU3UUVYcGJaK0g3N01D?=
 =?utf-8?B?R2k4eU1nS1cxUlFrTzBuN2lqVXphOHJBNU4wUjMyTlEvcVE5UlBkQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd22daf-1ae4-4d22-b034-08defc7803a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 15:55:52.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KF+StwbMba8iwEAahkCqEPh7K0ilcQbqFzBR+1V7wmsUynlUIbErJ127jf6lUJnjMvXzhfrM4JExCaLWNuZXNYnkM5VAnWjTevgxMahJpOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8105
X-purgate-ID: tlsNG-33051d/1786982161-76EF74E9-9F7A61D9/0/0
X-purgate-type: clean
X-purgate-size: 3073

On 17/08/2026 9:30 am, Jan Beulich wrote:
> On 13.08.2026 19:43, Andrew Cooper wrote:
>> It used to be the case that cpu_data[] inherited the BSP's cpuid_level until
>> the AP had calculated it itself.  Following the rework, cpuid_level has a
>> placeholder 1 until it is caluclated propely.
>>
>> setup_apic_nmi_watchdog() happens to be called on the BSP after SMP bringup,
>> meaning that the first call is on CPU1.  It is also positioned in the window
>> where cpu_data[] is garbage.
>>
>> As a result, setup_p6_watchdog()'s one-time calculation of the performance
>> counter width falls back into Pentium compatibility mode assuming 32bit
>> counters.  This causes a watchdog NMI which is delayed a little (e.g. from an
>> SMI), to appear as if it hadn't overflowed, and therefore be (mis)classifed as
>> not a watchdog NMI.  On systems where unknown NMIs are treated as fatal, this
>> results in a spurious crash.
>>
>> Switch setup_p6_watchdog() to use boot_cpu_data.cpuid_level, which is how this
>> is checked almost everywhere else.
>>
>> core2_vpmu_init() used the same pattern to look at leaf 0xa.  Despite being
>> init code and only running on the BSP, {boot,current}_cpu_data are different
>> objects, so switch it over to checking boot_cpu_data.cpuid_level too.
>>
>> Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> I hate this fix, but it's the only thing which I consider remotely safe to
>> backport.  Recent attempts to alter CPUID ordering have 0 success at being
>> bug-free.
> How that? Collecting CPUID output should be doable almost first thing. There
> are no (or in case of doubt: there should not be any) dependencies on about
> anything else. Of course re-collecting may still be necessary after ucode
> loading. Yet from what you say I must be missing something crucial.

I was referring to commits in Xen rearranging the boot sequence with
respect to feature handling.  There have been many failures recently.

> With that in mind, I'm also questioning the Fixes: tag (without this being a
> request to drop or change it): Using another CPU's data isn't much better
> than using partially unset data. Unless we assumed full symmetry, at which
> point re-obtaining of most data on the APs would be entirely useless. Hence
> the issue was pre-existing, with one bug there hiding the issue addressed
> here.

Copying the BSP is less bad than the current behaviour.  It's not
necessarily ideal, but it's a damsight better default than the arbitrary
1 that this patch puts in place.

Even with the very old 64bit systems where mixing steppings was
commonplace, I'm not aware of a vendor supported combination where
max_leaf was different.


The issue was not prexisting.  Prior to your rearrangement, the NMI
watchdog setup found the counter width in CPUID and used it, without
falling back into original Pentium compatibility mode.

~Andrew

