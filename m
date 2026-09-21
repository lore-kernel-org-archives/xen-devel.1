Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C52C982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 13:45:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427559.1650353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eKy-0007jq-3q; Mon, 21 Sep 2026 13:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427559.1650353; Mon, 21 Sep 2026 13:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8eKy-0007jj-0V; Mon, 21 Sep 2026 13:45:40 +0000
Received: by outflank-mailman (input) for mailman id 1427559;
 Mon, 21 Sep 2026 13:45:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x8eKw-0007jN-Aj
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:45:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8eKv-004iH1-BD
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:45:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab134ea-8faa-0a2a0a5109dd-0a2a450489da-40
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:45:36 +0200
Received: from [40.93.201.3]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab134ff-b57f-0a2a45040019-285dc9032496-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 15:45:36 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by CH3PR12MB583062.namprd12.prod.outlook.com (2603:10b6:610:363::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:33 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 13:45:33 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIfxxN1rbzRyReJZf96pA2tayyreT90A/0bkfZMYh+UtpK1Br5UGV0fC1pGU/Ach6c6mZ1knbu9sJeO11wdaiJ4spC/xqaS8pB4QPgxYrDdL+n6Uze6MemDBhSfO9G+T8b8qjFvMCdoKu0mx5w8vZOOsznlZ+gkP1qMFDnOcqh5FMgJT8C/01MjHWpsXPCgO1GLHSKWFngRHvwf09/0cEUZvNxJBhOuSPxwJ0ggqiQ117Mql/Ad3oWHr6pDx5zZiIKPjpumqQZ27SJQ+E8BVCgqejmrsb5uUUsCoAiiaJWLCCVdwnBjOd5GRWqaSziLn6163p5UIvAYx+E+Ofi1LWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRdMISli17M+yC8zih0JwBATihEq8UyVr/fg5WG9xB0=;
 b=uY9ToNmb5OIsRmCkQVnpNucbaIWzy+uduRajlXn52MZnVPE/xvw8meIOjnPGMruTOxiKulk7n9OFCdo6Q9rSM3YorOz2c0ejxNbD9P8PK6zWcdpvA1WzTHfojbA/xD9Urmk03mDbohbrneiUgNhK3rNy2mVfnL1yIhCnbDvl/dY0Cii8DwKB8TUPUtvIAQk/Wk2x6/LbLHPudECT3LAvblKtFp2WZd42iMkoZMkscIDSZUqJhpU/CSC3raOXoyk1tXceUXTPvX0B8nTgkkfkddioXYvAHvrrYDkdFf5DwN+xbAzzCv7k6PtMUwhiR3YQO8qLoVEpHnyOiTDT73mH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRdMISli17M+yC8zih0JwBATihEq8UyVr/fg5WG9xB0=;
 b=gTaTVgiwy/bCxRWih7wI5ENkLBKoILYCGzuFwNzmxLRGMzU8OHSgTisG8+wQ8BNND2Dd5NMOVQtPCxUNy1RXne/VstJp72SiZPPiczudciW7+jM9bZ+DrP0lJEzc1qPaYP4nhSlY+CbS8/KaJQhxCIQYydHfvBs3UNSddvXnbGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:45:29 +0200
Message-Id: <DLL1G8IR03BR.3KDSA5APZ73TY@amd.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Teddy Astie"
 <teddy.astie@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86/HVM: replace paging_mode_hap() uses
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Jan Beulich" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <f456b455-bcae-46a0-b68b-cebf31afa38f@suse.com>
In-Reply-To: <f456b455-bcae-46a0-b68b-cebf31afa38f@suse.com>
X-ClientProxiedBy: MA3P292CA0038.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::7) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|CH3PR12MB583062:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e264c7-b7fc-49d0-194b-08df17e69bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vKvTpRZNS2syJJKo5/v5Nqu2dmlnsJPuI2ZJI+SdHBBsBGBsVfat9udDcDsF4sOu2APwfaRPciTNH5m73sOUfhTUyADEfHc3RS1FNUEIpp3tPHw3wIndhPAYcJ39e5EgpakZdzV0HiGvb2ZfjSqJXXCkM7jOUlKbEf2qRH35m0f5IbDycjEOYApLUJGrOB97Ktv2o202Jd+H/hP7O77aZI7ugNbO3aAzcHewkWjsX92VhbR/ONejrLCyFLD6+0NrW/WcL569zn2FYC9GmeeGkl/FDhSRT6JFcBm4DnpQ/Z2t6OW2zjUdY+1+lsWdzqomI5qEbN4YHjumfcDzVgfDhVmXpEBdPBkgyExvvVf8U5bUWp6PQKs2RfinvxtmBQp6tA7mgwZfUZ8yMWTr1Z9cakcBR5yjuMeskUUnZVW4zSDdq7KP7ok0oX3R/1c6tuS7Vub+YVhpNriswr4/K1tQwTXd9vJIjQGOYrFo8thdfxG25l13vJ0lhR/JOMeOeglGnQG+DDW1BeT4+vsXR7/3AMBq3XlWnGXjx8ounJ7+obEcygGDfReW5uHJFTXpX+PkNkCmCeukB7rjz6j1s8upO+bsrMRGMcvsIQmYwZDOout3fV58n4l/bHC64hY6pJuIva1ck0LJCXqDpckTfm7WOemZPX75wnV9XlO8RQ+AQSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0t6RExMdWNndDlaTWJVS3VYdGp0UTRyZzZzck03eXl1UmlLcGtJMU0xUk1L?=
 =?utf-8?B?TFNuRjMrU0RIR2h4cWNkMnBlanV3Y3NOamVrL1NBWWtucHNFejlaUkJJM2xq?=
 =?utf-8?B?NWQrNEFhZnUvbGFLejRON1Zac0FDd0tiZFdHdGxYOGRJMm05ZklHR0hzVm12?=
 =?utf-8?B?RGE3VFZVV3pXdVRiK2M2SWVQdlJJc0JQVzA5UHUxSHhwcm1HUEdHMnU2ckE1?=
 =?utf-8?B?cTJVYUplSUlMTmYvZTFJYS85bTVSb1MvME9lcEFPdmtUNzdkbDhINHdCdzh3?=
 =?utf-8?B?SGFkL3BUVStQWXVYZ1lrOW0rUDM1TkFJOEhpUXN5eHhUM1kyTkkvRjVUR1NF?=
 =?utf-8?B?UXpHQjdWWXFuUXRSMTBPajNuVE1VZnNnV0RROEZwdG1LSlN3alNIMUlCR1Nz?=
 =?utf-8?B?cDRCMi9Sa3VGaXBMZzRGWEY1ck12ZEtXMUZhRjE3Tk9yNkxxazRac3E0bk5q?=
 =?utf-8?B?Tm85cURHd05pOUdzLzZRV2JCSGtTQlptb1M3aUdoOEtlN1gzR2JuZUJ6QkMr?=
 =?utf-8?B?YUp3eWNXWjN1MnVGcVRXYTBsMWVHTUxEbCtaM08rYTQzaGFURVRtOGpxanJI?=
 =?utf-8?B?eUpMUFJFWjJleGxPeTlxQUhYZVFlL3RNOVFIUGNqOXpMcitsVUdxNTdCWmha?=
 =?utf-8?B?bE11OThoR1F2SG9zeHg4dGZSWFRwa0RzazF4VStTZTVrcHAwR1cvM3NkSnY2?=
 =?utf-8?B?bENoZnJidGNvRWdIS1kxVnkwKzR6RXZmUnV0UHZrOHEyeGZNMEhUODBSK1ho?=
 =?utf-8?B?WTFZU3JJZm9UUXgweHZSVFhYU055VkV2SjQxMklGRVpzSlRGTDhLNlQ4SWpQ?=
 =?utf-8?B?aGIyZzVDUHNadFgxS1RaZEtWV29RRFdrUFNmTjErV1J1bWF0SWZvRllBYmVk?=
 =?utf-8?B?UjQwdENtSXFza0oxd1MzNVZFYVNXcEhFSEZBS0Ric3RoRW5lSlVZZk80aWtH?=
 =?utf-8?B?SVEzRTVZdkxiem40UDVGMTFQalVmWG5hcE45bk92Z3VOOTFZTkdweERTMnIw?=
 =?utf-8?B?Tk9LTWxTaGd1S2F3eFpUNUg1ZWowbU9HNzAybWNwenpaNEp3RVYwSkZrZmxY?=
 =?utf-8?B?a0NyVVlwM1NNN1VUYzlqRmszaElzenhieGRIWlFrbkFOUXAzWUlBdFVqdGRF?=
 =?utf-8?B?UUlHNVptK1Zod1FLSjFYY0Z0cWxBc1VRcTVRZ0Z3alVLeHg2VjQ5ZndjNDJB?=
 =?utf-8?B?ZmMwM2ZETkZoMFlOWDM5ckxIQXp1NEtNQ1FHdk5mOE5DZU1uQUhIOCtKSU10?=
 =?utf-8?B?Q2U2aGUzSGQxOWk4cnl1T1FxQ1FGdW9vVE1uSXFQdmllOGV2b3hqMDdBOVRG?=
 =?utf-8?B?OUp5YjBVaHBrME5Qcmowb2xoSTBtOWRJdkJSQ3lsZThZSmk1dDZKSEttSDc0?=
 =?utf-8?B?K3lEWTdEL0lVcXNBdFplL3JKRE5jMVBmZUN6S0oxTDRHK1ZQQmYwUXhzNDhu?=
 =?utf-8?B?eVlKTUVLdUs3YVpGUkFnQmxrK2ZVOWdHaTdQdHdjYXVCcCthd2JWb0JsUzN1?=
 =?utf-8?B?c0pxUzBUZi9GYThKbmU5QWgrK1hDRnZXN2I4ZmZ1S3FEWEpJL0J2V0dReHRJ?=
 =?utf-8?B?RGtvdGkwSmhQQUM2ZGxyVEFYOURiWW5DbzVsOE9DUmJyak92d3NCTi9hbWNy?=
 =?utf-8?B?Nzd6eHd0Mm15T3huRFlFVkFCT2txMU5ZUG84ajVuNnh3ZWsxMDUvemtNcm1K?=
 =?utf-8?B?WVp2NVR2K2phOE5CZ1dMZUx0cnllMXpVNXJWb2hwMDF4RXZkOUE3S0lWWW1X?=
 =?utf-8?B?aDdMaEtHQm83SlFvYUNsVjVUYXlzaTVmZGE5dlVsVFFXcDE3THJ1ME9MSk45?=
 =?utf-8?B?czVIT2R5aDYvQU5Gd3hCaXlLWjdkM1V3a1hvMzlSbEk4SVlBNytsNlltTGhP?=
 =?utf-8?B?WXhDbFI0Z2ZFeGJWREQyNitycFo3aXRURFg5bHBIQjRUWXJ3ZkhZdzhqeDVW?=
 =?utf-8?B?azJoQWdCR0dkRk0vMFp2ZUJJT1ZzNGFKUmwvSG15VlJiQmE4ZStDQ1hIaWZ0?=
 =?utf-8?B?VTkyNHBCc09xVm9WSDV3QjJqb05YS2daNGtiWU5MTnlFY2N6Y0plZW05c1Rn?=
 =?utf-8?B?NnBaR1phV0pIRUVSTlR2MFdXeU1LMW9FWmluOWZ2eUdsOHNyNXcrS3dmSE5r?=
 =?utf-8?B?Q1k1QUxnY0xWTURpUWxxa2pBTUYxTFJMQVIvWU1pSDYvc3E3RWFLWFBXUVN4?=
 =?utf-8?B?cHZyR0ZvRSs2VUVxYmx0WTd6a3ArSlhyWEhySlE2aEpERzV6K3JuWjl3aFNQ?=
 =?utf-8?B?MUVjS2NOeklmTUNUN2pDMExtV3dtVC9OUmFlTGI2bU1jNjdCYS9XZ1pCQkph?=
 =?utf-8?Q?1JSbfdTWuHssF35W5V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e264c7-b7fc-49d0-194b-08df17e69bb1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:33.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4d20aF3pV/APrzLLMjBhcb/vUj2it/PjGRw6pj1yLOzTAwNCTY2exyqaZpWFXcQjApGIJydFBIk8JyXNbj1lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB583062
