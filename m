Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A87DC9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 15:59:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432620.1653791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lqp-0002RR-J9; Thu, 24 Sep 2026 15:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432620.1653791; Thu, 24 Sep 2026 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lqp-0002RK-GZ; Thu, 24 Sep 2026 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1432620;
 Thu, 24 Sep 2026 15:59:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x9lqo-0002RE-11
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:59:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9lqn-0060Ya-EA
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 17:59:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab548c3-8faa-0a2a0a5109dd-0a2a4507eae0-18
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:59:09 +0200
Received: from [52.101.85.10]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab548cb-b4ea-0a2a45070019-3465550ab369-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:59:08 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by CH1PR12MB9718.namprd12.prod.outlook.com (2603:10b6:610:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:59:00 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:59:00 +0000
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
 b=XK/2eedU0ipgPn0Ce+GMnCUZQZYpFH6HXDVuv9GRmNEte3k0EfR5A1dITeveOGsjQkie/MpoGKv6pe3wOQlUf1ooGZd9ZUqPqcdKgwhuxgX24ssKmw5f0ROP10EACVT2PVty9XYVmc/aVH76V/XICLRdxaqUwEJ3HGxqWh5BR+L8yj7yu31r78/7OxJqe/sPVkyGyaX30oY6JUKyv5MQWoWD5O3wmYYq+W+B5Y2DL6970Es8EAZaHYkwEAANVnemVlA8P+a13hueHWY2FLDykgGvDcVWlCkOTA4QK2TljiY3r676f0keeGktCXU6vtGFtFWnC0y6vTP0wZKEJb485w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6hdd+WxYwINwdvB8aBG2UPN/VWbPUZ4KqepmVC0zWE=;
 b=wqkGUi9QixA0rG06tJaMWMX3syGzZlPh/GuD1mdXOAwvCLgYGteie35wEvJIw2efiA1gFhSZzrv0hN4PALKNpfqQhXFIeVfuZLcxCe1KM+nT/YLTf13g3C/RBSqWQYjip12QWxdRHetzN+4fKzIEGHgomJ6v8EeNRAZZBnQ7tB2m3jbuata69wCZhOtSSjoHrgpfxAVinBdnLZkyGuoRMDocfXVLvEXib+7gMl5Woyl7aTGMt7Oiz1cBpIoFQq1AEXcY8AcTeqAQPU9pr6k4NE87mYpDezZbOShV5Dk4M1ikB8QevKsmbfiLgFI+hJkua+d8cbCpZWbBVSE/tdhAwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6hdd+WxYwINwdvB8aBG2UPN/VWbPUZ4KqepmVC0zWE=;
 b=z+teFcFkSGUN+lX39SKoYcoK2M6H1uT/yY5mn0rXO9hGNu3SsRjWDXh7PsmMQrAo+Oeg771OfqykFISBm6ZZV6gf757J12Z70veYXF65u5iPl6DflnbpxTf3D+L1ai3zrMuM5+nE8smwEJQ2JsdHmaS9+HgSAqDtzt2TaJfbeYs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 17:58:55 +0200
Message-Id: <DLNO61C820D2.2TSH4227QA8DB@amd.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk"
 <Volodymyr_Babchuk@epam.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Anthony PERARD" <anthony.perard@vates.tech>, "Jan Beulich"
 <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, "Timothy Pearson" <tpearson@raptorengineering.com>,
 "Alistair Francis" <alistair.francis@wdc.com>, "Connor Davis"
 <connojdavis@gmail.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>,
 "Teddy Astie" <teddy.astie@vates.tech>, "Grygorii Strashko"
 <grygorii_strashko@epam.com>
Subject: Re: [PATCH] xen: Consolidate linker script setup data
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Jason Andryuk" <jason.andryuk@amd.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260923161935.24429-1-jason.andryuk@amd.com>
In-Reply-To: <20260923161935.24429-1-jason.andryuk@amd.com>
X-ClientProxiedBy: MA4P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::9) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|CH1PR12MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: f19e7abc-3805-4d5c-3e62-08df1a54bf8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4u4vukta/WWQOwaDCD9i3tTKN4HRTyOjgCkQmrcmnW813b8dGoZ+Bmj1s+6NBLJ08RgYXOZiQOolWWxLHePhBzFBEttTjT9RCnxHT+hMwfVMu6qf7WUH2ai9IcPWbRVDqoMMYWCfsmvJmFA/WyREMyIGQfqS9+en2Nf4WMRbbeZRMHAY52I1FvFv8pnYzS3HGdPmH3dU8HoRGNW+r31HbePyQTUBTII3pxDX6CHYRVxAJ3xgcAu8OqPyFxGwfqFrN9FBqDI3rSYKDulVqSvl+R7ctPBZ9zBO8UwgNNj1F2kC+GioaKGQ4DEyO7VCcQwFtAAB8Af31dzSABKvEecHKJKaAgwfCLStunXDodbtMaVMk3YbpAc6k9pIN5weBhY/XU07jnBnEPS8Op9UC9wEzKeZgA2+jD6zneBJXma7doxVbS5BgLfIxVr3sA3UJgQNJC7lt/OgHtP1VHq42841Sd6jTlllhTGmzHE5vLnZhGhs6bIC0+4tEUtT03FvcJlAeG6n89dVPxiJVKEihfPYW7/woA8CrUf98kkY1C2qgZjtjpDe3XATbTDxWckaTlBE3qMRTlwXeF6evC6GRd1g/yeio+UmtdjF9stFCVJDHd9o8EmyRLDID+QRnhkbe6sd0ZtyvEbnAJCm1ZNnHB/LXCfPbr3ure2Q6qWzyPOtnhk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3ZScmNsNnh0WXdBdmMzTWh4MFhwcmt5aCs0VTNBQWxGTXNncmcyR3BGMkU5?=
 =?utf-8?B?cDlhVWw4SlY0TGxjaXhSQ2Y4ZTZnd3ZJNHphNm0zNUl5THdIaUZZYXkydVFU?=
 =?utf-8?B?TEdkd0NBRzVmSm5hZ2NsL2tCZWVFRi9FU2ZYZXhyUmtGS1dNaXJrb3dmWmdQ?=
 =?utf-8?B?amsweTB4TzgyUWxlalEzaWtDditIVExRZXZwa20zYW85T21IVFkzNkxwbGxK?=
 =?utf-8?B?clBZKzlNNk9LQ0RDbFdFNXAxdDFML0xXc2I2bUtxdENWT05idldJS2JleHky?=
 =?utf-8?B?R0dMdlpDa2JhUEoySWZ4QUs0WldobmxOQ0c0SlZ0ak43cVJJNUMyR3I3UEcw?=
 =?utf-8?B?NjJhVTArazVKdG9kbkpxNEIwM1ZyMnJHak91UkhvMEdMVmRpaGlyakdiTXlE?=
 =?utf-8?B?dG5PMGdSVWxlU3pEcXlva1RtZ0tETXJtRVA4NGU0eFptcmdyU3lYaHMxUDJ5?=
 =?utf-8?B?SEJIRGtEanVJRnMxeGs5YUNzcTVQR25BamxYUTVRVTlSVHRxdnp1ck5aS0RK?=
 =?utf-8?B?MnBJSWRseHloWUk2NG1lM1EvSWZaTEpRTVZFRGZXQlh4V0lZcEFUNUJRTHBT?=
 =?utf-8?B?YVJqLzY5NXNtL3QxallkS3BmL09uZUJocXJWaStsR1dhd0tiUkRxZDVoMjV2?=
 =?utf-8?B?UitxNE5kS3BUcHkwenU2RE1LVjZaQUV3WWRac0loNnRyaEE5MWREdjBxcGg3?=
 =?utf-8?B?N0M0dHRTcEpVam1TVEtIbHI3ajhyTU1ZeWNqWkd1Z0YwbEpLWEo2VExFUW5m?=
 =?utf-8?B?dnpIc0NtaU95dXlHdlk4ZEFlZzMxVHZoMEJRODJIaWltN0p4QzdZV0dZaFZo?=
 =?utf-8?B?SzY5alVhVU5ocE1RazE4MWY2cHdYa0I3NnRxY3Z4Z1F1MEZyQmRienBoWGRU?=
 =?utf-8?B?WmVHZ1ZIblY2WmhWcmZ0VHVwMVdOODlKUGRjMDR6VVRUZDBDY0JPMVVlWWtl?=
 =?utf-8?B?dmVxSVdsUUwxUXVTdUJ1Q05IYVZxWjZwL2VLU29FdExPZkxrQytKWEM0OGRF?=
 =?utf-8?B?YVZpQUEvQXJCb1FRcDNFRFVqbTVTU2EyOEc0ZmZFUE5rSllIWFoxSlFWNExE?=
 =?utf-8?B?NWFROElBVTRka1ZRK3lLZktUM2M3OUtYaE1PTTU4Zlh6cjhzWVRSbG5uZFQ4?=
 =?utf-8?B?RStzdjh3WUhjalZ0eENIdXIwM1IwZklkbE5CeFo1cytNOHNLYng2NnU4TEov?=
 =?utf-8?B?eWJ1OVpwVnR3NUd3TmZLNTMxNk5OT2tvVE1qcTZCTmpYK0xJTjhiNUFpZ3Ew?=
 =?utf-8?B?bjNvVkpOV1dCclFuSjJSTkxyQXNiOHZSZmdTOE55Vm5vak51NVZFdThPUFVJ?=
 =?utf-8?B?QTBtWERRL0dBeXNrK0M5K0V1WFloZ1FZQmlFMHowNGxlYm5MSFROeDhxWEI4?=
 =?utf-8?B?SWc0Q2IwT0NQeUxOSTZkUXhaajV5ZGRIaGFNd2w3NWZWZEdqRStTQks1SFpG?=
 =?utf-8?B?aTJLWVlIcVpVdWt4MVRSTHRQd0tPR3laWUxiWlVhSUlyS0w2SDhpQ014cXF4?=
 =?utf-8?B?akNaWVQzSkZlamtVTktMR2p6cnVXNy95dVNxem5PUW15SjRGK3QwWXM3K2d0?=
 =?utf-8?B?SWpLTkEwTkk3N2FSNzVGRHYzcnorS3d2V29peW9vSXI5UDIxWExxWlQ5OTdo?=
 =?utf-8?B?cHVUYWYvbmZCNFE2NEQ3dlExT0RnMHd0TStBU01hdllFR0tqcDdtWmkrUFhO?=
 =?utf-8?B?KzFmdkl2b1JkRUwwRVBkRURwQTJ3NjFGd2xON2Zyb0RQVkdwVXlHUmVxMnBK?=
 =?utf-8?B?NUoyS2ViYVVoYW53TzNNK2FXeEFHS0NZZnQybTlicXZEa3VQV1E0bVhSK0hs?=
 =?utf-8?B?R1RVRlFFeHF0TWhELzNaQlVjbXp6bnRUMEpTcm5sbncwQ04zNi8yUnM4S1lx?=
 =?utf-8?B?ZmYzbTJROTM3NVJPb2VtOWI5bi81VVlKZ3NnYVI1V1ljSXFYTUZWMzFLTmw3?=
 =?utf-8?B?RUVaSWtPMlNKemlpbTJlbmt2QmRvelBob3ptRWFHWWpXVXNwSlJqRE9ldXdh?=
 =?utf-8?B?UU43cjdYcFhMU0JwWU1NT1lUOWZPUklGekpTMWVxMWNhcTM2L2IzTW02bEQ4?=
 =?utf-8?B?R2RoYzlXcFZzUXEwbkwwZ05MeXJWYWI0TDZHdlFQTDJNNmpwTUdOYlR2VDVE?=
 =?utf-8?B?U1E2MzVUQ2ViOUkwczlNMzdadzQwNGtLTnZVMzhkK29WUHY2OExwQlpTNmVx?=
 =?utf-8?B?TnBZaXppUXBlTnZyOU9mVER6NmNrQWxPaFpsUTNuMm53MUd5V2dyRU96aHlT?=
 =?utf-8?B?OWU3RkJ1NldIYWgwNUxPNjNPRlVGNVdyNUpiUy9weHl5ZVRNbFFQSkV5WDBy?=
 =?utf-8?Q?LUsujZRWEyofahXLhx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19e7abc-3805-4d5c-3e62-08df1a54bf8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:59:00.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaKvxczgAv/CN2gXxsm9UjdKBGOmRSfx12jVaMOmuoFlcZ2FOWHiej90XtIetvDJa4qJpNtthxjPgMYILB2cDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9718
