Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF409C5516D
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 18:08:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378361.1623790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVBA-0002yi-1R; Thu, 30 Jul 2026 18:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378361.1623790; Thu, 30 Jul 2026 18:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVB9-0002yb-TW; Thu, 30 Jul 2026 18:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1378361;
 Thu, 30 Jul 2026 18:08:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wpVB8-0002yU-GP
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:08:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpVB7-0040dX-Fi
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 20:08:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b930e-5cb7-0a2a0a5109dd-0a2a4502ecee-12
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:08:21 +0200
Received: from [40.93.198.30]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b9313-6ca4-0a2a45020019-285dc61ea513-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:08:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CY2PR03MB587508.namprd03.prod.outlook.com (2603:10b6:930:112::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 18:08:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 18:08:17 +0000
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
 b=SWLOssulIXhJXBhAynwXsCLm+CPOHr9FcBULB+BMqH7AFc5qOdKcAQAwnUQ55VBtaNQNcE8V7XcXFKV6C3NgZitlCIIG98xOz+XB6uurOkBBWraYJstMY87uz6NocFjaOxOx2Dew7zZdGfs72I5CVsge2roK40iT+OhE+rl+3wPqQBNMbH7yn2sVB2njjh48eE7dUSppeduizLd5HD1r5pXMacUDAem4tBOa8AGEtL+E5edQv7JkKo7xPq1oKsskSq5KuHs2dSmLTLQjIylPwaZqZsYO5PleWdCvz9Jyoz+byQ9mIi1CdKOP97FOFni7Iw5Q1IQ5m8xHBUJ+p6D8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9mV654lpClCVXY2J+cjItmpV7ABR6fu/bXgjbjOC7Y=;
 b=w1jZ8/QBinrQTpycUUapxeY80F1jYD2JSbc3I8XA0Rl0QEwRaIZP5aCXzo/b0ftGMSk6fncZoEm9SF5f8DBrI7b4WpzxeyyQzQeurpDGxD8SJRM75CWxRiqnmRyyXZHt92ujAuUcfuXNKRLnLdhzgQ4xqBmetWbllvQWgl0k+pDfGwde2bL3p4UGwj474ziTvzMdmyGKazEwNVrKCR3Y1N49OzvgbbCF3tSM47KecaCUX1syd6DQDx3dZVkY2b+KnaOAiP1Li4LuuRGy+uM2OwOoqqxbjuVLL9yBTK1fIOJhNIlwpoOEib+Qr3c5m8SFLMPfD3Lr0KBLbx/duUMmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9mV654lpClCVXY2J+cjItmpV7ABR6fu/bXgjbjOC7Y=;
 b=w4d36qrgzB1FE0/MPsFyUkAOfPJwukmu/zLTZmNqhyUkumxaqzNGXrUDth15W7NoBMjTwMqKJ7WeQzQJ/v4wmu+xCcPmu2mgVQ/HymmJAlgym7jMewWfSg8Az0QK9F3i4DDpbFMRY5si45Tq0cT4Zrvd/F7Hilpaeu+ZC+buIDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2eb924b2-11fd-45be-b933-c6352fb2dfe0@citrix.com>
Date: Thu, 30 Jul 2026 19:08:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/3] x86/EFI: replace ebmalloc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
 <98388998-c5c6-4991-8662-2b4bf25188f2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <98388998-c5c6-4991-8662-2b4bf25188f2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CY2PR03MB587508:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ac2180-7314-4a8b-668e-08deee6587ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	E4jwIACBiG99BvPgr7hMA8/Q8YHYJUwu+Hz4LtzaGYLTGZHiSkBF/d5CaZ2amuLq7dckiuVUT6LFKCYB6ex3uHQmcPlE4WkuTj35ZLcdytY067ygeWkl48+7HZnOAycxIMF9yzALWikixrFxA5u+tOCMEDOE+ZsRrRQrzEkSt+wuXVv6yeR0BFieGq0BsGeihlhKyqRmmsywblAH73u3OfNs/2PybFi6vDshfHFmrhLPneumDcXMR5X8zQ4Do5EiVjK/VmQ42uys2fwEJ9KzfhUpxaQ7HYoI5vkfFRkDimOBfqoYYF48AVbf7ekARfUwsIMbxq+oF1UFKcgHKIvnrPgTcHk+uFn3U2zDindIxEGwNctGsydQCnKyxeR+64bzf8d0T0k5s+kXBnckFMRFuvRtg13KrI8CGtpN1ECsLBJS9DSZjU1XxBqjLGKVyhnh/3MCQSxUsQ98LSipY3fy0sB74P/XmNlQq1CP4ybZJg8jXFJG8yiyTxKMiEBmFAkxPsV/mgX+unl/fRzqMeDk9vYWFPS/oCdVLEb2CYOwc+5HiWbJ2EujLp4BbSRNHOq1NxHlzFMsMByMmL6LdchjdcWseUoz4NIDFQXY5yYeR8C3VCzMcz2ZcsKnnWvpZaB+btAKmHGeFFoA2PtHR0UHi/mfRwqBBEhEZSG2QiQIX7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG1FZDQyK3hSMWJrS00xVTU5Q3diM1VPaGIzeEZVK0RtMzdXeERkS0MvNGlY?=
 =?utf-8?B?ZHc1TVVwRE1CV1lSU0lpa0pWRjA2c1JJcVU4aW0xRkxmbStNcHFHTW1pYjJ6?=
 =?utf-8?B?dzV1d0MwbXBBNTc4SEMrU015c1lrT1dkbFNXRzhnc3V0VzZPZkQ4bXN6TW9t?=
 =?utf-8?B?VDQwbDNMdmNqMnlLRnYxLzdsN0RSRVVwbmJsaVl6NmdNOC9EREVkejMvS1Fv?=
 =?utf-8?B?bTUrRW1GdGhzVHVDSThIbDJZTXdLY2tBQWJiSUcrQ3hHMHpMZjNtVmZ5bS8x?=
 =?utf-8?B?VGV1YStwNmtJUm5mbFlQRVZTamRlVXE1Q2VvamZUbGRrQVBqZEVFcUFSVWoy?=
 =?utf-8?B?RWZxTjQ0TGcwU2Y2dEI1aHI3R0JNTHpkRENlZVl4NjZsTmhINFpGMGk1RjBy?=
 =?utf-8?B?MmkzREpsVFlVbkdGVytWQWJ4SXpXa0VobklCTFFqR0ZjVXQwYXFRc04rQUx4?=
 =?utf-8?B?NVJNVVUvbFpJZXNZZGdva0gzTDFzTmkwM0FRVXhVcVUvWlFWUFVEN296aGsz?=
 =?utf-8?B?T2ZIb0tlR1lxYXpMUmgzZmhqdEE1VGVWL3YzYTFSaHg2YXpuYnB0THdXenls?=
 =?utf-8?B?eTJPOFlNcUV1ODNNMzU1MUo1N3NpV0lWcS9JcFdqc0tVc3N1NWxkOHo1aW15?=
 =?utf-8?B?ZU5nNzJwVG9iam9lTndzL2dUNE5lc05LRFJTa3ZTOEpMT2NHZnNNRHlpZ1pC?=
 =?utf-8?B?azZvblhDUTRwb09PYWRYRk1UalJxOWFQc1lWZTg1V1loSkF1TW5Tb2RIcXV1?=
 =?utf-8?B?S2hUMzREdExhc2Zzam9GOWpzMUlXQWhnU2JkdDhLbGZMQmtjOUlJYWNDbkFj?=
 =?utf-8?B?MUNiZHJHcVJObUROSmZZWHRCeUN3L1M4SGkySkNPZjl5TW0wdC80ckNzbTBX?=
 =?utf-8?B?aEZHQ0ZlL1RSZ2dhTEFNbjRjSDV3L3JYTEdIbURpMExGY0tNV0FaZlFicmto?=
 =?utf-8?B?aElYUHJ2bllXV2VEMTRkN2tEcUF3VUtLeTc3Z3NFUk1DRGIwUyt2YUo5SGlp?=
 =?utf-8?B?TkIwL0F3MTlVWUlvMGxLMThoRWY2ZDBNVGxYRnZjbkdwK0U1cmkrMmdld28v?=
 =?utf-8?B?ckRXZWljbDhldVVOck5zR2NiUDRPTzRKR2c4Y3N2Ly9ibEg1YmRqSUFZdlhK?=
 =?utf-8?B?WmtmVFdTbnZrRVVmeGVCWHRmeDZZWUx5YzhWaEhvQ1lnTEU3SG8zVVRRaFQ1?=
 =?utf-8?B?N0JPcFFUM20xb2ZKTC9Zd1ZMMGNTOEJqeEtJcHpENVl1bElGTWQwZlZCVkUz?=
 =?utf-8?B?djJxUWNSc2k0NnBFcVBFYjdtUWZzM3ZubXlya2NWdTRVMnYxZnY3WVU1R3Ns?=
 =?utf-8?B?S0lNQWliT20zSXowZVBBM2JNaWZpREpGV1lxdnhGWFlvYjcvd0tPODBCNDAx?=
 =?utf-8?B?MGZzQkhlRElhT25pdGRQMnY1N3ptMVh3dGZJMWNMSDliZG1XbjM5OU5ZYk5n?=
 =?utf-8?B?aU0veDlCNlFZWUJMeEIxcVp1WUFOMm4zcms2b1dyUXo3TXM5UTFpb3NBSURn?=
 =?utf-8?B?L2NLUU5zLzM1MCtNNjcxMjZTMHBjb1hYMm83M1Y2RzR1RlJCREhqSlg0dTcx?=
 =?utf-8?B?VUpMSTFpbGJRZTY4blJxUnIycGdNQU1wNnoxamFjMHBaa2ZWd3hleCtYSEY1?=
 =?utf-8?B?Y0lXNUZGeVhkbDU5NWYzN1pkZVBpVGFxUUVmM3JMaXJxbG5lZFlDeXlLQk1s?=
 =?utf-8?B?U2tDTllzckNNWnlta2ZPNGRxUS91NFFsVjRxWWpobTI1VksvR0NKRFUweDk4?=
 =?utf-8?B?Y1hqaW5jUi9Na2J4S3daZ2dOQWFKeE9MRW9YOVoxeGtKZjRxYmovR2hEM0RB?=
 =?utf-8?B?OHRZVitQM3M5aWw0WGhtMmQwR2taT2c3Vzc3dCtrU3MrV0I4a214Q3lqVlRv?=
 =?utf-8?B?bVNjTW1RVmIxZ0RjT0tINzhwL3ZJc0RzNkdzSFJNeTA1Q3FOeG54M2xOb0xv?=
 =?utf-8?B?VFMzeWdYa2VxUHcxVXA2TlIxanRlYlE0bEtXZDRkY0JUTjlUa1pZWWZBcVBl?=
 =?utf-8?B?cmYwWnV0M1JyY2VTMnBmbEYyY1VsS28zVFpwM0cyNVh4ZTFNNkZlWGpweUEv?=
 =?utf-8?B?T2l6bFZFaFVPcEJWcjM1OWtzdG1rUy96dkZuYis3M2pjZFY1bkZqVGEyZmNu?=
 =?utf-8?B?c2ZYRTZ4cUhHTEpwbGRCY3dCZGxzczRUcUlrcTd1ak04aDRySEFuZzhITVAr?=
 =?utf-8?B?bFFrWTFNWFRBU1gxWnNrOFErT0ZKVHBJVnQ0bWw3eXBia1ZHQ3Nncm9Vamxr?=
 =?utf-8?B?a0c4aVJTc2RjMFlBRytXR1FKQWR0SlhWZmNHMGh6enRvSTVVWHE3V0pSNndW?=
 =?utf-8?B?UGVYNkhlV1YyZ2lBUC9zR2ZZSUUrcnlyN3FpeWFYYVFZRUc3czFGZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ac2180-7314-4a8b-668e-08deee6587ec
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:08:17.3573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8aPSv67JEn3g5EhJsHntETK2y5qnECW2Fmjdyd9CEXVs6aBxjzsrUyiBikEB8BQv314Xt++c772zJTVbEry8dumSr688f0kHe8N2TOS7D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR03MB587508
X-purgate-ID: tlsNG-720697/1785434901-30BC02AC-4B098906/0/0
X-purgate-type: clean
X-purgate-size: 2977

