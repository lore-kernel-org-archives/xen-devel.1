Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF91CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:00:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452344.1667181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkMB-0004Le-FJ; Fri, 16 Oct 2026 16:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452344.1667181; Fri, 16 Oct 2026 16:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkMB-0004LW-BQ; Fri, 16 Oct 2026 16:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1452344;
 Fri, 16 Oct 2026 16:00:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xHkM9-0004Hx-NS
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:00:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkM8-0092xZ-Rw
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:00:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad24a1c-e002-0a2a0a5209dd-0a2a450cce3c-0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:00:28 +0200
Received: from [40.93.194.31]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad24a1b-f479-0a2a450c0019-285dc21f417a-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:00:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5300.namprd03.prod.outlook.com (2603:10b6:a03:223::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 16:00:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:00:24 +0000
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
 b=PcBDWAbgtiC+cgoFsVeeAL7WsGl5HNF6JCkztcHW1RBJZVTzkRJ2Vh2AwjiQv2oB9W6NGZ1NqBAy3FIkGDFOmBFyCTHTEVxpSB5uhan5GPowQ/JbI4s3nTASXZvXMQZaoSlHiKhcxL2A4kqM3WqK002HWphpgJhjD/p1zyLcm8Qy7vkBBkprd7lOofaIQ9+ojaRxD04LXV5R5mhiCRQNLL6fiVlvG+xaUMeOmQl+Z56ZoYf5X+a+kUIphoVgQ3K0JQjZYl5XwcdFqIcz9joXEwlvgoY8n8ZOctzq43ZX5ZxlSKgqyLaGmbHthCwWwnZMWhwfzJY6/u/9HrV5WbcirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7KBtp4KGMqhlX2cDj/rxAha+z8H4g0ZE7sxNjdv6KU=;
 b=ISx0nkJVUNCB6ZK0efYFDcEZqUX7MIchLTk8V6OylQMgpwzpgWRpWZKjaYj1Fpj1FouvuZm1t+LtuT7oxfQG3XL8IzmM4SwHVtLuF9IYudxOsSyY7iIO83JNBrz4ppxaCy9cMRVpZmgEuGdv/FQ9h2RPdTeJ+to8tW/A0K+ReGqP2+Rz26DRq7+37YYzk9IoVpp/iG1BWTmcvHjpxwjrXO53UMx5RJ9spkWJtNoC4ZifkBTPnAXaRunJEAstHgVvUuQCGmXEDVGrrvWylTd44Nz0bJlFkMv4/3IeDNV1kbRGkU7e6hokObRq0f+PIhU9mMtrGPkc4Kfk4OWpyJsamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7KBtp4KGMqhlX2cDj/rxAha+z8H4g0ZE7sxNjdv6KU=;
 b=cN98XAAV+9RieeD6Nv87NnejVdQRAAZYSBPNMeC710dBpy2txLtoWi6sVd4ThuXlZ3wVgq0leh9pW2X/oilKG6sikaZ8lnOzyLKNPq1UAyrZcFw263kHo24DaGLCU0xmBPRgZR5ahbwspmpjyC5T8c3Vng4jp2KoYcR8HNBLfUU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c73508d6-7de8-4837-a9e2-c25d3aae154f@citrix.com>
Date: Fri, 16 Oct 2026 17:00:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/ocaml: implement stub_xc_domain_create() for ARM
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1792151570.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792151570.8631fc262581453bbf619ec5b2062170.1a1448ec98c0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 95dab18c-87bf-432d-fcba-08df2b9e9670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|22082099003|3023799007|18002099003|261009223027099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	gxaUcBCsuhVW7wuOPO+tVejdla4fsiG94PIL9z9Etgo41kJe6V2tAH3AgYs1XU5lF6JYhUqOATWqMQjtT1726lQsDGpCkgXAy+kjSJBSADy2ciarc3Z2z/Uf+GNjLd5KKpHGrmuLu8ODQvTfQb5+2ExTFaB/tkxYpU+8dj5YayPvbBnLA2VBjv3x10GLHFJnIR8opgz+FXJCCuSNHzgnioowDQytSGwJbxaSdA0WpmpdlwVTUt0JAP7pUDEFBPxHiH8yu+c9wSj9DzX6StrnZvaK9WO4X8pk+pfxjH8s3oFgv/1Ab9tCw/tMu2IE/u7iBQqMmdiDr0JA17jNqBx18iH0Fktjch8Iql2w13NEhOYGnwgmP/BIvBZzlvvL0EFtwfWynTwtsxPDPMXjrS6zxdcrgWYTOm7WNvDhgglAQzWoALgakhqO+NtPOMyM8/g3PfkiQLhcM7KHE9WtySzUfOC3mL9weRO8SbsnLHSP6y+UpkGJFcR9QZ5ABdByUZ731IXYweOnngZKqm1ha7Yn97H9CKChNWBZdTzkY1cOhaw/8GL5BQGzFGwphzrthwC3pjFaNO7Me4ZuAk6lfo0onHqGwonJGSfYQ77bS9l6S00WNPFS0Pj3t75kSHFETru8wD0pwih4GkWeDv5niHf7wVQYcc9dVTildkm+atSevIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(3023799007)(18002099003)(261009223027099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDZjSFZxMTBVcjNlQi9HSXlkTGl4ZjhDT1NhZ3BvU0t2ZFdHK2pHWkRkdkZC?=
 =?utf-8?B?Rm01c3hiNU9LS3kzL2xxMWx4SEsxNjc2M3B1dG1uYVpzbDdsbFRZL0h1MVJK?=
 =?utf-8?B?QW8xZ1hicHdFQXAxK0xxQWtJUkMwQVRlczlIU1hXUlo0YlozaENLdXFUMXdH?=
 =?utf-8?B?NFNleEdpem1QQy82b24zK1RTRDlVUFczRmdFZElMRElIMENWUmdsM0JwSjZq?=
 =?utf-8?B?b0tHemNUbHI2T0hsN0U2QjcyRFBXK3BxZGk0Yi9VUWt1MDcyZldDNXg1MUFH?=
 =?utf-8?B?Uk9sOFpoY2V5WXdwaldmZmcwdDBsTkZmS00wUmFFNzdpUXlDekVkT2Rnam83?=
 =?utf-8?B?WXp5dExpUlp6YWpRcEtySFJUQmJvYWRPMk1YaUVCYWYvakdJOVAzOWRkTThV?=
 =?utf-8?B?OG9MaHJHbXlvTnNCQzUrTjJDOWZROTRQenF0a2NuOTZjNzNmWHhYdjI0Ujh3?=
 =?utf-8?B?aUd0MGs0N29Nc3J2RFFlbDZrR1A1ZHpiZnNmSmJmeUpFMlE3bXVzQWI0U29Z?=
 =?utf-8?B?eUtWNHNOVUJIaFNDd1hNTnFRQWxnZENvTU5tUXN1bDU5cUNNNzNJbUxEQlda?=
 =?utf-8?B?cWVmcVZ2QkcrQmE3cjh2OE9uWmhpdFhDSzVTekxZOVRGSGltRUdqWFRUYThk?=
 =?utf-8?B?TjRyS1VYWmJPZlZ3YTR4dldGaU42SmVCM1FaOEF0R0tDS1V2VEZQLzBlZEk2?=
 =?utf-8?B?dDdZSXRxMXZZaWM2TWpGTTNoNEY0SitRSS9qcTJLd1JmVm1QbmlTR0loODJz?=
 =?utf-8?B?cnV4NWx6R1NMVXRqZHFsdEJoMDVXeUp3aml6cmRkbTd0a1lpd2R6bXl0eUVo?=
 =?utf-8?B?Z3ZZUFB5QzlUTkh3eVQvT1hxbEl0ajE2dndobk1BdE9WU1Q1WGlvK2FnSDBH?=
 =?utf-8?B?S3JZS203NHZCMVE4K25KU25WSmRlWld0clhNV3A0WVQrOWFFaTlVZTdMU20x?=
 =?utf-8?B?L1E1Z1o4WkZTQm9hK3VsVmFET3l3QWpKSlp3K3lsM011Y1VwZk1HWmtpRHBk?=
 =?utf-8?B?SjZIbkRQWTV1ZEE4L25nTytGcndxcWlwVStNcHlSSVVhMnVyeEpxQ2tQNVlB?=
 =?utf-8?B?dm8reTJwY1ZjaXlKV0NqZ1p3elFHeUIzOXJkOGFFWGRWTUJpL3NmR3FsVS9E?=
 =?utf-8?B?QmoyZFFsZ2pHK1p3ZzNVcHYrbHdGTkVFYkkzdS9MRVdld0s3ZkREQjhLSVQ3?=
 =?utf-8?B?SFVDYWcrN0JPRzZpdmd3a2pjZGdEdC8xWWtRTFJQOFRqdFZOck9BbzdzQmdG?=
 =?utf-8?B?Y29zaXBhODQ5RHNkOVg5MXVMZWhKY2llaitpVlYyeE9yUVVuRk4wUjV0WW8y?=
 =?utf-8?B?bzd1Rld5VnRUS0Q3VWk0UnV1SndRSTdGL09kK0MrMFBoemcwRFYveE0wQjh5?=
 =?utf-8?B?ODg3RXBlNXQyZ3FTVm4reTFOcStmdkRETnN5SGZjOSsvb3F0aGVWeUl1V2w5?=
 =?utf-8?B?QXhKSnNIbzVHanc3YkUvZ3RpRDZFcW54Zm9WSTVtNGxVUVo1djU0WDJOS3VH?=
 =?utf-8?B?aG5lYXhzWWhDU2hSMXpDakZGWE83Z09iWXhuajV3L0ZNN05GdEg4a3pETklB?=
 =?utf-8?B?SUhVODNLQkgvQ2swZVFKblNBTjAwV0V3d0hUZkVnZjdnM0JmYW51eXFYYTFN?=
 =?utf-8?B?M2Q3M2RKdWVnQW83a013Nk42Zi9abitmQ2tFOEMvcldwUlV6Z2dUQXNNVVoz?=
 =?utf-8?B?azJWOU1qMEg4N2hIdkZVZFl6Tk5acmd4ay9RMzBrUGhXNmQrbXM5Yks1aUtu?=
 =?utf-8?B?Vzg5YnM3QzhybDNKSTF4UFJTYzYyK2loK1BxVVBmZm8zK1VCcExCMGQyVDlB?=
 =?utf-8?B?bXZMcjNPZGtCNkc5VE94UnloOUZ5cG1vbnFKNmlLamt4ZlczZG1Xam5vVWZ1?=
 =?utf-8?B?UzI5bTBqR0dxT09xcEVhQi9sSEx1RjRKajhNNVBaWjh3U0NNa0FSSUFEeGdy?=
 =?utf-8?B?UTlxSWk1cHAzM0J6ZGFtUW1tNlp2bmlrNS9ZS2V5dkRHQUxDa0RtNGpublFB?=
 =?utf-8?B?bzg0c3M4WUtIaVJETjNnaC9HN1BoTlZ0d1U2aFQzQ1dVZ2RURVFqNEc3RW5X?=
 =?utf-8?B?UWN5S2NLeFNheTBlN2pJNG9yd0I3UHNBRFR6WGdSN01OZU5mdTBQNDliYzJt?=
 =?utf-8?B?MWR3K2ExSnMxZjhIQlBxM0U5UExhZG1kRi93UjVOMm9hTm5XcW5kOFR6RUdm?=
 =?utf-8?B?QjlMbm9hY1JYOGtaSmU5NVg4Q3R5Q1l1VzRhbytNMWhoV3BMelhoV3dGMGxV?=
 =?utf-8?B?K09tYkowK0lBVlNlWmlEdjVFMTQ3MHVHdlhuOEhrWFo0aXY4dUovRnNCblpk?=
 =?utf-8?B?RnZCK3lDbTlWUGRFUS9wbGJxR3Rkc2ZZbUVDTlhDWks1QUJleUJpQXA4YWZ6?=
 =?utf-8?Q?WpQFsIadyNop+E1Q=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dab18c-87bf-432d-fcba-08df2b9e9670
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:00:23.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM/4FGHHXdrVxU9IRIgkhdFXpKKoV69vuNAm9GsYqYzmU6Vtc2b6gcHDqXLI1Jn0Vac+QgaOug87pJPIT4Xc9jK2yWj0GiTzRvIBmN1NRGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5300
X-purgate-ID: tlsNG-d25034/1792166428-51538A5B-C673ECBF/0/0
X-purgate-type: clean
X-purgate-size: 3267

On 16/10/2026 12:52 pm, Julian Vetter wrote:
> From: Andrii Sultanov <andriy.sultanov@vates.tech>
>
> stub_xc_domain_create() fails unconditionally with "Unhandled: ARM" for
> the ARM variant of arch_domainconfig, so no OCaml toolstack (e.g.
> xenopsd) can create an ARM domain.
>
> To fix this, convert the two fields of xen_arm_arch_domainconfig,
> gic_version and nr_spis, into the corresponding fields of struct
> xen_arch_domainconfig and reject values that do not fit, as is already
> done for other parameters. The remaining fields (sve_vl, tee_type,
> arm_sci_type and v8r_el1_msa) aren't exposed to OCaml yet, so they stay
> zero.

type xen_arm_arch_domainconfig contains clock_frequency: int32; but
you've just removed that from the hypercall.

I suggest that we use the fact that this hypercall doesn't work on ARM
at all to allow a minor breakage to remove that too.  It will want to be
a prerequisite to this patch.

>
> Also add a BUILD_BUG_ON() on the size of the createdomain struct, just
> like the x86 case, to catch future ABI changes.
>
> Signed-off-by: Andrii Sultanov <andriy.sultanov@vates.tech>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 180f2fbf45..5fa67cdf2f 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -257,8 +257,34 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
>  	arch_domconfig = Field(VAL_ARCH, 0);
>  	switch ( Tag_val(VAL_ARCH) )
>  	{
> -	case 0: /* ARM - nothing to do */
> +	case 0: /* ARM - GIC version and number of SPIs in the block */

In hindsight, I think these comments are unhelpful, because all they'll
do is go stale.

Other than "not supported yet", I think these ought to just be the tag
names.  So, drop this to just /* ARM */.

> +#if defined(__arm__) || defined(__aarch64__)
> +	{
> +		/* Quick & dirty check for ABI changes. */
> +		BUILD_BUG_ON(sizeof(cfg) != 72);
> +
> +		/* Mnemonics for the named fields inside xen_arm_arch_domainconfig */
> +#define VAL_GIC_VERSION         Field(arch_domconfig, 0)
> +#define VAL_NR_SPIS             Field(arch_domconfig, 1)
> +
> +		intnat gic_version = Int_val(VAL_GIC_VERSION);
> +		intnat nr_spis = Int_val(VAL_NR_SPIS);

This particular mix is buggy (not that it's obvious; Ocaml's API hide a
large number of spiketraps.)

Int_val(x) is ((int)Long_val(x)) so this expression is explicitly
truncating to int before widening back to long.

Either use Long_val(), or a narrower type.

> +
> +		if ( gic_version != (uint8_t)gic_version )
> +			caml_invalid_argument("gic_version");
> +
> +		if ( nr_spis < 0 || nr_spis != (uint32_t)nr_spis )
> +			caml_invalid_argument("nr_spis");

With the above, this needs to be the narrower type with:

    if ( $VAR != Long_val($VAL) )
        ...

which is the only way to see if any bits have gone missing from the
Ocaml representation.  I bet we have similar bugs elsewhere in the bindings.

~Andrew

