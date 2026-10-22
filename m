Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F8606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=R/+tTo6Z
Received: from list by lists.xenproject.org with outflank-mailman.1458523.1670709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJxUO-000732-4Z; Thu, 22 Oct 2026 18:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458523.1670709; Thu, 22 Oct 2026 18:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJxUO-00072v-1m; Thu, 22 Oct 2026 18:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1458523;
 Thu, 22 Oct 2026 18:26:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xJxUM-00072p-W0
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 18:26:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJxUM-003gqZ-CL
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 20:26:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ada5521-e002-0a2a0a5209dd-0a2a4506bcbe-20
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 20:26:06 +0200
Received: from [52.101.52.41]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ada553c-195a-0a2a45060019-34653429278a-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 20:26:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5778.namprd03.prod.outlook.com (2603:10b6:303:6e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 18:26:03 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 18:26:03 +0000
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
 b=TusHCX6cSTJWYE6VUdFmS3TDqGmnwQtnENfLtDDpnr61K6tBgT/pg9iGGxnSnrPGHysdWtkiwg6ziDKG4V1JsM0D2ctb4vwunW1vVZy7CcFZgapLXJjRzdQX1f/FVtZ2A5k/dJeBU1MRw+d6C9Bnxch1g7c/y9lAvhwnL1F3pZU/h2TWL9wGkPwpL330R+vHt6uvd8KRSPIo8BjJO6LfAOW34mXn0eGEr04nGtcx1Li/sQNZ/gF7wCSNgnMolaPXeD9ujTvAcpbh94V4rYYgnJNKLdX70CkmMu5PjjDyRddcgkBU0nj8pS7VtDXGhabKw+SJroC/w12ewNbgZoLkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoWiVcX3/WbsE7kFzD5lGF+CS5uiw3aAqy4e8uoxvGM=;
 b=vigKiju8bJkdPhMRDMspDFAU04vi8xybs6VoYZ4uNGEDkk0Onovxdivp8cwIfekwoYulz8W13WlEpPR1lcCrXRBk4ettKhOiwk+EfeMCh3okUjt1nRhnCf9D2hYLV7XIhlI1uA+p0yTBpGQvl3RT6LWho85olnCfZ9EjjNAgttDcB5hLkeVuIC4Dv1R7Yyd/8i+xwEiSdyxPknkYxsK3TgYTnDyAr6sgo6j4DeMfQk1cSS1nfQZc6hHFA4YChQZT4z6xgfdS1XQ5lZlTQmoBkCbEYVwEO9vEaSSKfvL1huh3eEo+bz6U5R55uF46RP/LDYDORYGkJ6g3x4uK5Hv1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoWiVcX3/WbsE7kFzD5lGF+CS5uiw3aAqy4e8uoxvGM=;
 b=R/+tTo6Ziw9u4QSX3xSeFTmwJewpX3M4lhSZUCN2tk0wBjNk1HOIixvHuTuY/VtK+anvsKneX7cNlryJVGJdk1NnrHU0SaFs4eVqyNbdxIJ1Oi7PD271p01axdZ6lXfltDoriogwbfIr/cpfXph4XytSRDVJspz3ANJtXfEBG/8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b0954424-aaec-4900-96e3-901b051edaa2@citrix.com>
Date: Thu, 22 Oct 2026 19:25:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] tools/ocaml: add bindings for the paging mempool size
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
 <20261022142744.338622-1-julian.vetter@vates.tech>
 <1792679272.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792679272.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 0753c98c-1096-436b-a7f5-08df3069edd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|261009223027099003|261021135927099003|261021121427099003|10067099003|56012099006|261022105027099003|6133799003|261022075727099003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	U/LNCHIGQvFRs6cfo7/JYovjwSg7OGVh5fwLdAgnYtyJet4eQsMgXPaAViBQE1KGNDNNj5VKICJ8xBAP0FJTw4gS3Nf5FeHCShQ6UFu+jpmAcw/zj1nPkNIHr/NS1p9qe75Vk9AtYXP3k/hxnJMOXDlf51xNyNpsAm8nHV5vmqImP0y9rLnPf1q2DhA6bsZKaOSayBT0D9MADJ+iNJa6DKMSfCfUrRnH1n6PC3XDcjGihA14Wp/ZmhLfW/M7+GHLln9ch21yrOamrqWRBzOjKQYkfZAG8Opws+CedqT59MDde+mZrH6DlnbwwtdWdP2iavCGPCYJlFzKf3qjGv3pVTmJ6JPD8IOIFlW00lsKTBo+Lk/wNbvh5L/Ut7CCFFJTMq9lFDqB8KuIx97s9xtFncOB0B3QymgHQhFSvOWgN4ei9ieepDBTH7xbynrW1ld//dO2q5IsQihF9svRJxLld4GuEhEE6IpwDiGY4+OMPlCKXmrepXH0JoaVwC6eKQKsHJrjKWbXWskh6+94Cnc2iexbXJDh0dqCP6/pjNdwkCLE3Hh8szW49pz+GC3s6+EbJpJUd45/licbeH6Fq4vUUZfWRKIdYjjHtFuEqRhaSKN/Acjib5Xx7ZeZCk6zib26AWCSS6ogT9VObNI/p/5uAOTnzKGfj/vmGZE+0gOwhH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261009223027099003)(261021135927099003)(261021121427099003)(10067099003)(56012099006)(261022105027099003)(6133799003)(261022075727099003)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K05WYXJNQWFWOGdJNnNVZEFweHZNcCtSSERtWW12Y1ZnRzFsOURmTnlpQStm?=
 =?utf-8?B?SHVuN0hSUHFYeDdsekZ3S0lZdjc2VDFrUytMS3B1SkZmVjZ6T1g5UVVyZFNV?=
 =?utf-8?B?WGFTSEt6TXF0OGQxWkZ4NEFMWmJHL1grS1BXQkwxTHVlZlJuR0lUTEZyenZM?=
 =?utf-8?B?dGZGMnRGTmJGTXhwUnN0Tkx3UnN3a0wxNlFuaEY5Y1BTMFFKek5jT01INVZk?=
 =?utf-8?B?MHRzdDM0WDJOZlZGc01lUDJ3YTNqTUEzVFJ6VFdsS0h3dHczTFgyMDNPRCtt?=
 =?utf-8?B?NnVKY29xTEovRjFHYXdFWmc2YWxXdWJjUW1JdHFocld1RUJCbDVaTGJmZTFr?=
 =?utf-8?B?WkxVWWMzZTdEOHBSS29ySkxmRDVzSE1WVGNaZ2tjNXp4WVhIN1IzMEtpdW11?=
 =?utf-8?B?cXU4WHhjNkt5RU9ab2IwSDNnaGsxSXhVdlBkbjFQMjBDc29ZUW9GWVdFVVA4?=
 =?utf-8?B?ckE1c2FkRzNzdDhlbWhOZVNQdko2aFRTT2R0RkpKWkRBTnBTOWNhMmhGTnky?=
 =?utf-8?B?Ukc2QkRTclNXNFdwYS9tSkJWdWpTSllGeEpTamZWV1JEaTMwenpXbmhjcUIw?=
 =?utf-8?B?Z0RUZ3dYblQxY2RLMVVEYWF0UXY4Wm9JbXgrRXZsTFpNblZFWTZ4R29vZnZC?=
 =?utf-8?B?b3lMeUU4RnY5L0lkL282MzNKMk53WDhtWHlkQVFmSWtoTlhDWDM1VzVPU3g5?=
 =?utf-8?B?S3dxUjJreldteGV0ZEZtM1VhNVhHSFhpR3owNnYwcnhhL1BxQ3JYS2dqNVdW?=
 =?utf-8?B?eG5YRzhIaHZCcjJ5cWxkMEw1ODIrekZhdG9ack03UERzUkhzMVpQYnRQZmI5?=
 =?utf-8?B?YmMzYVBicWNYbTNWTWRxTzNocEQ2Sm9oMWV1elVkd0J5aUJoWERycjdYRjU4?=
 =?utf-8?B?dWJvWnQyUHQ4UklzMUVPSE9saG8yVFRtZFZiUEsvMHVSVERGMFRRd21jV0Q1?=
 =?utf-8?B?dVBaQ0tNRGlIeCsyWHN5blhRT1ZvR2ZLcjVUSCtYQk0zLzU3bVRrend4dnZL?=
 =?utf-8?B?SlBTZlE1YVQ4NXd1WkQvdERjVDdIWjVNQTM0ckhOYUxlMkhmNWNFSDkwdDFo?=
 =?utf-8?B?TDNTeVlMWkMzby9HOXY4OVVBUzNQZnR1RXJheWxkanlrZXRlaHlXWENSQ0Fw?=
 =?utf-8?B?REkzc2VHSXZodGlBN3pGcjlLS1k5WVZNSWdlTTUrODBEWERxK0ZjWUhlZjho?=
 =?utf-8?B?dGdpdEVYNTV3dkpPV3JOcHpsZmlaRnZUT0NpaHVKVlB4RFdneEdOc0lmS2tU?=
 =?utf-8?B?dUV6a1VVNXpLa040NmMrRXE2TVNtZzgvbmNteDYwRGRHT0FHbURQU25tTlFG?=
 =?utf-8?B?VWZqeUxqL21WM0NmcG91a1Z2cjAyN3RpYjArR3Rmc1dlSUY4Z2EzK2xHNExW?=
 =?utf-8?B?QnUzbXRwNis2Z3ZWZGNWU0h4SEhRVUhtQjhmcUJNei91dmJxYWQ4MXBJb1Nz?=
 =?utf-8?B?ZVFBcUpvS25jd2FlZ1RZMHZjcC9NRzhNMEVVeTUvanpmVDdDa3MzeElRZURz?=
 =?utf-8?B?a3A2N29ia24rclp2cnFoWDVKeUFXYTFPTFZ6V1ZNUzNyTExkUFZ3eVVJRTdP?=
 =?utf-8?B?WmtXWUQwVUJMQVpwTGhnWFJhb1gwZTF0S3JtbVViVHhwcTJnUi9vZDdNVlEx?=
 =?utf-8?B?NnI0M0JNYlZneFVWNFQ3U0FSbzgrZTN1TElGbkl4UW1LeS8wZzIyaTFwUHVt?=
 =?utf-8?B?NVplcXl1VUhsaEpSVFMrODErclRTTXZMdUVIYlRyRkJjM2dab1p1T1l1VlYy?=
 =?utf-8?B?SVBic1dYNHZ6NDN2YjByeCtpQ253M1pXcFk4VUMyZmg4d2N3WWNTL2QyeENW?=
 =?utf-8?B?clI1SzBueDRuckYxUlJ2UHZObDdzSzdQdFpRNUZ4bStzQ1FFeS8wZFluR1R4?=
 =?utf-8?B?SUF5bU9YNUdRSndMaXNXZWlsWk05V1h3enZicUFXK25FYTNoNTlROXg5NmV3?=
 =?utf-8?B?YmZyRnlmdi9ERGRxYStiQlY1NTIyLzJ0Um1GYVdTRUVhOFIwUzJmM2dBdGp6?=
 =?utf-8?B?UjdYKzBaajcxaWpSUVZRZkYzSjkvWGllRlFjblAvaEZwRHlPTFFNOFEvMElC?=
 =?utf-8?B?RmkxbWFFU0NvK081eXZ3c0kxcDVZMFBEK2d1U1pLTWh6dU5tcWN5NUVxdGwv?=
 =?utf-8?B?VHVZT3JpU0hKcmJYbUVXaU9ldUx6cUZPMHRobXM5OUp4MzNIQVVDRUVxOENN?=
 =?utf-8?B?Skcya2ZFTlplSXFibk1LV2pueTZvdGRDaW1MK3RBV3hwdkwzU1JQeVpYb3Zv?=
 =?utf-8?B?MjFzUCsxTE9Ua3JiZFJOYzFMRXc0SkpHZ0JianBYaExiVmd1VGs4aEJOem0w?=
 =?utf-8?B?dFVGTTBmbDFSOVhGOTlSYkQvS25QOFFKK1BjcUwyRlB6UWJ5a3hKQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0753c98c-1096-436b-a7f5-08df3069edd0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 18:26:03.0647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VU0FW/AaQzxfOuML0fSeWDHtxSy7pkmYPMbAT45Bpc67DoIPTa4FzO8DUVhF218ieVjlJmpvurv5NV9BcZrpQJgDCKifwPvDidY4oD1FfkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5778
