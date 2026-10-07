Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5681ACA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 12:36:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442286.1659854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQry-000097-V7; Wed, 07 Oct 2026 12:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442286.1659854; Wed, 07 Oct 2026 12:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQry-000090-RV; Wed, 07 Oct 2026 12:35:38 +0000
Received: by outflank-mailman (input) for mailman id 1442286;
 Wed, 07 Oct 2026 12:35:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xEQrx-00008u-NZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:35:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEQrw-002HVv-Vs
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:35:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac63c8d-2eae-0a2a0a5409dd-0a2a450ca420-42
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:35:36 +0200
Received: from [40.107.208.44]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac63c97-f479-0a2a450c0019-286bd02c7d87-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:35:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7499.namprd03.prod.outlook.com (2603:10b6:a03:556::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:33:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 12:33:26 +0000
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
 b=i+AnVgEJG4KRPdsCkYAhgzvA/lcI8ecaxTOiHYiRQo7K5ULlGKX+m2vqzNQtKG6x8REPSAffTYHv85bVTxrOA6jRASB60a9qRinCs1KmtKqLlKMayzMGWTW4InfgG3UjopGUjTx3XurDZ0JAAtG8QdgJwE2UFpHfotti6FlxTBbs659f3KUSd2Sa0FSlyC+oRG9JrZ4NuDm9sdDbEZasdPtWr6WEQj+1sZUzdiXTySijJbBCtLKSlaljTJ9DE5Feug4V9fBWEmnhBt31X57Lchmm8Vg4qRCtvi5b27/p/5m1KsIjqnOKAVcDjhbiwfKxowYOwxTFqqH97ORC5j4BvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qgHDDAYykJYNq8u3LGBiFBWecoR5UPdHfjjJSkKE1w=;
 b=fzONIwHeYNuPJppmGyMH1lF+62QAnQYYEvkXgPeB9FgSkvihgzzOQYJSFUfgmTY0Gh8O/deU0Zq/Pz7lwZd9wAjW34F1KDcqCE1DQ2QHRSGoSFmskjD+E9NYYbIakiGEAx8ZpiBgwKxKBnEfMM6fFf1G+T+NesDPwuuiRShX2iDIsjEVY46xEopKEdMD++3OPB4zc7mN9AoRKGauM/iXVlmVnib+cSAdnZxMonh4gkuDPaQ+5skRTfODenKV3rVMVUN9ssYg1YRB1OjRQXxF4SJpsksl1TMSICSPRpv8UHuohcwuUKp1E1XUF3z/6XsWyn0GGMtvy0qxbWrWIzlH4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qgHDDAYykJYNq8u3LGBiFBWecoR5UPdHfjjJSkKE1w=;
 b=VxoJE+kGPVAPmMcG5CtG/6l1SWa8q0jyNNnHNeGRU1F9WPeCp5SqFfBbe9b3GLS4WeysVROptjLJpOvs6QSFIKtEDyFwXnRk2HzAkkDF//PdYdZgrxIqOmVMTSh2humVkukCrsHbWRs40EMWsrAT3Oh/wK0R8jnk/0x46j6j4DY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f21cbbfd-fd69-4d37-8255-b069c0b68969@citrix.com>
Date: Wed, 7 Oct 2026 13:33:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 01/18] x86/PoD: map one page at a time in
 p2m_pod_zero_check()
