Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0DC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:29:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382989.1626243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWzu-00051I-00; Wed, 05 Aug 2026 08:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382989.1626243; Wed, 05 Aug 2026 08:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrWzt-00051B-Tg; Wed, 05 Aug 2026 08:29:09 +0000
Received: by outflank-mailman (input) for mailman id 1382989;
 Wed, 05 Aug 2026 08:29:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrWzs-000515-KW
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:29:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrWzs-00BUsu-1H
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:29:08 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72f44c-e002-0a2a0a5209dd-0a2a450cdf62-16
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:29:07 +0200
Received: from [40.93.201.62]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a72f450-f479-0a2a450c0019-285dc93ebed9-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:29:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8200.namprd03.prod.outlook.com (2603:10b6:8:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 08:29:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 08:29:02 +0000
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
 b=nPJ1TbLNTdv6viWLD3koI5xTNKI7wWR1p/UVLidU4tbYZdiQ/NA42uujDx2HP/U+SbjB6YUqX0TIcACSaULGWcEThyZ1rYiPrf0I/0ZUFxrc+52YETvsA5ksMXIktTsecNX3ZdzbEnQd3rztcxT/0toWH55XGn19Gu68pLi00DLBAtMvyAmwMvrLRW5E0qFfmTzLO1y+6svwwYTbPq+R913qIgFT74q927AqFn21xWHWezmxdRC3vmxwfXT4kXg1KE5plgfxN+uyV8pgbFo4YqY3V784EMwB4M5FGdPSKZzDCxx4ND56tFw1Xrk7ZX0BP7rLmvldlxQokmsxNjlXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp/pgBZDH+Lb5CV4YMTtHDjw9PCQLOyzUIdgVtTacZo=;
 b=y0u8zX0vqIQ9gS819nqF2CYWSkB3L7PE8lyCFdfsmdYR3w2/nBAHRo082Zb9GXFZcDUoQXvzwRvvk36c6rM8XPa+i2Elk5cFADtOxkMTSduW9qvhaltVlvmxe4+Azp3R0ykIZOj5ntrQAl7qXwSnFQ/MRf1ckZXmNiZYDMhZX/TK8MoEpvXmDgrFdFo0sYqMziu9LGM1Myu4kIgd3F9L44qCefel2wx0Y6M1GG6LJS/GNKEJxJ/s2/OzewPFJYb4SS0iazjlBmBL1y3COkyDanS3tFjIOULZWIqhfU1mRJaaN6HZWjmgxtLXGF0Yv5yPAzSW58oUUasQfjXcYzwLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp/pgBZDH+Lb5CV4YMTtHDjw9PCQLOyzUIdgVtTacZo=;
 b=leoN1A5FCrGr46CLtKoG/rdEdx1yCNNk7cO3Hgh/HJGU3J23Bc5MxPd6TWk7bsbE1lsIMdYFvVmAAMmdIjJuqjnDn4W2tvo9Uj2qVal5VuUW2kMkhphNZjW5+bYOP/X1aLSpsLAocvTC6RZaaDMurX2ksIH0QrRcji0o2bDwDxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7179e004-76df-42be-94fd-f314614e65cd@citrix.com>
Date: Wed, 5 Aug 2026 09:28:58 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/4] xen: Drop CONFIG_XEN_PVHVM
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-3-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260805082137.1214967-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5c4a25-2d68-494e-3309-08def2cb9b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ROBnaTTJpTdEkEkWEZ6ZWx34O5Fvyweh5G753wFmi3yYPvwQY92t6fW7ZBsr/96q4CG61a4qaRq6sbEtsw60wtRfLX4fH4pgLUPSUyU4+XfzYlUgLBSuKmG7oxz4ZwbVLCs3/YRMcASbLfEryVPHdOQisf/i2EJhHqZEsqRCjY7tUKnQ9QwHrVucmSNOf1wQ54bXP5fT4tIZ88H+hIKv6sQA7feFsIxomTbePoRB+vm12Zt/9PxczpydfVyiEjwz6CUD3ccl/YyQVrWmaTzQyu4pfH8Mmw4b3NFAMWAUot3M2PCGPPMvgbjC1LpF5j1xTRg1miUt0A2LJF+JYm53TA8KMHmSoyNET53+VaMT1xDdfBX7XWDGydvUL4uqqcirW7xw//S6KwhRh+/lprsatcD2+Zs7Sj/FC5Rzk82l0LMbnF8PkSbVuOpzzwzx+6LWJg6hEsK3HsR6sioijmu9Y54n6+QKo1o3dJc+wywtdcjsOHR38x9zxI/ZW2hyEVb4UZurELvihC+3PYAIWTr0Cu3FILXseF+IXssL+JXc/tc9lV+RyFWsCdu63L/hzoOYutDYLFIr31etGiQ9ciNYIvf+AFv2xD1uokBQwiUeA83h+pLsGvORDEUHPEkdh4vE0U+9xy43dHomDbm+AfR0hGb+eg66hi0MCr6QaImlY3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YndXcnFBUmJYN1N5dUhqRnhtZFpDMUlpVVJkTUhnTk5jOExpRUY3Y2EvSnhX?=
 =?utf-8?B?a3dKOGZ3RUVaNHJBSnpQWUlDN3hZMUxTRjdFSjJiMUZMaVBmaU9ndjFwSGNG?=
 =?utf-8?B?NWJIRlJnNldMdkliZStVL24xaTFwbkdwUTFReHYyeUZrWHRBUkZKUGxrT2ZY?=
 =?utf-8?B?MVVJTFRZQ3RhSThHc1NDODRZTk1QcUdsZDcwZDRjTE14RmozbThPZE1YWnp2?=
 =?utf-8?B?QzBKVHIrYmtqTEdTN055NGp6RzMvai82L2sxQnpWNlVycVdkeDNVTFdaSEhJ?=
 =?utf-8?B?ZnRyNUkzYzdRYWUxZ2JmeTIwZjNZQm1XMm9GTzJWUTRaOTZ2UEZRanhWWisw?=
 =?utf-8?B?amtJZWVLQk9lZlpOZXJSN3RJbjhzeHJwK2NBb0VZNEJMcW9XTWN6YUhCV2ZD?=
 =?utf-8?B?QTFBcUtZZmNYUTh1Mzl1ekl5dlRicEcwSWZEdzlJRzFuTGlpRi92N3hlaUFO?=
 =?utf-8?B?QmFtQllUZXUzVXNHaVBBZmcrLzZvUHU2bHBPaGxJYjY3dXRrSHExaWJjZ096?=
 =?utf-8?B?N1JFRnhiQTZGTk94c3E4UVd6NW90YS93dWJNTjFQVE5hV1lKd3o2aU5TVzFs?=
 =?utf-8?B?NTJ1b0JCQkZvV3VBMEtSc0xqeGE4ZDBKVmNWTzVHcTEvTWtkR1lGMVo3TnFu?=
 =?utf-8?B?ZlpRQzRkemlVeXBiRTZobGlhNndIOURTd0FES0c5b2tiS0cyU1ZaUURmeks3?=
 =?utf-8?B?UjhSYW9xdVZHL3dNaEJ6Y1RMZTgxeXROYmptbUZkMS8zNHk3MEJISC9VTXJS?=
 =?utf-8?B?TTlQbGhKRG9FZFY5RHR0cWxhbW5WT25KbkV3V1lCSkRRQVRKZWtFKzJWQVJD?=
 =?utf-8?B?bDNKWEZmdW5zKzVqcFBqUG9ZYXNlM1VEeUNTVkRQZGx0Q1NVZkQraXM2QzU0?=
 =?utf-8?B?UlJ4TG5NcC9CNVJZekNkU3QwV1hKNGJEMHo4c1pjaWM5MnNLWGpvR3hiZ25o?=
 =?utf-8?B?OUZLdU9GV3g0U1lWWTJhM0pHcVluWUdCRUxQM3g5eTNsdkxJWkUyKzJ3TWtW?=
 =?utf-8?B?dTA5SnZBSGV1ZnBsd1FBTDBTOTg5blNjTllIcUdYekptdWZyZzJhYVg0anJ0?=
 =?utf-8?B?MFU0VmZQV3lndlp1N3p6WnAycGorRGUxMnNBTm1QSGg0OFVHakZmSTN1ejFP?=
 =?utf-8?B?MWJEL3NUdjFET3BXczEwVlRVYXgvSnhuRDBLQ3dvK1V1S0F4TEh5cjE4SkY2?=
 =?utf-8?B?d3B1KzlyZitWbnREYWltL0dzMEFCS3hNZ0hIVk51V3EvU2ZZOG9BV1ZZR1o1?=
 =?utf-8?B?ck1DOWYydVcwQzU2a1hxQkxuQ1NEeGxPMlhqc1JKNDN5bytQam9CanJMdDBC?=
 =?utf-8?B?dmx2Z3lENkNQNUZrUkpJalovU3dCVG84c2xQK1NYbjRjYnlEVmVUTjV3VE53?=
 =?utf-8?B?aHc2OTZ2UCtLcVRyWkhYa1FESGdva3FreUZTSjhCWWsybHRlakR2MVFvNG1D?=
 =?utf-8?B?TmRJUUVieFlTZ0ZLb3MvQTNvdnRlb2RGTkp1aGt0YmFiek10VkcxbStITUdN?=
 =?utf-8?B?WWExVnNaNHdUbHBIZkdmL2lYN096M2RPeXZGcmdrQzBIL3I0eVNkU2w4UjJI?=
 =?utf-8?B?TlRsNVRWTldjNVphcEU4eHJtV0tqTkdHNDNlYkNjcHVSVUJDbERicjduMDBL?=
 =?utf-8?B?ZkFQWjZ0aTdmNGdnb015TGZ6SEtqM21qUDhicE5qdE4vanc5dW5yRE82K1Qr?=
 =?utf-8?B?V2JHdVNxL2dnazZ4VXFRNjgzdXA3NHJOKzc3TitUWXZVRlhFY2cycHRrdEpn?=
 =?utf-8?B?MUZXUDRwWllQTkJkWlZVU0dwa251dDUzbStUY3lhakI2cTI4NncwanNBL05I?=
 =?utf-8?B?ZWkySzNibWxld1lDUW5ldTlCc1RKRDFhNUpXWHArWld0U1c1S09WK2R4WmFz?=
 =?utf-8?B?SURES0ZRTWxkTDBBZnZYcnJaT3dmNkV4UlU1RzVQVnVXWkR1TW9yMDNMMEJ1?=
 =?utf-8?B?SVZrWVc1NkR0ajV6ZnY1WGhFVDJURUp1THhRZnNSLzFLNmc2Z21PVXlSS1h4?=
 =?utf-8?B?bUExWkxaUGg1SjlMTGQxTGVIQUdhSksxcDRwL2tUbXcxNmNrbm10NW9VQUdD?=
 =?utf-8?B?eEwwRGk3WXM4REpwZ29kcjJYUmlKc1FXcUlXZkRxd3JHMzRGUWoyVkxJZ1Nq?=
 =?utf-8?B?bER6YjFWamdQV3VzRVVLQjQxQ1RaNkRxbkNpbmhRUU8zSldwM3Jpb1JIS25i?=
 =?utf-8?B?NmR6cklZUlZNRUFaTWZ1TDUybWVydmxkY0pxWm1IRUd5SU85a3hscXAyWjJo?=
 =?utf-8?B?cmsrczdvcFFnMmtLMkpPSnpVUGdROEFWVTUwU1JnaTVQeVh6eGFEcno3Mkdp?=
 =?utf-8?B?dmZUVS9kaWU5b0h4TUE5Nm9CVzlNNXNaMXBDMWNnZ1R4ZUZCYXoyWVhUVHJx?=
 =?utf-8?Q?TsRf4a0Uk6kyvqpQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5c4a25-2d68-494e-3309-08def2cb9b1c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 08:29:02.9384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HERn3Vt9+OjSsnyeOfZMaWYTZ8aZbnTaa9KV26QeQg/1znFjAI/B07/ItGBQgIXz+8MEauJM9+Ojdri2I2KnRjdScCTp/m/hoI+7I+Q0xHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8200