X-purgate-ID: tlsNG-16d1c6/1792693566-F5E0E77B-895F2766/0/0
X-purgate-type: clean
X-purgate-size: 4658
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 3:27 pm, Julian Vetter wrote:
> The OCaml bindings only expose the shadow_allocation_{get,set}
> functions, which use XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION. These
> are x86-only, on ARM they fail with -ENOSYS. So, an OCaml toolstack has
> no way to size the P2M pool of an ARM domain, which libxl does via
> XEN_DOMCTL_set_paging_mempool_size.
>
> So, add a pair of functions paging_mempool_size_{get,set}, which just
> wrap xc_{get,set}_paging_mempool_size().
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  tools/ocaml/libs/xc/xenctrl.ml      |  5 +++++
>  tools/ocaml/libs/xc/xenctrl.mli     |  4 ++++
>  tools/ocaml/libs/xc/xenctrl_stubs.c | 33 +++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 37e41879bb..55cfc2e9a2 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -283,6 +283,11 @@ external shadow_allocation_set: handle -> domid -> int -> unit
>  external shadow_allocation_get: handle -> domid -> int
>    = "stub_shadow_allocation_get"
>  
> +external paging_mempool_size_set: handle -> domid -> int64 -> unit
> +  = "stub_xc_set_paging_mempool_size"
> +external paging_mempool_size_get: handle -> domid -> int64
> +  = "stub_xc_get_paging_mempool_size"
> +
>  external evtchn_alloc_unbound: handle -> domid -> domid -> int
>    = "stub_xc_evtchn_alloc_unbound"
>  external evtchn_reset: handle -> domid -> unit = "stub_xc_evtchn_reset"
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index 7a0dd7d8ba..0d5cc94198 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -210,6 +210,10 @@ external shadow_allocation_set : handle -> domid -> int -> unit
>    = "stub_shadow_allocation_set"
>  external shadow_allocation_get : handle -> domid -> int
>    = "stub_shadow_allocation_get"
> +external paging_mempool_size_set : handle -> domid -> int64 -> unit
> +  = "stub_xc_set_paging_mempool_size"
> +external paging_mempool_size_get : handle -> domid -> int64
> +  = "stub_xc_get_paging_mempool_size"
>  external evtchn_alloc_unbound : handle -> domid -> domid -> int
>    = "stub_xc_evtchn_alloc_unbound"
>  external evtchn_reset : handle -> domid -> unit = "stub_xc_evtchn_reset"
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index e0c435e346..ef3d16beaa 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -1259,6 +1259,39 @@ CAMLprim value stub_shadow_allocation_set(value xch_val, value domid,
>  	CAMLreturn(Val_unit);
>  }
>  
> +CAMLprim value stub_xc_get_paging_mempool_size(value xch_val, value domid)
> +{
> +	CAMLparam2(xch_val, domid);
> +	xc_interface *xch = xch_of_val(xch_val);
> +	uint64_t c_size;
> +	int ret;
> +
> +	caml_enter_blocking_section();
> +	ret = xc_get_paging_mempool_size(xch, Int_val(domid), &c_size);
> +	caml_leave_blocking_section();
> +	if (ret != 0)
> +		failwith_xc(xch);
> +
> +	CAMLreturn(caml_copy_int64(c_size));
> +}
> +
> +CAMLprim value stub_xc_set_paging_mempool_size(value xch_val, value domid,
> +					       value size)
> +{
> +	CAMLparam3(xch_val, domid, size);
> +	xc_interface *xch = xch_of_val(xch_val);
> +	uint64_t c_size = Int64_val(size);
> +	int ret;
> +
> +	caml_enter_blocking_section();
> +	ret = xc_set_paging_mempool_size(xch, Int_val(domid), c_size);
> +	caml_leave_blocking_section();
> +	if (ret != 0)
> +		failwith_xc(xch);
> +
> +	CAMLreturn(Val_unit);
> +}

I personally would consider these bindings fine.  But if we were to
accept the code like this, we'd have to make a change in due course.


It is not safe to use Int_val() inside a blocking section like this. 
Well, it is actually safe, but it also triggers ThreadSanitiser and
therefore the Ocaml devs have declared it to be unsafe.

During the mark/sweep phases, the Ocaml GC writes back every single
value, even the non-pointer ones (despite not changing value).  And
instead of fixing this behaviour, it's been declared to be "correct"
behaviour, forcing every C binding to be edited to avoid the pattern.

So, you need an `uint32_t c_domid = Long_val(domid)` outside of the
blocking section.  At some point we need to fix this pattern everywhere
else in our bindings.

Thinking about it further, we also need a truncation check on domid,
because a 64bit Ocaml could pass 0x100000000 which would get truncated
to 0 passing through the bindings.

~Andrew

