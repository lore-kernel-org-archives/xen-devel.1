Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E99C531F9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 09:52:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372309.1619670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woeTc-0005r3-Ij; Tue, 28 Jul 2026 09:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372309.1619670; Tue, 28 Jul 2026 09:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woeTc-0005qv-Ey; Tue, 28 Jul 2026 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1372309;
 Tue, 28 Jul 2026 09:51:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1woeTb-0005qp-5w
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 09:51:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woeTZ-00Aqgt-Su
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 11:51:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a687bb3-e002-0a2a0a5209dd-0a2a450bb2d6-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 11:51:53 +0200
Received: from [52.101.48.26]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a687bb8-b7e8-0a2a450b0019-3465301a9060-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 11:51:53 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by CH3PR03MB7342.namprd03.prod.outlook.com (2603:10b6:610:1a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:51:50 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Tue, 28 Jul 2026
 09:51:50 +0000
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
 b=KPlO5YPRElwLBynOyktdco89xNWmhV9r1H0sj6M9sEWQesmrA5GpP3blUk7vx07c+9a15JG7VHISJcdF6l+Hvs0H/a4Tmo/it/OVEFIsmddGcGux7EbIbwKD7Fx4rIGjjhFAvA9abaEKGPWtFMZzL51mEm+4gI1WSH1Bp1r9FxXrIknXnadtBnyMuAAGe6vl9YlLWdnd3kfsulApzxMJEdapO4F71jmupYFUw0vrc5W/I4KDrxSUAXQW8HgJp7DQpQVKuWiDfgfwRXoNLh4msdqwQ4CWvlD9TLiRom2+DW1Zw9Fh40gIir4WIQieHXJfAKFyGDt2J3+yUF0uk21+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTk7kxRR1Vy7EGYB8CdwlGfNwuujCkFstrVcPHfIxxM=;
 b=dBEkYvtn6qOJLLw4psKQEiEXeVu9colGC0JOVXEJH34Bm+bXXeVzNKlQlRBGoWT9awUfZLBhVRyYOLWmYvwlqkt6YxA5jKEqqXO5kAmyS5KQdSAPgRfIj/WVFm7t6VFXbPWH8fAUC9GLYP7BTtTVuUqb5/yeQ/uHwiNzy7Z4D2S7VVnr+GjAkjDx/M9SVVfqQpvTD5hZaa5Fwq7Rmm4yT/DlcHtm09LEi+pkGGf0Rfg1evxxQAUy96olgKS1VUAaPHl7c7Z2B/u0jEhQOZnXGUkiMkGm4uCeTiytC5Erj2OIKyh8M6ZtXTGkLvrBVqSP4RE/INOIC0x3dwq+IFosVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTk7kxRR1Vy7EGYB8CdwlGfNwuujCkFstrVcPHfIxxM=;
 b=Xln0duth5PgdvCuqneQ+SLpbIDo8Xvxe5AZmBUPwztAp3G0HpCzujo/hXVtyxIZ2MzzEsDN8xSO0zaXphumpxYU33Pb1plNyXMRmvTCEvvlEO0GDA/05WYIyTuVFw2hN7DEms0QV3GyWSN6ZhQVMnqnnxXpmCjkQ+8D1JFQNOHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <65e4949a-6ca8-4ed7-936a-ed18d50a2e0f@citrix.com>
Date: Tue, 28 Jul 2026 10:51:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
Subject: Re: [PATCH] tools/ocaml: fill arch_config for ARM in
 domain_getinfolist
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::9) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|CH3PR03MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 867fff78-e536-4e1c-21c5-08deec8dd884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|56012099006|11063799006|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	JGOSmV4PaF7l/2Xu6MMYbBYVHZ2ArcvuDEOblUCpPYsGVcKUoRocnvrPk8Of9NEwzI3hx5VwEUUYu+L8a1Vkw7HsElhs3AGFqJOVPrEAADxGv6bJDiLoPY2GNs1cjLnEbdb18o/Yu8TtcWXr//Au42oVAlMwS+hNfdPFCivMiI2zLWyrG8QCDyOTqsnEPHgDF7pwqBa52dHcZXXem6pRqjQggy5W2FYk194T80PAeNVLccV7hP9LlH1eT6dORZH85wlnc0ePF52Wk+yjxXWGrgu8RUZNkY+WxGfhwbVTpgL1JYN/1a+Fik+tFtV6yxgS34Q5ZkZ6SYI7VnLJ+8Yh6VDNM+53/ltHhytOej+h9mwRwejjTfrJeY9WCuRxTf7mnCv2c+AIXEECvSwHosvn0W0Wc2pTpEBg730z8vfkYPLh9j3r/pE3xV42dOAuHVctYTonWSFRjkdGysevGMwpr7B896934+sTxdazMX6wZ0yidNH/LaU18k6+TmK31qiBCk+/7hyrhupnAIVU328IzeNNRrtchoT8Z6PG3qeaFb7ErhQtPAys3qLuHSeKMLnHii3n/5aAUBtk1aEhfdSKIq+7EVWQL8qlU8HLbn9El8lFveepgx2ieexm7obEIz1XYjgx9I4nu/rr3eKP2K0ZwPzFBEWuAhkqIW1PKSG8PiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2U5ODVmcytNdGt0N210UEYzQ3hYc3RkYnVRclFkcHdqak5GWXJybmZoY2tw?=
 =?utf-8?B?VXlYb081Z2loazYrYk9pVVZxa1V0ZUNZeEFqYWJvdDR5TUV6cXpTcmFUOStD?=
 =?utf-8?B?MW00Ny9iUjhlVmJiQTdQZUkzaXZ2RGRPMS9EVUNhUjFodGNRSUg0enVTNmxp?=
 =?utf-8?B?SjNROEpUWGpGTkxhbjFXU1NFZ2RCaVZpZ2ZaRllYRFZMa0s0OSttV3N0K0VI?=
 =?utf-8?B?Y0VqdlRPaHpwa0JzeTVVQkFXSU9zYnA4VENpQWpCbUpET3lTcG1MQW0vSzZv?=
 =?utf-8?B?T0ljR3E2VUo1SW1zSmlNcjFoK3grQm1uRTZuRzVldGVJVGNDRzdFWHI1UGNV?=
 =?utf-8?B?aVJVQmhrbEE5QkxTTC9hOHJ4d01ibGlZV0pzL0lUMWxPemw0M3duTUJJdndM?=
 =?utf-8?B?WEkveUFRaE1NcWlqZFIzbGt5QVA3T1RCVFZ0NXB1NTl4b2wwc3VvOVIzd0NC?=
 =?utf-8?B?bHppaTRIVDV5RWhCVC9DSUdNREV1cFowdnlucHltMi9LK1pNeENFUnhjRFFk?=
 =?utf-8?B?MU5CYk5yVlhicXNsN05FSC9JRUFGUFNuSGpHRnU2NXAwMEdjS2dsTThUSnVL?=
 =?utf-8?B?ajg1MmgzejErdjRuVUNNN0JHMXVJajNYbXoycXZ6U0dCTTU3ekxTVHowZnRN?=
 =?utf-8?B?WTNmVlhsWEtKVi80d2NVbHlKS0U3R3RhditDYk11NHBROW1pck9mM0JEK3Y3?=
 =?utf-8?B?MVI2M3dYRVlNTVQ1ZlFzdHRQekp2V3BRWWJKRE9ndGpnUWNxUnJ4Ulg2dGJY?=
 =?utf-8?B?RE9rM1Badys4dzBocTJWd1hMbDU4c3Zhc05VeEplM3lQK2NQbmllNE0xei9n?=
 =?utf-8?B?MDc4MTlzZk9SSnB5NThzQ2hYRkNqWnJLdWdyb2pSZ0RvSUgrMndmQUNFQ3Fr?=
 =?utf-8?B?ZGhKSnNoa3hsWHJuNHBhRTdnRDlUbnpEdW9sSlF0eGkzZS9tS2dSQkgrY2dE?=
 =?utf-8?B?bUVJVVBLMkNkWVRmQy9YdGlNMmR5WWloajY2VHFKbm0xZUsxUU4xZlhkeU5z?=
 =?utf-8?B?RFJJMC9admo1UUJLOENzU1QvY3RHSzBBb1VrbnhZeW5LdVJiVEVDM0svYnZo?=
 =?utf-8?B?UlNvazNOMFl3TWtyV1ZyZHkwbVNPUk83dW0zVFNUVGdPd1djT0UzQjVXRlpl?=
 =?utf-8?B?elI5VEhZcHpPNTlldzdhRkJPcWxFWENJb3FLQ1JPaEQzUnpJSG12VWQ5MWdv?=
 =?utf-8?B?ZzZrNFpUak5XNUpUL1FMTWgzdm9wUUo1b2t0alVET0dkUDgxdk10SmJOWnlV?=
 =?utf-8?B?OHdYdFU4Qk1ZSTBBaEd3MDNGOE16MytsL1dhaUtoeXJrTCtjQ1NJUWRzeUlW?=
 =?utf-8?B?a1BnakJTTmpYUU5RL3JVRWZWWHJnQkFyOVFKTFMzVDZCWHB6aWlDam92NHpn?=
 =?utf-8?B?dnZFYlRPTGdwUXdSblhVYXpQTzlXcFpVeDRvUnhsSm9zVTJFQkx2RHBDWlRD?=
 =?utf-8?B?YlYxVXJFVitqU1JBQWNGQWowK0xiaWpyTGJWSnczY1pEallJTDVtTFcxeitm?=
 =?utf-8?B?WmhOOHJoTWNxUWs5RlQvMGNuamZyc2dyTW1LOEtSQUNwM3hQMVNrYk9MTVgr?=
 =?utf-8?B?ZFZCMlRUQUdxaERWa2EyaSttWTJFNW55Snhqb0ZHakYyMFJ5VERNMXRWdUlq?=
 =?utf-8?B?UmtSSnpiajNwbkRpSkZiRFlxbVpJcGNmcXk2OUdVcldsdThJc3J6UTU4S1RV?=
 =?utf-8?B?c012TkFpNE04elZ5MGhEYkZrem04UmlibnRnSlg5Z0JEVGxJcWNnaGRLN3Yw?=
 =?utf-8?B?aTVTT3MwZ0ZGa0U1Vk1nU09JWFgwdUZpMU45RWkveEtjMFBCWUs0cjV1SG91?=
 =?utf-8?B?Q1lTQjFNR3RDUzhIVXFjbGJ4ZHJEKytyblhLSGllbnM2ZFJFVS8vdFBLZXZW?=
 =?utf-8?B?QVBjcThNcmNSY1l4MkNoaUh2cFhwdkVPeW5yVTEzNlVqMHh6bUxnOFUyVUZj?=
 =?utf-8?B?d0wzRnZ6bkhDWlEzUFJ0Rit2YjNQTGl4d3ZSR0Y4QVRqc3RDZVdUTGN5RkJk?=
 =?utf-8?B?RjdkcW9CcWpKQ2wxRmJzMDNrcm5maXVnUG0vQ1U1Ym9hTlpSc0NJWmZxK290?=
 =?utf-8?B?RmRNeW5hZ2ZnZ3AwQTNZMTlqbTg4ck1lQkRZbmFvQVFTZ0FhSEhQc2NBN1lR?=
 =?utf-8?B?dnF1MEordkJOLy9ZNEJhWnhZbVBrRUVnMndyemh4aXRLQzB2L2tud3UvOWZS?=
 =?utf-8?B?NjNjRjBmcVhBL1FXeUpVMHZ6OTFDNmtteXZIa0YzRjNYVWZxTGxJY3cvMkdh?=
 =?utf-8?B?bjkyL1lvRzJlN0xUbDZWREJKbnFKbXJXbnMwbnpadTkwVElJTDF2emtvamhs?=
 =?utf-8?B?Qk4rd3U1WTVmMzZnckZRd1NHM1dKSTZBVldiR0pnMmdpVG5xTXA2UnRhcWwx?=
 =?utf-8?Q?SH1UY/EOrBOkh+N4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867fff78-e536-4e1c-21c5-08deec8dd884
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:51:50.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVzy/gpzu8s+45PiZe9b8nSS3UwK14i43YCvnqhzehfKVZ1LYxKSnTB6QQY6VrkT7ZrHUBsfN8kFbAyOSQu1E2w9ilCkNmrA0nJs5avcSsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7342
X-purgate-ID: tlsNG-42698a/1785232313-192CC9EA-9E15B542/0/0
X-purgate-type: clean
X-purgate-size: 2313