X-purgate-ID: tlsNG-d25034/1785918546-00CCBA5B-FBA10572/0/0
X-purgate-type: clean
X-purgate-size: 1206

On 05/08/2026 9:21 am, Juergen Gross wrote:
> On x86 CONFIG_XEN_PVHVM is now a synonym of CONFIG_XEN.
>
> In Xen specific x86 code it can be just dropped, in non-Xen specific
> x86 code it can be replaced with CONFIG_XEN.
>
> In architecture independent code it is used only where CONFIG_XEN is
> defined, so it can be replaced with CONFIG_X86 there.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
> diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
> index 20f548702404..f400cfac69a6 100644
> --- a/arch/x86/include/asm/idtentry.h
> +++ b/arch/x86/include/asm/idtentry.h
> @@ -745,7 +745,7 @@ DECLARE_IDTENTRY_SYSVEC(HYPERV_STIMER0_VECTOR,		sysvec_hyperv_stimer0);
>  DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_acrn_hv_callback);
>  #endif
>  
> -#ifdef CONFIG_XEN_PVHVM
> +#ifdef CONFIG_XEN
>  DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,	sysvec_xen_hvm_callback);
>  #endif

I'm very happy to see a reduction in the number of Kconfig symbols for
Xen (there are definitely too many), but this looks wonky.

Or are you saying that there really is no way to build a Xen PV guest
excluding the HVM-only bits?

~Andrew

