Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7255C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 08:30:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433494.1654023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA1JS-0007ox-SD; Fri, 25 Sep 2026 08:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433494.1654023; Fri, 25 Sep 2026 08:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA1JS-0007oq-PD; Fri, 25 Sep 2026 08:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1433494;
 Fri, 25 Sep 2026 08:29:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xA1JR-0007ok-Eq
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 08:29:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA1JP-00F2Kr-Ay
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 10:29:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab630f2-bab6-0a2a0a5309dd-0a2a4506bbe8-6
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 10:29:43 +0200
Received: from [40.93.196.47]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ab630f2-195a-0a2a45060019-285dc42f2919-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 10:29:39 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN7PR03MB283467.namprd03.prod.outlook.com (2603:10b6:208:5f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:29:36 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 08:29:36 +0000
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
 b=tnJdv7+9z82vnDDlrc/+GjfsOrkPB+S+b73zGLp9pU3Qt9BM2Wiokx4i5aJR3XqX5DhkwqiduwPuWwgAtrEnwH3EnIXnqWSHoABqwQ5WsctXGx5eVi449VwFyft5D/XYYggNutzwh2Te3/eWvnT8DRMMgFBoe2PCAsth2hXhcBhXjCuasmjyJCsHKuC8Z2H9QH16QxzctCoypaxwbTpekO+TQdC5u5t1Vfj0yUyGP9oP1WTe5mb8PbM6qtRVnL8bvNPq2OODJK4Q/N2Ac3vQfSdJjHND9DvDijmSu99MAjKUDF+/CpxWFIIEarvpIPGE5Q76k0GZbpIo8Dy+ClHO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs+KudK1TELx7zWGyjdbH52iDjnTZ3b/b7KNxHZuInA=;
 b=uVnIOf6JF0cfO7Orp8lJ/nHXogy2z++zqtxpZO/AuLeNcq7lx4bGzgQAM88oz3m8U44orrOVDkWyKBy6Pr0WL1askM4uZQvEMv1Wlm7GfUSenaGd9Y+qeFPoXGaxqzKh5THrVRQXY0OMF1Xm6t3HLtZJpjUHb0yIuMexTx8CQoRV0EaA3KqEqxcuOkZHYLtjtfczMZd3nxLH/b3UtDE918UIv6jI7v/rZRdTQYgQxZ3KfxZfb1TiR0qkrxk2SkJxEYCF1fcKW6UgEzqSNSE9m1tTrG0JcxEkRzocgTFaKUZ1hWuwcyTQBsNlNubuSEmWT3RuVoblwqWccwiJyDP14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs+KudK1TELx7zWGyjdbH52iDjnTZ3b/b7KNxHZuInA=;
 b=J2zFesL1VA0tfWMJebJZyakUTCJ/wBxSSdaqN4qALoBPdvaiQwHWWlkHg8q1mCkbBUSPkKTq4E9TLDRnc34ox7lgSgoMKG+VHskp/FpkFdic5BNV3dW+sLP8ihvKxojjtWrGro2SeA/2MvgGp/4RzcfndBrHRHy+mRH0rssVf3w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a4e314e4-2cc3-456f-9d1a-dca38e3c1433@citrix.com>
Date: Fri, 25 Sep 2026 09:29:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] tools/libxl: Add support for Viridian stimer
 direct mode
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
 <20260911091244.1165516-4-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20260911091244.1165516-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0222.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::10) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN7PR03MB283467:EE_