On 27/07/2026 11:20 am, Jan Beulich wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -31,6 +31,7 @@
>  #include <asm/alternative.h>
>  #include <asm/apic.h>
>  #include <asm/bootinfo.h>
> +#include <asm/brk.h>
>  #include <asm/bzimage.h>
>  #include <asm/cpu-policy.h>
>  #include <asm/e820.h>
> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>  
>  unsigned long __read_mostly xen_phys_start;
>  
> +unsigned long __ro_after_init brk_end;
> +
>  /* Only used in asm code and within this source file */
>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>      cpu0_stack[STACK_SIZE];
> @@ -1141,7 +1144,6 @@ void asmlinkage __init noreturn __start_
>      struct boot_info *bi;
>      unsigned long nr_pages, raw_max_page;
>      int i, j, bytes = 0;
> -    unsigned long eb_start, eb_end;
>      bool acpi_boot_table_init_done = false, relocated = false;
>      bool vm_init_done = false;
>      int ret;
> @@ -1511,7 +1513,7 @@ void asmlinkage __init noreturn __start_
>          /*
>           * This needs to remain in sync with remove_xen_ranges() and the
>           * respective reserve_e820_ram() invocation below. No need to
> -         * query efi_boot_mem_unused() here, though.
> +         * query brk_get_unused_start() here, though.
>           */
>          xen->start = virt_to_maddr(_stext);
>          xen->size  = __2M_rwdata_end - _stext;
> @@ -1654,18 +1656,11 @@ void asmlinkage __init noreturn __start_
>      if ( !xen_phys_start )
>          panic("Not enough memory to relocate Xen\n");
>  
> -    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> -    if ( using_2M_mapping() )
> -        efi_boot_mem_unused(NULL, NULL);
> -
>      /* This needs to remain in sync with remove_xen_ranges(). */
> -    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
> -    {
> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
> -        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
> -    }
> -    else
> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
> +    brk_end = brk_get_unused_start();
> +    if ( using_2M_mapping() )
> +        brk_end = PAGE_ALIGN_2M(brk_end);
> +    reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end));

Hiding brk_end in setup.c like this is quite rude.  I guess it's because
you want to have brk.c be brk.init.o, but it really does live with the
other brk functions.

Furthermore, having brk_end right from the outset fixes the fact that
brk_get_unused_start() is doing things beyond retrieving a value.

With brk_end being the real bump pointer the allocator uses, then the
only function you need is brk_finish() (name subject to improvement)
which is now very clear about the point at which brk allocations cease
working.

The rest, dropping EFI's current ebmalloc() all looks fine now.

~Andrew