To: George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-2-gwd@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261007104051.48841-2-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be7ee36-0c88-4125-7750-08df246f2f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	nYmUCeoWGx/yFoyu7C4gdh0xvgQxsBvX+j8of0WbLG1n/RqPl79PdSg5pkpBwzugzWDKXW2ynW4G/USGSfwcx/wrbD3y7HRr2482YvpmkQrxqFCQEPHjqS9tJYJtMk4jRwUVN2cDH2i6Fg5HExz8gomXr1IT7eHclkJpNQySlvJZNdDRYZwG4WG9VNr4MfVGhlsSowuOKsjzlv1HVSvJI4fHEKtJNQ+0+lf3PGjVBYFZZHv/TI6ByyfZ2oqI0Lt0qdE9wgiB7/5lP/PkdXLxq6pw06xklIxxWHGMX4gFHU+ETe/8oXvvr9sXlAZEVe7DA/SX5T3+oIxxUDREQ5wmIKODtU0Kn0c+YY/zK8pN5DKk+VQHwgBpOLOOuSp9B7t3TSYn/+To6Vnakkc2HFvpKFhqcq9ZF4Cne8h42mYso3ASaO2GBUwvQ543o/ZhSMFdwgevxPRylENj8ZXZzRzU98d4D4hwHJum7RLb44JH4nmf6FKFhtVe0fJn9XkzlTN8tHCbmN/LvuuE87MNKYLUX/CkOdCW6Q/paLML14z5K7mmMKKWjrOQM1xo62gyfIhavgd5BtYNa81hvHJemMPUa0duMgFL6Ltvq3vMcU3e2DCkcsDDnIaUwOgk+yTOKCsb7W3wC4eiNToLr3IEL3dLybsf6Q3c4oiVR6CJWgv8B+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJuMEFGL1FoNjlubFJ3aTBlU3RzN2I1U0JqNE92bDNSTmFISFVKekwwMC9G?=
 =?utf-8?B?RStKSGZ1eHgySEdGbFZMcytORCt4b1VqR0VSZGcyMzQ4ZnQ1Uk1NRG14R3M1?=
 =?utf-8?B?dCtzNkFoWDRvbWxPNFFQd2haUGxnRGsyei9KS2tGL3FoV3o4d21SYm9sYWx1?=
 =?utf-8?B?dFVIRjdEemlVVFVvTnFEY3dGZUtRcWdpa1daUTZNRzUxSmtzVDJDY2ppOEZh?=
 =?utf-8?B?OFNyRWh4ZE5Cbi84RmxMTGE1MVlIdU95UzJSYk1xd3BtZ25sK3RLYVB5SmFY?=
 =?utf-8?B?S1R1WDJPeEJ1SE16WmxxUUlWRmF3ZTVuNEVsckliQTQ4M01DcGJyQkZRS0Rq?=
 =?utf-8?B?ZTZ4dG4weEhQQndxTGE4bXV5VzJwYjNtUTZkVGJydURNSkoxS0Q2enJwTnN4?=
 =?utf-8?B?ZDZlM0ZDQjdmc1QvUW4rb09WdkN1SHJrTUJqZXM3aFhqLy9tUndpQmQ0YUU3?=
 =?utf-8?B?alVzK1ZGVXJLMWNmcGx3K25NZjkwalBWaFpBRjhuYi9OdnBXcGVkZzNsRmJs?=
 =?utf-8?B?b2NXRmEzblZ1d2JOWlRoUml1RGkvbitWNUhwK2ErL3FuRDhRbW9XSStyUnkz?=
 =?utf-8?B?enl1aDFvL2NRa09YczNVYnRXTElnNTNHUmpTWGI4L0hlQ1ZTb1dmRWRsVVhI?=
 =?utf-8?B?bGpwalhpYkNqd1lLdzVuQU9yRnBBR2hlLzJXZFkyN2R2Nm81U3ZmS2pxUjVF?=
 =?utf-8?B?OW1rUkJocm9YK2x4Sm53QzloeXRhZjE1dURrdDRnS2JKNE1sUVBjZVNPelI2?=
 =?utf-8?B?WGlmVkRiQjgyUUNhM0NWZmZzYjFKdVF5QzJldzRreHlsUGd0c1dqRUxXdWYw?=
 =?utf-8?B?czh5SHZJdWpwYlVxQjFlWFFBNEp3aU1lKy9ud0txTEl2akVzTEdLalNkdU4w?=
 =?utf-8?B?Y0hmbUZrQVBPNURHaVJXY3F1bWdaalBtMzRiZEhaMWVRT3ZEdjRXdUI4Rkts?=
 =?utf-8?B?aE43VEdXZENqWWgvcVNrUFVoSXB6Z0MzQWJZTjl5ZWt0aWg4MjBselVpRHhp?=
 =?utf-8?B?dDFZZUlBYzRhTjVqRGdTTmFTSzlMdXVtUWxyVlVxR3JUUEJqWklJeUd3eTcz?=
 =?utf-8?B?em1DcWlEYk15SElRa3d6dUxiOWxnTENQdkZ5bjhKeWtueG1VamY3MllkOWpH?=
 =?utf-8?B?ZXVveHByWG5WcXNyR2tFVmxRZS9vZDVTckFIeUFlcFlEWUR4Qm1KVzNEU0Rw?=
 =?utf-8?B?WkdQQnVsYk5FMW5DNVEzZStiSkNHdk1HM0NML1RTVDdhRURCeG5tcnNmcWlq?=
 =?utf-8?B?ZTVrZ29GblhnVHZaRmUvY3RiOUxiTVp6VVVneEtrUHlwUE9Oam52NEVYbUor?=
 =?utf-8?B?T2oxNkcrSG0yUnJEaUhFZnFlR1ZRSXExY0hFak9jSmV1NHIybmppOXUxUitS?=
 =?utf-8?B?Y3FpZXBySmVRdkdyOXQxK1hIQ2lkOUc0M2tJY0FVL2xMWUg0WkIvWHBIT3l6?=
 =?utf-8?B?VThFQ0NTYkNtQkNWRUhIMlhST2pOY3hYWFdpcTR2MTdiMndOUitmd0l2TFkv?=
 =?utf-8?B?V0diZGtMSGlvMkQxZUEyUnFrK1E4T3dwNFd5eUJORHM0aG1PL0pnOXpvTGFi?=
 =?utf-8?B?S0lCaExoeGxWdElFTmhDSjJhaFl3ZnRadFhPT3BlR00vdlZFdkpDekRvVTRE?=
 =?utf-8?B?d1JmN1VvYis2QnBHQVFZL0RpajZxcWRHeE5kVDNwc01mWlpvRjhjcXdEY09s?=
 =?utf-8?B?QVJEZEdLWVhNNTA1dzlyUWhKa0ZzUnhMZTlDQm5DNDNqMFBIV3gwRVRCL2ZW?=
 =?utf-8?B?eVExVUtqWGxRdldWQzdORm5XZ2xoQlhxWEF1WldTaC9rMysxaUZ1bVRieG9J?=
 =?utf-8?B?NzdGLzFRQ3J6cE5oU1JiblpoQlA5dGx0UzdveGJ2NkY4MHRyZ1VNdi82dVRr?=
 =?utf-8?B?cEY5ODVxYjErQkFHQ2lNS01LemJNbEFHMGVpbkpvSU5NY0YwWGF1azYyTG52?=
 =?utf-8?B?Q3NzYWhPeU1XOGl6NDhyL2IwUElTOXhTT0VDQ3ZydzN3YzZNRzIrR29hbFF0?=
 =?utf-8?B?UXRFUTR4QXJ2UnZlZTJ4ZndWRThIZWhPOFdJMmVWQjcrRUxiOEVFdG1WU1NC?=
 =?utf-8?B?TmwvbGpFNVZUL2Y0dVYybEZqL3FUS3dLY3Y1WHduNW12THREaEo3eGJzYk5i?=
 =?utf-8?B?aGUvY3R5R0J6ZEVUYjhxc1QrQm1kRmcxZXI0bDFQcGF3YVdpTXRYRWU0V0p4?=
 =?utf-8?B?dmMzTUlveDMyOWQ0UDY2NFJEQm5KcElpS25ZLzFNL25uYXRvK2Rwc1A3WGQv?=
 =?utf-8?B?ZjdraWNuaG5GeEZ6bkh4eG5nWUhnNEkwL1k1bytvUGRRbUxhUDFITkkxSklz?=
 =?utf-8?B?MTFlS2xwMWs1cUkwRVMvRnBXMTd2RG5DcUFZb1FnMVJnWXBxcEtXUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be7ee36-0c88-4125-7750-08df246f2f04
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:33:25.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3Jf6jOnAA9/YjRTDdg2bGAWpbSP0i0g1IUSZdZyZjlO+VUckBljB5Rkfi7l2OSOZ8ykc3g6feI6Qpo2H3NAdqgOzMZPtSvoicjKQun9a9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7499
X-purgate-ID: tlsNG-d25034/1791376536-01CC3A5B-838C20FE/0/0
X-purgate-type: clean
X-purgate-size: 7560