On 27/07/2026 10:11 am, Julian Vetter wrote:
> In the function alloc_domaininfo() the arch_config field in domaininfo
> is only filled inside #if defined(__i386__) || defined(__x86_64__). On
> ARM the field is left unpopulated. caml_alloc_tuple() does not zero new
> blocks, so di.Xenctrl.arch_config on ARM is uninitialised garbage for
> every caller of Xenctrl.domain_getinfolist/domain_getinfo. Any toolstack
> dereferencing that value, segfaults once a VM is enumerated in a domain
> scan.
>
> Add the missing ARM equivalent, populating xen_arm_arch_domainconfig
> from the raw xc_domaininfo_t the same way the x86 branch does for
> xen_x86_arch_domainconfig.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 7f6381cdd2..b60ea9f12e 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -415,6 +415,7 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
>  {
>  	CAMLparam0();
>  	CAMLlocal5(result, tmp, arch_config, x86_arch_config, emul_list);
> +	CAMLlocal1(arm_arch_config);
>  	int i;
>  
>  	result = caml_alloc_tuple(17);
> @@ -460,6 +461,19 @@ static value alloc_domaininfo(xc_domaininfo_t * info)
>  
>  	Store_field(arch_config, 0, x86_arch_config);
>  
> +	Store_field(result, 16, arch_config);
> +#elif defined(__arm__) || defined(__aarch64__)
> +	/* xen_arm_arch_domainconfig */
> +	arm_arch_config = caml_alloc_tuple(3);
> +	Store_field(arm_arch_config, 0, Val_int(info->arch_config.gic_version));
> +	Store_field(arm_arch_config, 1, Val_int(info->arch_config.nr_spis));
> +	Store_field(arm_arch_config, 2, caml_copy_int32(info->arch_config.clock_frequency));
> +
> +	/* arch_config: arch_domainconfig */
> +	arch_config = caml_alloc_small(1, 0);
> +
> +	Store_field(arch_config, 0, arm_arch_config);
> +
>  	Store_field(result, 16, arch_config);
>  #endif
>  

Oops, this was unintentional, but obvious now you point it out.

While this patch works, it's continuing a bad pattern I accidentally
started.

I'll do a prep cleanup patch, and rebase this one on top.

~Andrew


