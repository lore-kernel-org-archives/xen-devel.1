Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF6CA601E
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 16:26:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444560.1661363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFDPh-00008N-9r; Fri, 09 Oct 2026 16:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444560.1661363; Fri, 09 Oct 2026 16:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFDPh-00008D-7C; Fri, 09 Oct 2026 16:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1444560;
 Fri, 09 Oct 2026 16:25:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xFDPf-000087-Ee
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 16:25:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFDPe-00FBcF-Mk
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 18:25:38 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac9156e-8faa-0a2a0a5109dd-0a2a4506a990-22
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 18:25:38 +0200
Received: from [40.93.198.41]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac91580-195a-0a2a45060019-285dc629f859-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 18:25:38 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7871.namprd03.prod.outlook.com (2603:10b6:8:21f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 16:25:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 16:25:35 +0000
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
 b=CdgJga+T/6fjcfOSkJ0sp28FJg8QCa4qAT+ncLJk4Abs5HUaauiASlZqgLCKgecPbcfzRh9OwzAgLNCtlEhTzyhOqb5nj93ztwo6DxFqP+Gi8B4gFjDYw6QZM3l/9pfLfQnbYVQ+8OPiUSPWMY5+YdZOjq44+sK+mWyrwpgMDQKx0mapPXwSPE8ZIxafuC/8DVwkDu4lUr6VILFF0F6IJjcv1DC6rJw4ngR6vAJ4eWjfgQxRiCkvM2EedAJ66ihAAA42xXezDRtoV5v4HZJhCk9lGR38AZlJJImIMW7LAIc5m1YSMr8QK+RQZMaXf37Rx5bUWGK9HKhimQoIqDKf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPwChnQRHX1pTxtlrfp4+rkywm9j/I8bIOW075bZYgI=;
 b=WqXa1kkJ0xuMbk6hEmZhLc7FiPM8NQ1ehIJLFMYqhrzaVByup6bIfDrMewXiG+Hu+P4FJr0o4pozuzICB0eajdZESldy5pC/p9YIOf5l545pzEP+9dFaomF8C1Ri5vtyJKOuy4u1VKMjf7SvA0NFwz4d0c88d41nx7eek+mnD6w9qXfV2Homx/Fn6jo/M/HrYe7DzrHvLz9S+vdHRbssT7GqfcF//W4DH+HiblR0TFNCKB7qi+5rE+8Mf3djRXK1NAsfFGIaVjoitKTHDBoXLnErnWsCdevzR4iDwAB2DPkVjbt++VqitB/mypuBzqimDiT8Em+nKLV9xPoOBiH/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPwChnQRHX1pTxtlrfp4+rkywm9j/I8bIOW075bZYgI=;
 b=plyqeIF2R7RZy1fIfBD3mcunBNtOBkcPt7ytiQYOi4ge5HnTJQsn6Bnm12K0rgNlInrEjVCqP8E7opUt70c6Io/9N/qjf3IC++wafXUZa/AFhtWT4EJGPUgyWtBovD12Vwg5sC+rdD9XkTqVSXCmxbLQuC/I9KISM/CiqGqiciA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c0add70e-b716-46df-85bc-7d2ace35a775@citrix.com>
Date: Fri, 9 Oct 2026 17:25:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 teddy.astie@vates.tech
Subject: Re: [PATCH v3 3/6] x86: extend mod_l*_entry() to optionally return
 the old PTE value
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-4-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261001174749.2275245-4-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 122a7018-a593-490d-7950-08df2621f272
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XlG2rNSuQwrHP+2UMCmYRB5rjVI/T50dsvMBY4MJVqpO7gA6hrz9jqkJJ0CTQfUmP9w4++lejDoceyjHXNKpnpvFqKFrUFNEWcGtNahjMWFlbvvq2FCOuggJ2HwF5llErixavI8zzoWTQp9XrtzoSVgJYQF8J9d32CXYsUg+MbjLNW6luDlWuPK9K11VK5QE3UREAkqC/ODRe6+h/jkqkP44032ptMGIv7k9R9MES9OkWdjHZa2PuFx6ILsHU+zu2DOWQqZlolRyPwADlebkJTvZ5s5nATLG8/v5xvzONAHwo+Y3FA+eldUkGW7pSdJvUcsKYxqClGxAFf+b9ZjZNfPTbTFNWevO2YlgSu8D6PNVLAd4daQBq46e+h/cwGbnt4DY9YpvBnr0cxUgV/M+m54Y77cCjuwyDDFBKXX2+TfzOPWx/u9UfOCQkeOX99Hb5ZQsSJirqVxUqBjwMbB2TiSXKl6OkafqfDr93/tmLIjGBKRjfbJrqBxepL2LlKIKPGIOWGlVaVeKqUu5qaHwj6tVJL9f9YuqjFjOICyY7ncpMePJJnO9ltq2FKyNU0soxBVpHVBevqeahcD8ZW/lhmGLVoW1k5RkHJmd7y+g3hV8QZR4HN2qQvzi+DkcVPbyIqcNv+n1c5q8LebCV5PmYQqO9MPYQ1x+d3k7kjOIsF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1VubFF0SFBUWDJBakQ2c0RkNTZsNkVFVzIwanJwWEVoTk1IUnBIWmtidGNC?=
 =?utf-8?B?OUpaeDZ0OUhkTnlOdGRtQWVVRWtFNTBIZTh1T1ZFNnkxL3Q3U2lEYzIwb2w3?=
 =?utf-8?B?Y1dzQXBNdnIwekdFRThUeUJHSUFkdXhPWWdFQkMzbDR6VmcwdWNHUjN2T1FF?=
 =?utf-8?B?WVJHb21rSFlxZUR2elJBZ2U4MGNYSWtFSlhZM3I0YXZ5ckFaOC9mUEJrU1ZG?=
 =?utf-8?B?K1FINkduV3p5MFZ0UzRPbFBBK2JWZlFFNEFKb3F2bjlkeHVjbjJDY0tNcDU1?=
 =?utf-8?B?bFRGaVp4QzRwby92eWVscFBuOEVPditMOWUzVHhhZ3JDQXkxWnJiazFqbGVO?=
 =?utf-8?B?SWJTUmNRdE5LczE5ZUJvd05FSTExeVBIaEtZVFpmWUF3V2swN1d5dy9iS2t5?=
 =?utf-8?B?eFc4dU5uam1GKzNlOTBNSzQzNys4bWY5aUZxZzBkNzBOb3Rqd1Fpb0RUWWdQ?=
 =?utf-8?B?TGptejNnY3lvSWxLZC9oQnN0MnpTY2krNFk0WW5tbm1ZL3phT2ErdVBGbi9k?=
 =?utf-8?B?U3gvTmpHYnBlZFBLMXppdmduUE01Y3I2QmV6V0xIQzErWEZzc29GVUpPS2Z3?=
 =?utf-8?B?VWF4ajVBSm1OWWQwaEpKRUFWRTlpOENaRGRUZXZrVHhhL3NXNnNXb1FYZDhG?=
 =?utf-8?B?N0RNQVlRamxKTytKaFZqbXBvWGcydmxodzcyZ1o3VDVXSUJmSkZMR2NHbTdo?=
 =?utf-8?B?eE11QXYwczFXRTBCUTVDUm4rb0lwRFhPQnRHRHYvRHl0UStmb2lkOHZKZldj?=
 =?utf-8?B?VFhoTnc0UWw2MjV6NElEQ3dqTmJ2cE1FMGphTUtOMTRQOUdEb1g0UlRXY2tN?=
 =?utf-8?B?NUxlbzJleWZYQWowbDlSaEdEVEhnU3JPRzAvM1I2R1FaQXloSlJVK2w0U042?=
 =?utf-8?B?TnFZRTFKZEVmRFpYSEk5akhpOEhSWUF4dG5uVmgrWlpISnNsMU95MUpUaFR0?=
 =?utf-8?B?LzNzN2w3dFBPb0lIUEtob09iN3R0cmI2eXNobnNVcVF5MVJZNDgyWWw4MVFu?=
 =?utf-8?B?cmNhRlRCdGJEc1ZJbld1VkJzZXpSR2JzYll2Mm9JZkZ4VWN4WkNVajczRWxa?=
 =?utf-8?B?UGNuaHBadjhDRnYzYUczemVrOGYvM3p6Uzh1S0xQMjR5eGJqRlB1anRsSkh4?=
 =?utf-8?B?bm13SVlFaWFDNXQ1blJDQ1pEdS8vandYRUZFSDlsRjBMa05yclllKzdjM0FI?=
 =?utf-8?B?Y1A4d2l4cTZ6dkdSblhOblk1b0c3MkFNSGVPUVp2NUVyQy9ZQk5tS3d1dGdX?=
 =?utf-8?B?SFNNWUJpVTFCTFFmQmFYeDdweWVCNVI0MDRVQzl1SzVRMHZYcStwSHMzbVps?=
 =?utf-8?B?dVlVeWFCMXZ2NXB2dWp5aEM4VGVWb0s5L29ZMXlBNHM3UHQxSUs1SDlHQU5w?=
 =?utf-8?B?eXZLU2l6RWhpdlpGS1U0Tk9MbEYraXM4dmZ0WTY1TG9HUUdteE40NkxiK04z?=
 =?utf-8?B?WUp5Z3Z1RE4rQUQzUXFRZTkzVjM1U01TS1MvL3Raam9WemhjaHNwbE5vMHhH?=
 =?utf-8?B?Q2VhSzZxOUdKZEhENGVCT1RXWVpuWXQ2Smt4a1JSMFR0L2U3NjFYcjQ1T1J2?=
 =?utf-8?B?S0QyQ2xzT0RrMDdPZkszWXJ1enpuNldzN0Zra1RjUFVDSEIrR0FGS096K081?=
 =?utf-8?B?dmJaRXVBd2JWcHM5WjMwUUJSMUJiNnJUMW54ME1ZTEV0ZEdJOWhNU0ZweEhN?=
 =?utf-8?B?WEllN3ZVRTl1Wkx1OFI0T0NFVWRnTkh1L0VYRHdyUnR3SmxYWkY2STM4QXZB?=
 =?utf-8?B?ZVBuVlY2VTdnWjl3anVzZWRyRUxmbDI0OGhwUGlyYTVBRzY1dGNlVGVOazJx?=
 =?utf-8?B?ZFE0U2pJbnJTQTlZWElheE5xeXc0VzBRM2xEVmV1eEVMUlNwQVc1ZW1PZ3hO?=
 =?utf-8?B?Rm1scjNnWjU2Ykx5cFlLYjB0bTNwOW1TQ2haM3ZDWmNvUEhSeEk4dlRDQlBK?=
 =?utf-8?B?TWRQbG1uSmJCYXZORXFtaU9pUjJ3cUlOWTlKeDFZd1cyOHhRRzdlVkxmZDND?=
 =?utf-8?B?YzBYTHNJek5SYkhzWFAzTDIzcEh6RjNiRm1QZzIrM2plWkdxWTczRUZ5cFN2?=
 =?utf-8?B?YmhjcHE4RWdjYjRjU0FGMEtHMkFUdzRQWVZrNTlYYmhoVlBDd0w3c0FuUXJr?=
 =?utf-8?B?MnFST0xCc2EwZkxuZFgwa29ybS94SjQyblJnOHU2L0RyWnpPNm94VHVpaUpX?=
 =?utf-8?B?anRhS0tjN1FuSytES25SbFk4Z2FBZjE3dEJjdzdCdnh0WmNWY09obGJLT0Qz?=
 =?utf-8?B?WXg3S1o4bVZlbVRwODNQbk1jTEZrbFFkTi80cnBvVC9zeUJCeEk2RzhYRjYy?=
 =?utf-8?B?SDVpdzlham1tNEhWT0dQbmFDT1UySmlVdEhoMm5nYXBERkpOUjRsUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122a7018-a593-490d-7950-08df2621f272
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 16:25:35.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0LzCRRUCUuIjJOjg0rPl4uAoTt8V0Q8nxhe8HOB9RjMSJvlsclA8McP/JnKRG+N6UvGEiBx8nflw2JLDBoJze46XJ095jhqAkK3zABSa9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7871
X-purgate-ID: tlsNG-16d1c6/1791563138-F647377B-E94E442A/0/0
X-purgate-type: clean
X-purgate-size: 3692

On 01/10/2026 6:47 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 1ddb8b71469a..535a62139cad 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2154,7 +2154,8 @@ static void l3t_unlock(struct page_info *page)
>  /* Update the L1 entry at pl1e to new value nl1e. */
>  static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>                          mfn_t gl1mfn, unsigned int update_flags,
> -                        struct vcpu *pt_vcpu, struct domain *pg_dom)
> +                        struct vcpu *pt_vcpu, struct domain *pg_dom,
> +                        l1_pgentry_t *ol1e_out)
>  {
>      l1_pgentry_t ol1e = l1e_read(pl1e);
>      struct domain *pt_dom = pt_vcpu->domain;
> @@ -2215,7 +2216,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>          /* Fast path for sufficiently-similar mappings. */
>          if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
>          {
> -            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
> +            if ( ol1e_out )
> +                *ol1e_out = UPDATE_ENTRY_SWAP(l1, pl1e, ol1e, nl1e, gl1mfn,
> +                                              pt_vcpu, update_flags);
> +            else
> +                UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
> +

This is a reoccurring pattern.   Also, from the subsequent patch, this
is the caller's reoccuring pattern:

> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c index
> 535a62139cad..a2d05d6c7113 100644 --- a/xen/arch/x86/mm.c +++
> b/xen/arch/x86/mm.c @@ -4111,6 +4111,7 @@ long do_mmu_update( case
> MMU_NORMAL_PT_UPDATE: case MMU_PT_UPDATE_PRESERVE_AD: case
> MMU_PT_UPDATE_NO_TRANSLATE: + case MMU_PT_UPDATE_SWAP: { p2m_type_t
> p2mt; @@ -4172,10 +4173,27 @@ long do_mmu_update( update_flags =
> PTE_UPDATE_PRESERVE_AD; else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
> update_flags = PTE_UPDATE_NO_TRANSLATE; + else if ( cmd ==
> MMU_PT_UPDATE_SWAP ) + update_flags = PTE_UPDATE_SWAP; switch (
> page->u.inuse.type_info & PGT_type_mask ) { case PGT_l1_page_table: +
> if ( cmd == MMU_PT_UPDATE_SWAP ) + { + l1_pgentry_t ol1e; + rc =
> mod_l1_entry(va, l1e_from_intpte(req.val), mfn, + update_flags, v,
> pg_owner, &ol1e); + + if ( !rc ) + { + req.val = ol1e.l1; + if (
> unlikely(copy_to_guest(ureqs, &req, 1)) ) + rc = -EFAULT; + } + break;
> + } + rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
> update_flags, v, pg_owner, NULL); break;


Both are rather intractable as far as logic goes.   We've got
MMU_PT_UPDATE_SWAP setting flags=PTE_UPDATE_SWAP which both gets passed
in flags and expressed through the NULL-ness of of the ol?e_out pointer,
which then choses UPDATE_ENTRY() or UPDATE_ENTRY_SWAP().

The only thing UPDATE_ENTRY_SWAP() is doing is wrapping the return
intpte_t into a typesafe variant.  It doesn't play with PTE_UPDATE_SWAP,
so the name is misleading.  It's unfortunate that we can't wrap
UPDATE_ENTRY(), but I think we'll just have to live with that.

I think the logic in mod_l?_entry() wants to be along these lines:

    intpte_t old = UPDATE_ENTRY(...);
    if ( ol1e_out )
        *ol1e_out = l1e_from_intpte(old);

and the logic in do_mmu_update() wants to be along these lines:

    {
        l1_pgentry_t ol1e;

        rc = mod_l1_entry(..., &ol1e);

        if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
            ...

        break;
    }


I think this gets us the same behaviour as before, while keeping the
same (single) calls to mod_l?_entry() and UPDATE_ENTRY().

~Andrew