On 07/10/2026 11:40 am, George Dunlap wrote:
> p2m_pod_zero_check() maps every page of its batch that passes its
> checks, up to POD_SWEEP_STRIDE (16) of them, and keeps them mapped
> across the p2m lookups and updates which follow, each of which maps
> page-table pages of its own.  Its callers hold mappings too: the p2m
> lookup which found the entry to populate still has its page-table page
> mapped, and a PV mmu_update() the L1 page it is writing.
>
> map_domain_page() cannot always provide that many at once.  It uses the
> mapcache on behalf of PV vCPUs only: in debug builds for every page, in
> release builds for pages beyond the reach of the directmap in PV guests'
> page-tables (5TiB, 3.5TiB with CONFIG_BIGMEM).  The mapcache has
> MAPCACHE_VCPU_ENTRIES (16) slots per vCPU of the domain, shared by its
> vCPUs, and a mapping which finds no slot free or reclaimable hits the
> BUG_ON() in map_domain_page(): the host crashes.
>
> The sweep runs in the context of whichever vCPU populates a PoD entry
> while the domain's PoD cache is empty.  The guest's own vCPUs, being
> HVM, map through the directmap; a PV vCPU gets there when its domain
> maps or copies the guest's memory: a device model in dom0 or in a stub
> domain, a backend doing grant copies.  A PV domain with a single vCPU,
> as a device-model stub domain or a dom0 booted with dom0_max_vcpus=1
> is, has 16 slots, and a sweep over 16 candidate pages needs more.
>
> The sweep has mapped its whole batch at once since 9ad9a1609fbe ("PoD
> memory 5/9: emergency scan"), when x86-64 reached all memory through the
> directmap.  The per-vCPU budget came with the mapcache's return to
> x86-64 in 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al").
>
> Map one page at a time instead, as p2m_pod_zero_check_superpage()
> already does: map a page for the quick check and unmap it again, and
> map it anew for the full check after the p2m update and the TLB flush.
> The checks and their order are unchanged.  Each page is mapped twice,
> which costs little next to scanning it, and the error paths no longer
> have mappings to undo.
>
> Fixes: 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al")
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> NB this issue was raised in review and verified only by code
> inspection; it hasn't been demonstrated.
> ---
>  xen/arch/x86/mm/p2m-pod.c | 72 +++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 37 deletions(-)
>
> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> index 4602c32cff..0b0beca15a 100644
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -901,7 +901,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>  {
>      mfn_t mfns[POD_SWEEP_STRIDE];
>      p2m_type_t types[POD_SWEEP_STRIDE];
> -    unsigned long *map[POD_SWEEP_STRIDE];
> +    bool check[POD_SWEEP_STRIDE];
> +    const unsigned long *map;
>      struct domain *d = p2m->domain;
>      unsigned int i, j, max_ref = 1;

I agree with getting rid of the map batching, but your LLM has done a
poor job doing so.

An array of 16 bools is excessive.  You want "unsigned int check = 0;"
here, so ...

>  
> @@ -911,7 +912,12 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>      if ( paging_mode_shadow(d) )
>          max_ref++;
>  
> -    /* First, get the gfn list, translate to mfns, and map the pages. */
> +    /*
> +     * First, get the gfn list, translate to mfns, and pick the pages to
> +     * check.  They are mapped one at a time below, as in
> +     * p2m_pod_zero_check_superpage(): a vCPU can hold only a few transient
> +     * mappings at once, and the p2m lookups and updates here need some too.
> +     */
>      for ( i = 0; i < count; i++ )
>      {
>          p2m_access_t a;
> @@ -921,18 +927,17 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>  
>          /*
>           * If this is ram, and not a pagetable or a special page, and
> -         * probably not mapped elsewhere, map it; otherwise, skip.
> +         * probably not mapped elsewhere, check it; otherwise, skip.
>           */
> -        map[i] = NULL;
> +        check[i] = false;

... this can be dropped, and ...

>          if ( p2m_is_ram(types[i]) )
>          {
>              const struct page_info *pg = mfn_to_page(mfns[i]);
>  
> -            if ( !is_special_page(pg) &&
> -                 (pg->count_info & PGC_allocated) &&
> -                 !(pg->count_info & PGC_shadowed_pt) &&
> -                 ((pg->count_info & PGC_count_mask) <= max_ref) )
> -                map[i] = map_domain_page(mfns[i]);
> +            check[i] = !is_special_page(pg) &&
> +                       (pg->count_info & PGC_allocated) &&
> +                       !(pg->count_info & PGC_shadowed_pt) &&
> +                       ((pg->count_info & PGC_count_mask) <= max_ref);

... this can be put back to it's older if() form, with `check |= (1U <<
i);` instead, so ...

>          }
>      }
>  
> @@ -942,18 +947,24 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>       */
>      for ( i = 0; i < count; i++ )
>      {
> -        if ( !map[i] )
> +        if ( !check[i] )
>              continue;

... this and ...

>  
>          /* Quick zero-check */
> +        map = map_domain_page(mfns[i]);
>          for ( j = 0; j < 16; j++ )
> -            if ( *(map[i] + j) != 0 )
> -                goto skip;
> +            if ( map[j] != 0 )
> +                break;
> +        unmap_domain_page(map);
>  
>          /* Try to remove the page, restoring old mapping if it fails. */
> -        if ( p2m_set_entry(p2m, gfns[i], INVALID_MFN, PAGE_ORDER_4K,
> +        if ( j < 16 ||
> +             p2m_set_entry(p2m, gfns[i], INVALID_MFN, PAGE_ORDER_4K,
>                             p2m_populate_on_demand, p2m->default_access) )
> -            goto skip;
> +        {
> +            check[i] = false;
> +            continue;
> +        }
>  
>          /*
>           * See if the page was successfully unmapped.  (Allow one refcount
> @@ -961,6 +972,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>           */
>          if ( (mfn_to_page(mfns[i])->count_info & PGC_count_mask) > 1 )
>          {
> +            check[i] = false;
> +
>              /*
>               * If the previous p2m_set_entry call succeeded, this one shouldn't
>               * be able to fail.  If it does, crashing the domain should be safe.
> @@ -970,14 +983,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>              {
>                  ASSERT_UNREACHABLE();
>                  domain_crash(d);
> -                goto out_unmap;
> +                return;
>              }
> -
> -        skip:
> -            unmap_domain_page(map[i]);
> -            map[i] = NULL;
> -
> -            continue;
>          }
>      }
>  
> @@ -986,22 +993,20 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>      /* Now check each page for real */
>      for ( i = 0; i < count; i++ )
>      {
> -        if ( !map[i] )
> +        if ( !check[i] )
>              continue;

... this can turn into for_each_set_bit() loops.

~Andrew