X-MS-Office365-Filtering-Correlation-Id: a51b1a7b-3e91-4e06-fb2f-08df1adf21b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IRUvS7ENp7tuILXdq7X8Oy6grecr696SDU2ugsm5Cr4DeDCayxrN/aEGUmRFLIijmkv8b3T7s09Q8apL0wlxb/aEQDtAec0Wf8OzhLR9jzm2ZC0GZ4R15RNGAWcGXpP90h/5/DUjP91q3MLeexZoR6vYeS6GLkI+o3z/ulnw+7SmikUZ9WAP4KJYXAmJa9xcSDWNnut2q8yIdsJ+1pQKQbdCtZOzZJK+gjgRuEKf7UO7GhahKXumW28L4NwiQtntue9avrfU+9W+4/nI2lrl5HQ+/5Lf0ez0x1+ChJnJCwOqnibui4AAwx61r8RVKutCGM9MzXHhF0jQni2xOd1N429GBSrO+vQJEdwpkZRmp7+K5HBgz/nzDp+n4FuM17jwAL3nREV32+Evn8AV4uuk0+KSLXDqwkXLSYSymhK1SKB63fR31sE1Ll9Bn95Xw2hHgbFCn8WYVPGvQ8vqebLBHgYfL8aQwd0iXh/Ekbr6FPnc0T2w0cA7aqn0BNkcuwZRnwsmHK8ogqUV1ZqfgxfgHr5QVPX8uEXeEnxbm1id0R76cE/hgRZbbLPPuSy1bf6qW27BVZcsGsf0bNAJEb/dBbSd3t8fhEKqAb0lfPFbytv9bXh6KCM2hV4XKqnFPRLPSsiNqQh+jHuw1ftDqqoMyeesizgqopVKaK1acQa2fjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkFVQTBKdS9FMUFGZVRGSUF1c1JmeHZmb24xdGo1clZiVzFrcWpER0dBeXNW?=
 =?utf-8?B?cVdTS2hZWnR1WnFqVEc3NDNmQ281SndLdnRFRVR5SVpmamVHTE5RMlo1Ym43?=
 =?utf-8?B?QXlQMTJtVmZlb1NHVFMxQ0F3MmxxUUNFOTE3NzhEQWQ3ajhHd2N0TFV3ZDBr?=
 =?utf-8?B?V2EzSnFrRXg1eTlSYkd2Sjl4aG1BK1Z1K1hnVmlyY2JnWGVnNWFmengxSlho?=
 =?utf-8?B?dmdZTEcxTlJ4KzUrejlCR0VEMWdaMWVQdFM5d0I0UnpoVFFKNGdTQlZVQndp?=
 =?utf-8?B?WFBoeFNUaEZ3eVV1Nm1pd3lIT3BWbGd6T3ZlOVNRaEwzU0IvRG1ZRlRDV2V5?=
 =?utf-8?B?RDBRNDdFM0xvcTJmRVBjak1vNFZYejNpcmd0NjNzVzMrT2U1bzA1R1pBdmFx?=
 =?utf-8?B?NHlVaDYvNVlZUktCcmIyRkwxYWhBTWgxUHJRS0tzZURwL01nYmZ5TFNGUXRy?=
 =?utf-8?B?OHBLdE9QdmhYTjRVNk55Skw5RTFrcVQySEtrM3pYbHQrczFwQUprWk1lMFp3?=
 =?utf-8?B?STBQa3JkV0Y0c0wwMDNqS2t1SGVxeDQ4QkFsQWdoSkdyQ0R5RDVrVlFJdHNk?=
 =?utf-8?B?TzhkVnVwQklrK1p5S0RZcE1TQnJCSWNzVnhqTDIyYmhTbXhIbWJHdmR5Q0k0?=
 =?utf-8?B?dEVVbTYxNlU1NTBkTEZYc05ZUFZYRFZKQmN3ZFQybWNLT0F6amFDM25OM3h5?=
 =?utf-8?B?ZVdUR3NrcjZIeC8yRTdQRVcwbi9SdGhyMjU0UHNHYnZVbERTRDdRaDhveHJH?=
 =?utf-8?B?cGdLMFBJc2VYSEdlRTUwMmF2dC9ERzN2bnZRWTM4dGs3S3N5MW9kWUpEbVNp?=
 =?utf-8?B?UFpSdm9sOU9POEkrTk8rcWVYQXVXQi9UUm5HbzhqdVdmKzAvSndRcVhWbDQ1?=
 =?utf-8?B?djlOZEZtQWJrOGhFa2V6WEhwZGRCcGk4bTE5MmtqLzYzTkR2UU9KZlE4a29B?=
 =?utf-8?B?RHhDcnFudk4vTjlaQkt6QzZsNCs3U1YzdHhuM2pGcWgxY25EQnpZM2lzUmIv?=
 =?utf-8?B?S0lrUDExVzRlaURpb3ZSNHBMYkx6NWJBdnJkeUtGK2VBc3BwcUF5TDlFM3Zn?=
 =?utf-8?B?WWU0Y2JQMkFKeG1idkkrenRYTWtDZVlucDBMdUpVOVo3UmVydXRkeVpGSnFL?=
 =?utf-8?B?UHlWdlpjUkk4eHFzMTYwK3NDeUl2am83YXZLSStzQVRvREFZQnk2RjRNTzRr?=
 =?utf-8?B?aU1LOWpDcXEwZjNOVWNyVi9pKzJiWkdKeVdqZGhOTFJXTmRWbFlUbFJJSFlo?=
 =?utf-8?B?ZndHVzVYTTNkNDBYcmlTSVJHVDB0MW5YMzE4TzBwUDJIZ0xjNFRiTUNTenRm?=
 =?utf-8?B?cTFTUjc2eDRGdVlwM041c0p6MHA5dWlXc2xZaDM1ZXQ2aE00UlUxejh1bUp5?=
 =?utf-8?B?aXRKVCtWZ1JMNng3NUNTeVN3WnJuOElmSE9zNFhmaHA5ZEtBcFpxUk5iQS82?=
 =?utf-8?B?aXlrQnhHY3FlTi92UjZQOXJDMmNncEt5VFp2WUg1S1R4ZUVXZVU0QXRYaE1X?=
 =?utf-8?B?N3RQRVQvTVJzZ3cxeFZPL2ZGUjFaYlhNdVhKUWF3L2xYRGFLRDhseVp2T3Fh?=
 =?utf-8?B?d0NscGsxbzBoMytVMTV4TzhGN3paSmlCOHdVWkN2T1pZbUgrdEtrU0h0WUp0?=
 =?utf-8?B?ZXo3MWovZ1R1UjYxUmZzdEo0TjhwbDlBU09xQUVBbnBzdXNaYzVxcjZhdk5U?=
 =?utf-8?B?Ukx2UnU3U051SE44Y0J4OXdkNWtONUdUeGc3dDFpbEI2a0xnUUJGREV2cTlx?=
 =?utf-8?B?N1lWaUVkU25wUTYrejMrWWtNd2x3dkRuaFdqZUkxWUhRWGgvTDhFSEZtaEpF?=
 =?utf-8?B?L1lpMWN3YkVCUzNnMHZQWUliVlRmU1YwZmVKRHJxNjhMYnVtT3E5ZFNZWHBG?=
 =?utf-8?B?TjlGcG1oeGQ2LzJxdkN4VitLYkR3THE4N2RHd3NBZVpITDk1L1RzeW5LM2lU?=
 =?utf-8?B?VHFyekZnYUlwYnR4YmZPZVFER2RuVERDc0dnZm9JcVdvMFJVZ1pQaFN0ejJW?=
 =?utf-8?B?SFV5UndTYWxtOEtsaG12S3NpK3lZZmEweGN1UVRWb1BTU1lkSGFuRm00MjBn?=
 =?utf-8?B?MHVmcUE1eDIzb3dtSmFMSVF2aThrdWxSZnlYK1ZQSERNdFIwamozV2RxU3la?=
 =?utf-8?B?OWRVOWZGUHhrTFE1bzRyQ2lMdXYyTmVtRUJiRmFSRHh0VDhaZURQM0ZkVjd2?=
 =?utf-8?B?UXYwSDNETVUvVm9ETmpXSFhjaUFIUk9jN0lpQ2orM3Nha0JKZk9mMmdYdVhD?=
 =?utf-8?B?a3A1M25RZ1c4SlkzZ0k5RTFBMnNObkxmTmZXUnFUZXcwZkdvc1lLZUlubVlh?=
 =?utf-8?B?Q3l6K0dTcXFsaDE0WXI1M1lPUVk4SFBZbXhpSGJzb2puRk51OHFkU3JBTUFO?=
 =?utf-8?Q?aXygV9Z/WECfYBS4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51b1a7b-3e91-4e06-fb2f-08df1adf21b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 08:29:35.9028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzDo+p9KucWsZB9OumjGQ8/98mE2o+EU4XFPTLxTvyqlVdMbkSVd8rTARZuAlWCOv3icT2m1su/e4IT6z15Qn9FeJy8V/n68hUJ2rSeI3CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR03MB283467
