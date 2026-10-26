Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF70606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=juBd68xh
Received: from list by lists.xenproject.org with outflank-mailman.1461246.1672219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJov-0003Xf-Tq; Mon, 26 Oct 2026 12:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461246.1672219; Mon, 26 Oct 2026 12:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJov-0003XY-Qy; Mon, 26 Oct 2026 12:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1461246;
 Mon, 26 Oct 2026 12:28:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLJot-0003X0-L2
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJot-00D9vl-1f
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:28:55 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf4778-e002-0a2a0a5209dd-0a2a4507d5ca-20
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:54 +0100
Received: from [52.101.57.59]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf4785-b4ea-0a2a45070019-3465393b327d-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:28:54 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5388.namprd03.prod.outlook.com (2603:10b6:806:b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:27:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:27:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+yIvZ9jRoXzAuSy3gxEvhMMUiU4YDFqytfyzvr2LqXLB8/rpsvIgCIkEOJZEX20GcGevMDcouD/rRRNfd/pDn3jnsxA0IhDqBcTktuuXRf3VtG2039a5cN69aqA+py3RxreybdjynFdynFcrb9SWLaMwXrWBXgG3DWEhi60VJpoQjbkr2FCcTtSndHbhzLxwOgBHk0Z7fz9NLFTUFoVFFyBoG/kWqOK+3Qf7uC+IA7xFqxc4h/Fp5AiBxmBEp8YlTPRo5jAMU1cmztEvpQDelWju3ol7KC61TFqHEhnYDBMswo6nYPdjvb17WmFiWiymx5Yv6lOg5ivvnEUAumUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLu55oHVPlEXT/mOqQatch9k/iuiR883DkdVQXZjfCs=;
 b=zB96S97u1SAGKqylcwkevnv4O9Z98RSuYT+YJQBBiugEsoTJHSoRZVWD93uYe149hObqzZ/SxPRtpD+3bKNq/y8CsfvcTzMGL9Qm/gmslpm5lEtctknX68St6BAbawQURFdc6CZeltl39EoZaLkOTA+W0qgUZhbelUqP++hdjBvYuGOHfOygF1A+mlgA2jhjIyzdAXcEXnSiq60ABsYaVV713wlIwBxVljr4JGbHsAANgRSs7RL7QpZRc9g3bSFL3C/xzo3D7221XMWqq9nFabRlqIbxwFAoKSfBtnvhVQjMQtzvh6tb7ub3fFoBGrj0DJvFALKfAFD76beTuV+5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLu55oHVPlEXT/mOqQatch9k/iuiR883DkdVQXZjfCs=;
 b=juBd68xhXagf1fxfaAKRnzO0mMJE5admeYXRTIrjssCb55WF3B3H/pYrAZ2K8eODA7PZpZhq9/EumIRcQuyCL3g6hITryC3KJ5PyytkUPHr5sRGsBdBIH9zpXMrwaYYHfxjuwMMutxLuaQBY3B+iPF/6zuZ/FWoQMX4WyspIusg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0ee66940-5e5b-407e-81fe-de0e47842bbf@citrix.com>
Date: Mon, 26 Oct 2026 12:27:17 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH] x86/desc: build boot GDT descriptors with a macro
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20261020135722.45714-1-frn1furkan10@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261020135722.45714-1-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0316.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: 49161fc9-a3ce-44a3-c5f5-08df335c7b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|56012099006|11063799006|261021121427099003|261021123027099003|261022105027099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	DynWQLEB2KBB2nwxPWti+7biHoZ027KyvY5vcZKvN/E3g5c5syXBT+2HCGiKD1u9z57NnbKbce9KtX2hwwNclqOgNYCMsSo7jidzjk27geo59QEAtBV8c9KsAyzOoxIbmI7qsViEsCIcFkQDk7sCSo+Wby0rGHoH6bPAUG67WQvFXw+htnAVJRfXM30ZWPL76XtC0d30QMMysjsQMYvZCP63Mc0gyelYT0EbXPblNqdH1/q89vPJ+JrnPFHoQtYBIsxrfemB0wo4GMI5HaKgURFqO4K2BQvkHamFS5dxQ/95vNIpi/yNINGXffDmOIiGF4gQS8K2eSTJKmWF9RJANpOB09Q4yB+EsgFBOptAw+HBwbXCHYAw0r6O2Rsl6qIN/9ah2YT8dpQK8K2VhOjQCdZVIT99OuNxLE8CyyxYwGsnqLALIZhDRsNGYgPK7OsZQNcBJON6dfl2eBcNzyJgfUp5FU+ajFRpn8k1NI5GndJdsNfwcTJKgmiRkwX7ZOOYTAOnI59sJ5AD8t0rovZtUMSdyy+ZsCDNDHgoXaZ8vpAFtR5yTsgNtAcWry76ld36i5L5R3egSBhmL3wYsaa69qYw6ood/LNx+7Yk9TqUo77D3QdezrmUc6/vPSA+EmfVkqktvopp4Z06e5Jdnz7Z0DHflRDFzKO9NpMlMaZGKBw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdkQ1A4ZzAwdGE0QTdmTC9EdGRHa0Z5SHplZWovajZ1clZJY0l6d3lWa0kx?=
 =?utf-8?B?aVRXT0NObzl4QzQ3eVhGSUsrYk9ja0tSZzVwODVyaXZaWjFMYmI0YmZoTGVY?=
 =?utf-8?B?SlluQzFqVytKbkVqdHE5RFJLZDgxdjRwN2owNi9kRWdZYTdFaENPckFhcllk?=
 =?utf-8?B?WFA1N21tODQ2U0pMc0VNYnFDM2FVaDVwS2toWTVyNCtxaXRjVk5OQ2locWNJ?=
 =?utf-8?B?TGZFaG94VTh5ZGZoWWs3Y2hnREM4NFVEYWZGc2hNYlF2VW56WU1SN2t4QjF5?=
 =?utf-8?B?VVM1YWZlRW1qMGJYMDBOdzZ5WUtvN09QN0pBTGxoVkZEdzV4SGpoWTNSN1VK?=
 =?utf-8?B?RHRzN3R2MlZIOGd6R01wbld2RjM3V3RDa1g3QzdMZHZmTWlmR05kc1E5Z2V3?=
 =?utf-8?B?YjhLVzNydXBtd2VTYm1BZzg4YlF6ZGloZTJVcmFGYzA0ZUpoVWRiZkhyUmIy?=
 =?utf-8?B?c0M2Zzkzd1VZdkVwZE5MQzNneS9UcDBZZEF1Q3N0dXpBUXdPRE5Vakt1N0Jn?=
 =?utf-8?B?TTNWd3pLSU15dXdpWnhDNW5mK0o0YVJPN3VOWkdLeXJQT0VsTUhaRUUvaTZx?=
 =?utf-8?B?aW0wdXlISGVFd1NKcFd1Y2hFY3ZIejBKY1NLdy9zZEFUa2tmbWw0U2VTQ0JX?=
 =?utf-8?B?T0x1cEtYdnNFVUVPTzAzdFpHQ0NkR3puRnBsQ1pFVDdZa0Z2RTJod3VCdHFZ?=
 =?utf-8?B?SXZCeWtKeTdjZlpCVkVSZmJSQTFDRkg1UlBYRUFydWhTZFRXTndiQlNhMXBm?=
 =?utf-8?B?YTRtZWtzaTBkMDh4TTAra1NSK21jZ1lWUU94YVVUZWZXWHJ2c29McGxjbG5u?=
 =?utf-8?B?aG1UY3F2UjRTbDZGZWVpK0k2aS9ZN0RKVklqcGZjb0plTzcwMllSUEJHbEhh?=
 =?utf-8?B?bXhUR3hrMDVDL0dZSCt2VWFsWlhLNENrSW95blpyaGw3dmI5Q0FnSUh1enZ4?=
 =?utf-8?B?aW9xNGVHcXNzeGljeDZpeXArY0hyUS92TFl5ek5VcVNza0Z4QWN3SENkTmly?=
 =?utf-8?B?Z1h1Q09iUXhGdWFNb2tEeDJRMy9vazBsRGkvTStiMEptckZpRytqVnZwQTBz?=
 =?utf-8?B?Y2VQZUJHM25lYkZsRnkvdWw4SXcwRDNEemhEQ3d4LzM1Rzc2VTRVWGVzOGYx?=
 =?utf-8?B?dFh0RHBzMGRZWEhlaGVpNDM2aXJpSjNsMDdJMVoxLzlRTVE4SEg0M1VRZjJi?=
 =?utf-8?B?TnJxTVJaUnozaUZMU292UlI4OG9RaWxqNmVoTDB3NGJFL01RN3g1TWFublhs?=
 =?utf-8?B?Q2dSZjQwRVVYY205cHBkNkRLTkRPaUptdmlPKzB2KzFyaGZ3cE9CcW9YQVpa?=
 =?utf-8?B?TmpKRUN6czhadGRkV3NqSHZ2RDFYZHBLemErZHZiVkl0aVMxYVcwL3ZNMmhF?=
 =?utf-8?B?WFplM3AraGFid3h4ckExeXYrb2I0blNMRllUK3pZZnZ0SXZHOEJ5NHFhR2M0?=
 =?utf-8?B?NnhySmlPSGFFY3dISTMyK1hlY1FFVE10cVpGRnRPVkxQODJzdHo4SE1EN21S?=
 =?utf-8?B?eVBwR2J4L2xwbVg2b3JpZWNMdnBDU2RCSlZ0a1hnZDZybGUyQTN0S1RXYmE2?=
 =?utf-8?B?bitQSCsvNStEUDVVOVZGRk1mL2hpTUJKZW1IM0ZzRUV4Mmc3RVhtdlZYbGJB?=
 =?utf-8?B?Z3FIS3pKc25YRkZaSXdMNmNpWWJJL21xQlQ0SmZERHZ3TjFkWkl6aTZyL3g5?=
 =?utf-8?B?bXhkR2hadGh0MmhMbXVoRzh2aTJyb3JWb2p4UzZUdnpBNnFuWVJzOGxBdWJ4?=
 =?utf-8?B?aThpczVramFRcW5CSlZHcjlxZ0ZLa0tLUFNtQkg2dFdIQnoyUXBXSGNFVVdF?=
 =?utf-8?B?UURkMzU3UHNjZTlvclRwL3BKNWtSaEhtMnN0OFpKb0dvU2Q0am01Zitub25a?=
 =?utf-8?B?dm9YSW9WVGRMeHBDRXVDVWhtVGhLdXByOEltNEMwSjdmZjloVis5cWNyTHhk?=
 =?utf-8?B?b2pHU2MrTXVUa1JHOUg1WVhDczhjdEZXMHZTcDlMTlF2aEpjUnlBbm92R05M?=
 =?utf-8?B?NjY5WHY1SnJZR3hKcEx4bW9iVkZ5VFhzalVlSmN6ZTBaZndmVFlBZVpNNzNE?=
 =?utf-8?B?MXVlalo2TzFkYk5CUW5DQmIvZnc1ZEZ0QnVoK2xjYVQvOTBuOWx3ZWJ0TGEr?=
 =?utf-8?B?eWtTSm9KWjhEQVBqKzdqZmVvcE9BNHQwMzJ5aWZWZnZRSEdVcjJma0RXMUZk?=
 =?utf-8?B?cGxjS052dXF1amVxVWNRYml5SERLZTRNTmNES09uNnJTMlFuRmdjUFFoYWJP?=
 =?utf-8?B?MEQrTzc4eGVWQThxV2RiczdsNER4UktOandiRWtKbVJNT2dYYnBocEVuNndw?=
 =?utf-8?B?Y0drKzNiOXQreUk4NUZ2czhBbGdzbXBuVFFvWkJWYlltYWZwRGdzUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49161fc9-a3ce-44a3-c5f5-08df335c7b58
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:27:21.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQDyTD26bLaheoDw74p+dfSprcU0Ax39Vl7H//WO0fjhwHwZdhk7u07lIbQQ02sQ06RJgUtemf2lEgmg+6vPq+/e2aFrWcIMfvVxeBWtTIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5388
X-purgate-ID: tlsNG-ef75cf/1793017734-A64DBAE4-7D2341C5/0/0
X-purgate-type: clean
X-purgate-size: 6039
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/10/2026 2:57 pm, Furkan Caliskan wrote:
> The raw 64-bit constants in boot_gdt[] and boot_compat_gdt[] hide what
> each descriptor actually is.  Replace them with a GDTE() macro, modelled
> on Linux's GDT_ENTRY_INIT(), plus named GDTE_FLAGS_* constants and a
> GDTE_FLAT() helper for flat segments.
>
> No functional change.
>
> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> ---
>  xen/arch/x86/desc.c | 61 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 48 insertions(+), 13 deletions(-)
>
> diff --git a/xen/arch/x86/desc.c b/xen/arch/x86/desc.c
> index 9f63928154..647affb6a3 100644
> --- a/xen/arch/x86/desc.c
> +++ b/xen/arch/x86/desc.c
> @@ -27,32 +27,67 @@
>  
>  #define SEL2GDT(sel) (((sel) >> 3) - FIRST_RESERVED_GDT_ENTRY)
>  
> +/*
> + * Expands to a brace-enclosed initializer for seg_desc_t; only use it
> + * inside an initializer list.
> + *
> + * flags: bit layout matches its position in the descriptor's high dword
> + *   bits 0-3   : type
> + *   bit  4     : s     (0 = system, 1 = code/data)
> + *   bits 5-6   : dpl
> + *   bit  7     : p     (present)
> + *   bit  12    : avl
> + *   bit  13    : l     (64-bit code segment)
> + *   bit  14    : d/b
> + *   bit  15    : g     (granularity: 0 = byte, 1 = 4KiB)
> + */
> +#define GDTE(flags, base, limit)                                        \
> +    { (((uint64_t)(limit) & 0x0ffffULL)            |                    \
> +       (((uint64_t)(base)  & 0x0ffffffULL)  << 16) |                    \
> +       (((uint64_t)(flags) & 0x0ffULL)      << 40) |                    \
> +       (((uint64_t)(limit) & 0xf0000ULL)    << 32) |                    \
> +       (((uint64_t)(flags) & 0xf000ULL)     << 40) |                    \
> +       (((uint64_t)(base)  & 0xff000000ULL) << 32)) }
> +
> +/* Common flag combinations (same values Linux uses for equivalent segments) */
> +#define GDTE_FLAGS_RING0_CS64   0xa09b   /* P DPL0 S code  RX A, L, G */
> +#define GDTE_FLAGS_RING0_DS32   0xc093   /* P DPL0 S data  RW A,    G */
> +#define GDTE_FLAGS_RING1_CS32   0xc0bb   /* P DPL1 S code  RX A,    G */
> +#define GDTE_FLAGS_RING1_DS32   0xc0b3   /* P DPL1 S data  RW A,    G */
> +#define GDTE_FLAGS_RING3_CS32   0xc0fb   /* P DPL3 S code  RX A,    G */
> +#define GDTE_FLAGS_RING3_DS32   0xc0f3   /* P DPL3 S data  RW A,    G */
> +#define GDTE_FLAGS_RING3_CS64   0xa0fb   /* P DPL3 S code  RX A, L, G */
> +#define GDTE_FLAGS_PERCPU       0x0091   /* P DPL0 S data  RO A       */
> +
> +/* Xen maps every flat segment across all of memory. */
> +#define GDTE_FLAT(flags) GDTE(flags, 0, 0xfffff)
> +
>  __section(".data.page_aligned") __aligned(PAGE_SIZE)
>  seg_desc_t boot_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
>  {
>      /* 0xe008 - Ring 0 code, 64bit mode */
> -    [SEL2GDT(__HYPERVISOR_CS)] =      { 0x00af9b000000ffff },
> +    [SEL2GDT(__HYPERVISOR_CS)] =      GDTE_FLAT(GDTE_FLAGS_RING0_CS64),
>  
>      /* 0xe010 - Ring 0 data */
> -    [SEL2GDT(__HYPERVISOR_DS32)] =    { 0x00cf93000000ffff },
> +    [SEL2GDT(__HYPERVISOR_DS32)] =    GDTE_FLAT(GDTE_FLAGS_RING0_DS32),
>  
>      /* 0xe018 - reserved */
>  
>      /* 0xe023 - Ring 3 code, compatibility */
> -    [SEL2GDT(FLAT_RING3_CS32)] =      { 0x00cffb000000ffff },
> +    [SEL2GDT(FLAT_RING3_CS32)] =      GDTE_FLAT(GDTE_FLAGS_RING3_CS32),
>  
>      /* 0xe02b - Ring 3 data */
> -    [SEL2GDT(FLAT_RING3_DS32)] =      { 0x00cff3000000ffff },
> +    [SEL2GDT(FLAT_RING3_DS32)] =      GDTE_FLAT(GDTE_FLAGS_RING3_DS32),
>  
>      /* 0xe033 - Ring 3 code, 64-bit mode */
> -    [SEL2GDT(FLAT_RING3_CS64)] =      { 0x00affb000000ffff },
> +    [SEL2GDT(FLAT_RING3_CS64)] =      GDTE_FLAT(GDTE_FLAGS_RING3_CS64),
>  
>      /* 0xe038 - reserved */
>      /* 0xe040 - TSS */
>      /* 0xe050 - LDT */
>  
>      /* 0xe060 - per-CPU entry (limit == cpu) */
> -    [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
> +    [SEL2GDT(PER_CPU_SELECTOR)] =     GDTE(GDTE_FLAGS_PERCPU, 0, 0),
>  };
>  
>  #ifdef CONFIG_PV32
> @@ -60,29 +95,29 @@ __section(".data.page_aligned") __aligned(PAGE_SIZE)
>  seg_desc_t boot_compat_gdt[PAGE_SIZE / sizeof(seg_desc_t)] =
>  {
>      /* 0xe008 - Ring 0 code, 64bit mode */
> -    [SEL2GDT(__HYPERVISOR_CS)] =      { 0x00af9b000000ffff },
> +    [SEL2GDT(__HYPERVISOR_CS)] =      GDTE_FLAT(GDTE_FLAGS_RING0_CS64),
>  
>      /* 0xe010 - Ring 0 data */
> -    [SEL2GDT(__HYPERVISOR_DS32)] =    { 0x00cf93000000ffff },
> +    [SEL2GDT(__HYPERVISOR_DS32)] =    GDTE_FLAT(GDTE_FLAGS_RING0_DS32),
>  
>      /* 0xe019 - Ring 1 code, compatibility */
> -    [SEL2GDT(FLAT_COMPAT_RING1_CS)] = { 0x00cfbb000000ffff },
> +    [SEL2GDT(FLAT_COMPAT_RING1_CS)] = GDTE_FLAT(GDTE_FLAGS_RING1_CS32),
>  
>      /* 0xe021 - Ring 1 data */
> -    [SEL2GDT(FLAT_COMPAT_RING1_DS)] = { 0x00cfb3000000ffff },
> +    [SEL2GDT(FLAT_COMPAT_RING1_DS)] = GDTE_FLAT(GDTE_FLAGS_RING1_DS32),
>  
>      /* 0xe02b - Ring 3 code, compatibility */
> -    [SEL2GDT(FLAT_COMPAT_RING3_CS)] = { 0x00cffb000000ffff },
> +    [SEL2GDT(FLAT_COMPAT_RING3_CS)] = GDTE_FLAT(GDTE_FLAGS_RING3_CS32),
>  
>      /* 0xe033 - Ring 3 data */
> -    [SEL2GDT(FLAT_COMPAT_RING3_DS)] = { 0x00cff3000000ffff },
> +    [SEL2GDT(FLAT_COMPAT_RING3_DS)] = GDTE_FLAT(GDTE_FLAGS_RING3_DS32),
>  
>      /* 0xe038 - reserved */
>      /* 0xe040 - TSS */
>      /* 0xe050 - LDT */
>  
>      /* 0xe060 - per-CPU entry (limit == cpu) */
> -    [SEL2GDT(PER_CPU_SELECTOR)] =     { 0x0000910000000000 },
> +    [SEL2GDT(PER_CPU_SELECTOR)] =     GDTE(GDTE_FLAGS_PERCPU, 0, 0),
>  };
>  #endif
>  

I don't see this as an improvement.  All you're doing is putting a layer
of indirection, and moving the attributes away the comment explaining
what they are, and the attributes are still raw.

If you really want to macro this up, then at least use INIT_GDTE_SYM()
from XTF or MiniOS.  That way you get things in a legible form at the end.

~Andrew