X-purgate-ID: tlsNG-ef75cf/1790265549-A5EC6AE4-408026C9/0/0
X-purgate-type: clean
X-purgate-size: 4410

On Wed Sep 23, 2026 at 6:19 PM CEST, Jason Andryuk wrote:
> .init.setup, .initcallpresmp.init, and .initcall1.init are duplicated
> across architectures.  Replace them with a common define, SETUP_DATA.
>
> Suggested-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Alejandro reviewed internally.

In case it matters, I confirm.

Cheers,
Alejandro

> Jan reviewed off list.
> ---
>  xen/arch/arm/xen.lds.S    | 11 +----------
>  xen/arch/ppc/xen.lds.S    | 12 +-----------
>  xen/arch/riscv/xen.lds.S  | 12 +-----------
>  xen/arch/x86/xen.lds.S    | 11 +----------
>  xen/include/xen/xen.lds.h | 12 ++++++++++++
>  5 files changed, 16 insertions(+), 42 deletions(-)
>
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index d4d9594033..32afbfe131 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -135,16 +135,7 @@ SECTIONS
>         *(.init.rodata)
>         *(.init.rodata.*)
> =20
> -       . =3D ALIGN(POINTER_ALIGN);
> -       __setup_start =3D .;
> -       *(.init.setup)
> -       __setup_end =3D .;
> -
> -       __initcall_start =3D .;
> -       *(.initcallpresmp.init)
> -       __presmp_initcall_end =3D .;
> -       *(.initcall1.init)
> -       __initcall_end =3D .;
> +       SETUP_DATA
> =20
>         . =3D ALIGN(4);
>         __alt_instructions =3D .;
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index d0f2ed43f1..37256c8865 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -107,17 +107,7 @@ SECTIONS
>          *(.init.rodata)
>          *(.init.rodata.*)
> =20
> -        . =3D ALIGN(POINTER_ALIGN);
> -        __setup_start =3D .;
> -        *(.init.setup)
> -        __setup_end =3D .;
> -
> -        __initcall_start =3D .;
> -        *(.initcallpresmp.init)
> -        __presmp_initcall_end =3D .;
> -        *(.initcall1.init)
> -        __initcall_end =3D .;
> -
> +        SETUP_DATA
>          LOCK_PROFILE_DATA
> =20
>          *(.init.data)
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 70db658fef..d9375a9616 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -114,17 +114,7 @@ SECTIONS
>          *(.init.rodata)
>          *(.init.rodata.*)
> =20
> -        . =3D ALIGN(POINTER_ALIGN);
> -        __setup_start =3D .;
> -        *(.init.setup)
> -        __setup_end =3D .;
> -
> -        __initcall_start =3D .;
> -        *(.initcallpresmp.init)
> -        __presmp_initcall_end =3D .;
> -        *(.initcall1.init)
> -        __initcall_end =3D .;
> -
> +        SETUP_DATA
>          LOCK_PROFILE_DATA
> =20
>          *(.init.data)
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index b9e888e596..8f943e11ea 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -223,16 +223,7 @@ SECTIONS
>         *(.init.rodata)
>         *(.init.rodata.*)
> =20
> -       . =3D ALIGN(POINTER_ALIGN);
> -       __setup_start =3D .;
> -       *(.init.setup)
> -       __setup_end =3D .;
> -
> -       __initcall_start =3D .;
> -       *(.initcallpresmp.init)
> -       __presmp_initcall_end =3D .;
> -       *(.initcall1.init)
> -       __initcall_end =3D .;
> +       SETUP_DATA
> =20
>         *(.init.data)
>         *(.init.data.rel)
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index ea11e3fb62..958f8256b0 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -179,6 +179,18 @@
>         *(.data.schedulers)           \
>         __end_schedulers_array =3D .;
> =20
> +#define SETUP_DATA                   \
> +       . =3D ALIGN(POINTER_ALIGN);     \
> +       __setup_start =3D .;            \
> +       *(.init.setup)                \
> +       __setup_end =3D .;              \
> +                                     \
> +       __initcall_start =3D .;         \
> +       *(.initcallpresmp.init)       \
> +       __presmp_initcall_end =3D .;    \
> +       *(.initcall1.init)            \
> +       __initcall_end =3D .;
> +
>  #ifdef CONFIG_HYPFS
>  #define HYPFS_PARAM              \
>         . =3D ALIGN(POINTER_ALIGN); \