X-purgate-ID: tlsNG-16d1c6/1790324979-1F6C877B-59AB040D/0/0
X-purgate-type: clean
X-purgate-size: 3051

On 9/11/26 10:12 AM, Ross Lagerwall wrote:
> Add support to libxl for using the stimer enlightenments in direct mode.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> In v3: Fix typo in docs
> 
>   docs/man/xl.cfg.5.pod.in         | 5 +++++
>   tools/include/libxl.h            | 6 ++++++
>   tools/libs/light/libxl_types.idl | 1 +
>   tools/libs/light/libxl_x86.c     | 5 +++++
>   4 files changed, 17 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index d34951edb98d..30c401588fef 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2496,6 +2496,11 @@ ticks and hence enabling this group will ensure that ticks will be
>   consistent with use of an enlightened time source (B<time_ref_count> or
>   B<reference_tsc>).
>   
> +=item B<stimer_direct>
> +
> +This set is the same as the B<stimer> set but additionally supports
> +using synthetic timers in direct mode.
> +
>   =item B<hcall_ipi>
>   
>   This set incorporates use of a hypercall for interprocessor interrupts.
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 7c098edab663..5475530a5002 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -381,6 +381,12 @@
>    */
>   #define LIBXL_HAVE_VIRIDIAN_HCALL_IPI 1
>   
> +/*
> + * LIBXL_HAVE_VIRIDIAN_STIMER_DIRECT indicates that the 'stimer_direct' value
> + * is present in the viridian enlightenment enumeration.
> + */
> +#define LIBXL_HAVE_VIRIDIAN_STIMER_DIRECT 1
> +
>   /*
>    * LIBXL_HAVE_BUILDINFO_HVM_ACPI_LAPTOP_SLATE indicates that
>    * libxl_domain_build_info has the u.hvm.acpi_laptop_slate field.
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index a7893460f013..95075f04fe45 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -260,6 +260,7 @@ libxl_viridian_enlightenment = Enumeration("viridian_enlightenment", [
>       (10, "ex_processor_masks"),
>       (11, "no_vp_limit"),
>       (12, "cpu_hotplug"),
> +    (13, "stimer_direct"),
>       ])
>   
>   libxl_hdtype = Enumeration("hdtype", [
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60d4e8661c93..9e8b48372d63 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -389,6 +389,11 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>       if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG))
>           mask |= HVMPV_cpu_hotplug;
>   
> +    if (libxl_bitmap_test(&enlightenments,
> +                          LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER_DIRECT))
> +        mask |= HVMPV_time_ref_count | HVMPV_synic | HVMPV_stimer |
> +                HVMPV_stimer_direct;
> +
>       if (mask != 0 &&
>           xc_hvm_param_set(CTX->xch,
>                            domid,

Ping. Note that the Xen side of this has already been committed.

Thanks,
Ross