X-purgate-ID: tlsNG-ebf023/1789998336-585C7B50-83884C6F/0/0
X-purgate-type: clean
X-purgate-size: 2101

On Mon Sep 21, 2026 at 3:19 PM CEST, Jan Beulich wrote:
> HVM guests cannot run without either HAP or shadow enabled. While
> paging_mode_shadow() is compile-time-constant when SHADOW_PAGING=3Dn,
> paging_mode_hap() isn't. Hence the former is preferred to leverage DCE.
>
> In svm_update_guest_cr() combine two adjacent conditionals.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Yes, please.

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

A couple of nits below. Take them or leave them.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -113,7 +113,8 @@ static void cf_check svm_update_guest_cr
>      switch ( cr )
>      {
>      case 0:
> -        if ( paging_mode_hap(v->domain) )
> +        value =3D v->arch.hvm.guest_cr[0];
> +        if ( !paging_mode_shadow(v->domain) )
>          {
>              uint32_t intercepts =3D vmcb_get_cr_intercepts(vmcb);
> =20
> @@ -122,9 +123,7 @@ static void cf_check svm_update_guest_cr
>                   monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
>                 vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR=
3_WRITE);
>          }
> -
> -        value =3D v->arch.hvm.guest_cr[0];
> -        if ( paging_mode_shadow(v->domain) )
> +        else
>              value |=3D X86_CR0_PG | X86_CR0_WP;

nit: This would be clearer with the polarity reversed. Check shadow
first and have hap later. It'd also make the diff (marginally) smaller too.

>          vmcb_set_cr0(vmcb, value);
>          break;
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c

[snip]

>      v->arch.hvm.vmx.exception_bitmap =3D HVM_TRAP_MASK
> -              | (paging_mode_hap(d) ? 0 : (1U << X86_EXC_PF));
> +        | (!paging_mode_shadow(d) ? 0 : (1U << X86_EXC_PF));

nit: Shouldn't | be on the prior line? It was there before, but seeing
how you're adjusting indentation might as well move that char.

In the same vein as before, it'd be a bit clearer with the polarity
inverted (shadow() ? bit : 0 )

Cheers,
Alejandro

