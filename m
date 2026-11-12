Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB00606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=RP7/h4Fc
Received: from list by lists.xenproject.org with outflank-mailman.1485868.1688918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVHm-00037V-Iw; Thu, 12 Nov 2026 13:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485868.1688918; Thu, 12 Nov 2026 13:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVHm-00037O-GE; Thu, 12 Nov 2026 13:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1485868;
 Thu, 12 Nov 2026 13:56:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRVHl-00037I-7h
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:56:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVHk-00EFm5-D2
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:56:16 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5c565-bab6-0a2a0a5309dd-0a2a450aa378-44
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:56:16 +0100
Received: from [52.101.48.51]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5c57e-f2d2-0a2a450a0019-3465303336e2-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:56:16 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7386.namprd03.prod.outlook.com (2603:10b6:610:19d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 13:56:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 13:56:12 +0000
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
 b=Sro+bNF9itaOveJw3TMc0PT5mH4etkCKe9DK0mldQZlig72VfRTgCBJyQXKGd5zVm8N/YCUS+XSMOrLGh7yRFh7ILcbFoDG/1W5D7S5C5UxWA0xE30As87iBc1j+NxKOce1COmIgIvOLN+KGaDs6kxogxvNauGW5irt6qVbVWd0WQuRHQ/SKw10F9AMPOQEDoWzV+VYs43PqewCUxVLsO7w94i2+4bXNV6a5r56rHkPRE91OkYR1lnUkVhtaxsML+rx1KTAG/fjCmLW0VO8xud8s4njWoeT6UdEkDGFeAX+o5AyxCfAJq1swJlxaCibtAEWcdA0/yoJLarXrSbVvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1qTGd7lgi+11zkzyAyuW6DqH6ipFfXAfdcZ2XfaEI4=;
 b=uqf3BdQ3HnVjVfPp3z4QytaXHkB9mwQV6X/vIZvstcyVGD9wGsjoklPwF2ObBHmqtUeqyGPYE0zlqpBcDborDC2hP8wi7PlZ/poHjHX4S0BlU1BIJ0P6xxn5vBxpZsa41K7hu9MIv+4RngagliyIfKSPq2mDy269d0dbI+Y9FEBrF6RK5lWxkg79SnJ4SV1yvibXEl3Y2oWVZid067EU/RSERDc13wq6ooC7U1Fo9SxSatOkI3F47TqkJ/cCAwYu2LjP5uyghiu9F3l8D48aWQuA/LLZtJGbvE5/7BZnQw4FG73FZYppRF21B1YUQX9bb6bMB47DqQrt77CC24LyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1qTGd7lgi+11zkzyAyuW6DqH6ipFfXAfdcZ2XfaEI4=;
 b=RP7/h4Fcf99bbv+AQJmu+wEqulLgybmMJHf6Kn4hNDAd7evHvZsJWeI8x+E9Dvs8T3febVdLez+vSFoG3si4n/9tQi3fhIfBQsL9SxwfZR/dJRiCvtQtQCDnDvZMSFGFZx2/QZT63U5Hr+Oyyn0RQdcCxBFNJThzsc1Z5dLfO2s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a3417b2a-11b1-4075-b4d3-fb8ad6cbe482@citrix.com>
Date: Thu, 12 Nov 2026 13:56:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v5 2/6] x86: rearrange how mod_l*_entry() functions call
 UPDATE_ENTRY
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-3-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261112100005.324440-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d521b71-eb27-442f-65b9-08df40c4b5fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|10067099003|261009223027099003|11063799006|261026121527099003|4143699003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261022105027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	hsSoPdzmTjhwJ8xMMBVnyeJpLS4Qe/AjBMsRunZ04fM758PERrE7FVws0CDOYAiadH3q4xyThCIpmBOKWPsPfdNE8SL1EK1z2zkCl4umd0+JTGiOltv+sDWX4aIDWjxpk4e6QiMMP8pJedKbEROz6LSvrtnWzdMgsPNiv4BpuLXT9/8LmIGlCNmAV3EmIinkNBPgZPiWKPnhMtXo2s8FnceVKIDom7vsqvvJlPxc5cnkD7pOMmbU0eb9jCYXmr/mSa+hEjppBln0i++7/HGh1JJcG/larQi8XLLOFEmVMd36PR1lvtP1+uIGDVOvcC0+rA6KBdlrwDpiNQlk456MhW2bGwSi6KArvxaYuMNcujBsfshjzATQFtxSnyMqyI+ugUAZfpU4oI0t9KNGl77TwGbyOordNEOrojtpjjsPbz7MJLo48injxYpSe4cTmDKh32uT87XkFSzUz706zt/V3eGmIXoZexXBGAkvZWm2xigJUv5CCvOoAx5ZJOseX5ZsEqZn7pX0lYeuJWyWfjKtIN3rbayxBAIVIlJOqRsebLV7HyychgtvXF89tOocL04kXkbDLaGgKcRu84Ou/S7ZGfx1Mvqx1vXXnLD5G4z4fmNkcNH/S3PDvt1DFcIZgBBPeVsHajQrNejQIc4ClxhfUJb9vDNz4E9+N5hEhNPw8fw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(261009223027099003)(11063799006)(261026121527099003)(4143699003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261022105027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVU5V0RYOThGVFFta2Y3VWZzbGFCRnNSbitUWERBSHhrbmNJQThnMFZrK1ZF?=
 =?utf-8?B?WFpTNkp6ZG4zOTFTRThsVjVqcUZKaEVWYVp4UDhnVklHWEFaK3JRUVZzZ1o0?=
 =?utf-8?B?RWVrUnNoSXV1RXRCR2ltOWtHQzNHUnVpZG1UV0FVSHU0VlJ0QTBkK1d0QzBx?=
 =?utf-8?B?TURXS0k0WCthcUdRdFVTRkxBUkxLa0RjYzlmM1g0WDJTWG1yRGpyZXRJWitq?=
 =?utf-8?B?YUMvZjlQTWE3Y29BS1VKclYxSGNxcnlYQWd2MHZuVU9lN0dmNENwVEM0Zm1O?=
 =?utf-8?B?QTZOcExxVTJDR1c0VUEzUEgzeFBSWUhVc3d1VHNVRGJOMjN3Q1pKbHg4VU45?=
 =?utf-8?B?cjNKNFJlTzNkOXdLQndGaXdSMVBKTW9aOGMyZkkyYnRlOW5mZThuTkZqV0tI?=
 =?utf-8?B?Q1FNd0pheC9YOUpYODRYTDdHU0dvazlQQ1BBR1pnMktwWHJiUGZYUkFNZXRW?=
 =?utf-8?B?allQZlkyUEs4R1F6ZzI3K1l1aUx3ZU5hWGVJV1JZcnhib3hDTzhqV0FyN2R1?=
 =?utf-8?B?NjR5amRCejVHenYyb2NuUmhkdGRyQ0toSmFGc2xMa0J6Q3Zod1dEbXB5SWNL?=
 =?utf-8?B?eXlUaGgzTStmVGFWWVNKbmkyckdETmU1b2NpSi9DaGI5ajA4MGhQRG9GanVK?=
 =?utf-8?B?MTVNbmMvdEZmd2VjMjZiMWpKUU1jbGs4L3BJTVE4U0lLUkJsc0FhUmxzQlBs?=
 =?utf-8?B?cFVscFQ2S0ZOdWpzR2xYZ2Ira0UxRHpCREM0VU5xT3dwM1FYZU5SNFVqL2xS?=
 =?utf-8?B?WmxzazdSNmpSQ0pNb2dwQUpDcFM3bGlMU2lXQnlaQ1Z3TnNHYW9UTkJ2bU9V?=
 =?utf-8?B?YjhOaGExMlRrR05ZSkxjNlFvcDNXeVFmWlBUN01TRFltYkNnY1l4ZS9WZXRx?=
 =?utf-8?B?b1FmdlN5eVNFMGYxcWtxRmYzeTVMbDFndmdmYmRDdlRXUCtndVlRaDNtV1ph?=
 =?utf-8?B?R1F1MW5OdjcvQ0J4TW96VCs5MVd3dVAvWGEwcEdRM2RQdTZVZ0FKWm90OVBi?=
 =?utf-8?B?Mjk0Vm9rTXc4YjJjL1RmT1AxZ2o4eXNmaGdlNTUvZENhZ1hHSjJBRTRpQ0Rm?=
 =?utf-8?B?Y3hEY3R0d2pHWFAwcnRFeWVjMVY3UURlT2tlTEIzbGtRaVA3VllpdkZMekdI?=
 =?utf-8?B?aDU4YndmK1VDcFo4WEdwbjcwRnhrZ1FyMjB1UTRwTEtLM01XS1ozYWg2QkxU?=
 =?utf-8?B?WHBjK3E1cFJ4NmlTZHRKTnZsTmMwT3k2OGJGaWlhMVVkTTF4ZUVlQkpFZ3lK?=
 =?utf-8?B?WnJoOHdGMHQ2K0V3bmNQS09CdEhBVWlrdFRMVTBqNXoxNnFVV0VKOFFVWHVp?=
 =?utf-8?B?cEd6QUVyb0JyS1p3cVljOXl3YU01emt5RnpsNVQ5dVNialM3SnhLUXZGR2x4?=
 =?utf-8?B?VDFFZTZyd3diNThwamRSZEVQNlBVems5RjQ0Z1N2VjBhQ3cwM2hFMkx4Q3pS?=
 =?utf-8?B?UUVyOTAweUMzVW1SVjZ3YnJqNEQ4a2xJcWV5L2FCTzMvYWJnYzcxTDJ2Ry9p?=
 =?utf-8?B?TzlwdTZwRFVqSGNsMERkUkhJd2NIMTIzbzVjN2xmZFVtNkN5WmVDRHB1dEJL?=
 =?utf-8?B?TGRqZGJ1eTJaZld0NlcwN0hrOC9IS21vVU0yaTJJcmovdkpiR0NGV2lzZkQw?=
 =?utf-8?B?bHgwd0lIZkRWdFdXZmxVVlVJTUVYbERvMkx0M3QzV0w3eWhUSiszVTF4d2Vp?=
 =?utf-8?B?Z1Q3NTM2VEM1T0wxZDNDcXlSQ0dZenIzZks3cHQrRmRZVW9jK05kbEF1cXk0?=
 =?utf-8?B?dlg0RWJITmdkanNuMWxxdWZJT21VWGxkNlRYZEh0aUt2QTVzY1R2ZkM0bDBZ?=
 =?utf-8?B?aWp0Y1gvR0VWRDFGV3k3blczWUkyZTFKdjN1UVBrTlJLV0hBaTQrNThGTWw4?=
 =?utf-8?B?VHY4ZzJnRVJZNW1uZWhZZUc0NFN0QWI3NVRxZTlOWE94by82KzgrZS9PK1dm?=
 =?utf-8?B?MW51T3YzZkZydEJ4MlY5WkRlWWFoUlUvR0c4K3N1T2w1NTFOaVYvZDAxays4?=
 =?utf-8?B?Mjhhd3gySHhVNkFwM1BPTjVLS3J5RGpzakl6eUc3L3VLYnRtbEIzdEdrRHdR?=
 =?utf-8?B?UlBUQVBEcW9YTTBFb1hWWUZkR1hZTkpLTERvR2t4VGlBRUVVY3hCYVhLZGN4?=
 =?utf-8?B?c1RqTTY4VExTL1JPaDh1ZUVOSnU0d1E1aEwvMEZ6NmRRNk5sU01UNzBIQXUz?=
 =?utf-8?B?UW9HeENQbHdzbHVleGZtVjVSWkYyMXJPT05Nb09DUDJxSG5vb3BiNVVvaDlM?=
 =?utf-8?B?Q2lCT1R3ekdQMjI1SU5nYlUrSVlkTDdwN1hMeEdyTEhRUzNGUzZucjV2SDN1?=
 =?utf-8?B?NUZvY2FGZHJkMW9UUDI2VzVXSC9rVE9YeGwxMUpVK0loS2tPbzMvdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d521b71-eb27-442f-65b9-08df40c4b5fc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:56:12.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 661+tXSoq7SBpg6YUsDFse+vWs5FDqqkJWy2NSmQGznUuw80LZJoR0KDBsr/W0V/0wsMwjgaSuJD/+lnJUwrAEgOw9SKsJ5HciEHZxg9WxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7386
X-purgate-ID: tlsNG-4011c0/1794491776-502F0CFC-C9BBFAF0/0/0
X-purgate-type: clean
X-purgate-size: 4151
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 10:00 am, Kevin Lampis wrote:
> bloat-o-meter:
> Function                                     old     new   delta
> mod_l1_entry                                1186    1113     -73
> do_mmu_update                               5546    5392    -154

This was only for the sample I pasted inline.  For this patch it's

add/remove: 0/0 grow/shrink: 1/5 up/down: 10/-641 (-631)
Function                                     old     new   delta
mod_l1_entry.cold                             56      66     +10
mod_l1_entry                                1891    1885      -6
mod_l4_entry.cold                             39      31      -8
do_mmu_update.cold                           122     112     -10
mod_l4_entry                                 917     760    -157
do_mmu_update                               5745    5285    -460

although it's not particularly relevant to live in the commit message. 
(I use it as a litmus test that the changes are along the expected lines.)

For the commit message, you probably want "Fold two UPDATE_ENTRY() paths
together, in preparation for an upcoming change." or so.

>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>
> ---
> Changes in v5:
> - New patch
> ---
>  xen/arch/x86/mm.c | 45 +++++++++++++++++++--------------------------
>  1 file changed, 19 insertions(+), 26 deletions(-)
>
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e42cd33c0d09..dc0e0d451c02 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2197,12 +2197,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>  {
>      l1_pgentry_t ol1e = l1e_read(pl1e);
>      struct domain *pt_dom = pt_vcpu->domain;
> -    int rc = 0;
>  
>      ASSERT(!paging_mode_refcounts(pt_dom));
>  
>      if ( l1e_get_flags(nl1e) & _PAGE_PRESENT )
>      {
> +        int rc;
>          struct page_info *page = NULL;
>          uint32_t disallow = l1_disallow_mask(pt_dom);
>  
> @@ -2276,16 +2276,14 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
>          }
>          if ( page )
>              put_page(page);
> -
> -        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>      }
>      else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
>          return -ERESTART;
> -    else
> -        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
> +
> +    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
>  
>      put_page_from_l1e(ol1e, pt_dom);
> -    return rc;
> +    return 0;
>  }
>  
>  
> @@ -2300,7 +2298,6 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>      struct domain *d = vcpu->domain;
>      struct page_info *l2pg = mfn_to_page(mfn);
>      unsigned long type = l2pg->u.inuse.type_info;
> -    int rc = 0;
>  
>      if ( unlikely(!is_guest_l2_slot(d, type, pgentry_ptr_to_slot(pl2e))) )
>      {
> @@ -2313,6 +2310,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>  
>      if ( l2e_get_flags(nl2e) & _PAGE_PRESENT )
>      {
> +        int rc;
> +
>          if ( unlikely(l2e_get_flags(nl2e) & L2_DISALLOW_MASK) )
>          {
>              gdprintk(XENLOG_WARNING, "Bad L2 flags %x\n",
> @@ -2331,17 +2330,15 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
>  
>          if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
>              return rc;

Looking further through the call tree, I'm now confident that
get_page_from_l?e() can't return a positive number.   Continuations are
already expressed as -ERESTART.

So, either we want:

    if ( rc )
        return rc;

or:

    if ( rc < 0 )
        return rc;
    ASSERT(rc == 0);

and (whichever we choose), we want to bring l2 in line with l3 and l4.

Given that there are paths under get_page_from_l?e() which do have
positive return values which are supposed to be unused in this
particular call tree, I'm leaning towards the latter.

~Andrew

