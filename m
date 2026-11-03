Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F928606A334
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=zGvHqrdX
Received: from list by lists.xenproject.org with outflank-mailman.1470268.1679002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHrX-0006VJ-6n; Tue, 03 Nov 2026 16:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470268.1679002; Tue, 03 Nov 2026 16:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHrX-0006VC-3g; Tue, 03 Nov 2026 16:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1470268;
 Tue, 03 Nov 2026 16:59:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOHrV-0006Uy-2J
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:59:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHrU-00DwVv-7M
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:59:52 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aea1301-e002-0a2a0a5209dd-0a2a450684f6-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:59:52 +0100
Received: from [52.101.57.21]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aea1306-195a-0a2a45060019-34653915441f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:59:51 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7952.namprd03.prod.outlook.com (2603:10b6:806:433::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 16:59:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 16:59:46 +0000
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
 b=JVOrOv8/9EntKpRQUElGGql1VZNBcFLV+uLW9Ps0x+CFUiVmH9AU0H1d4xBDzSPv9tVObzpHknT2++x6CLeJqjmLpMpOQVoVWl6kOgiknKnZPh4pEIjbHZDruuR8zasiBsth9CMby/dLx1NQVF4BE2YHefadrwkRnBLcYJ4U17aGUetfxzfSnzNCLDENFgeq0QVLUU7OE7Y4RNCuP9VFrhArWG0eMZ7pZmzKkvHDcuGYeaLYg0rGl3t+3xGtQRmqQim8GKEkysOqnv497kyNt4FuTyYD4hAYtWWDsLgsbD9hpry94Ucm2YEyVuFKtco6foOCHIaYJDPITeRjAVlVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4R8droc5IXH0DJ59lK4th2EuT9LfFdw5To0KkY0xrps=;
 b=zHnWyt0lFyqnsv6pDt4gftCjOSZGB1hd50GvXtFXZuCccM7+2ZB/MplTdHxI0TWcKmWuEcXnW8CWcXu6ZacByz4uF24H2mnCACDHgFzej+zfc4bSf0aBcpK5mcok5mdI9XFZAViYjB2JXvsBuHwcxxtYxTOYTF8ZjgWHs+YRi9iZl7MSibk5q3bCku4dVyN+RhIaMM8+6keMis7axTfuOm367cfbPN9ZOVdtCLKU2yAsVpcBBfF7VAe589pZu6s2/z/B8Wa1hJkYuu33ts7mGK9R47zkc4FR9iOvn81WeY3fSPjjA3IZ5A8vv8+T4NuiEAY7JdjLoL+37+ub+3bBMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4R8droc5IXH0DJ59lK4th2EuT9LfFdw5To0KkY0xrps=;
 b=zGvHqrdX0umGUF746P2rRzrekLdpTpmSoy9S1Mi9CPEluV6furxk7GARLHSZ4cyy6DtGGNjZsfBJJnKIo/a+hxi9g2eXZbUDmtrehhW2WCgTb/Kqd4gnKwn4CX+3UE//QVuE0lFCM9m8aQekjEj99Tx0Ecu62BJwrKEMJ1Y9o8w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b8a4b183-34c9-4fba-a3b8-d86c4ee7b531@citrix.com>
Date: Tue, 3 Nov 2026 16:59:43 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 6/7] gnttab: rename a parameter of
 gnttab_populate_status_frames()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
 <06d74bd4-86f1-4c25-a6f7-f4e1c9de199f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <06d74bd4-86f1-4c25-a6f7-f4e1c9de199f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f174dfc-aafe-4715-1f61-08df39cbdd49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|261102123227099003|56012099006|10067099003|261009221227099003|261009223027099003|261022105027099003|261021121427099003|4143699003|11063799006|261026121527099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	nSosDdj/EXHM3gg5trdlC2gU9Wi93M6MeEcOPt7QPtErilX8ewpxk21x87iHkhsuJYfGjd7TV9PrTewdEqplm5XG2la1KV8oDchaHEsOXsmMWNn16j0itaxiJ5vLzImodOMfrGLKY90D7x/yBJLHO2jSHWEBrNn/BcYwZuiX+9TvD/iA+hNFSB/TUnI7x8nA9Yutf+kHQvQW+2kW5KAhvPsg7gP1DjL+7Qnfp+r9EOcsPK4F6N68T/dwGTw9OVk6R19rvavOSXHNUvZIrGIbR9PqX3PwcyJGqpnwch1JENhLHF1CC0PuotdbZ/GnH0PqnBRoks/6qVEv79VPQ5oySmFcDuCCuAwFncUIvV+oGxKvf2kA1OyR2ikBI5hHi7lzKPb+HEVWIVDhMTNDQPgjrmB38NIl/P2C5OIXRsuRtlu8gkrNqA7w6uaHGo7XDmnIImczRaVDMeyoUfsFBmEnNnc8RBbrh8RqvGQLFCOBU953wnrgmrN9/FSU9drBv9shmFe0hvAhYIRp8fUId9C7Duy2pZhkU3RIYwtYzN7bn70VquXKh2r1xP4yl4Klng0mSFyglHD1N3CrfeU2qSlHTqXlpxVduv6ZcwdFlaCjNOQ4pcEVtCFsAYsAk6szJWz6/dOgKu+0YOJ4rIG7MPkU0m8pGWJi9uz/qw7OZ8xD+ps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(261102123227099003)(56012099006)(10067099003)(261009221227099003)(261009223027099003)(261022105027099003)(261021121427099003)(4143699003)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXlteDlTQmxZcHh5bmRpR2J3WkEyd3RhMDVkVWQzTitCa3g1bm1ZSlA4UTJ6?=
 =?utf-8?B?M1pQU0VxZnp2QnppZUtlVW9NMzhVZHVYRTIwKysyejY3V3hDVzFsU3AzSy9G?=
 =?utf-8?B?WXk0cDNQQkJJZ1FlL09zc1dITWNMRmpsTlhtMjU3Yjl3T1JXNEtKRDhNYWlO?=
 =?utf-8?B?eGdFeldVcFc2bzlpak1RMDEwc3BybWNNSlpvVHJ2b09CNWJRemg1cS95azY5?=
 =?utf-8?B?ZEUxcExRWEJvMm03OHVjdW1ZMk1zd2FBbzdlNFBZR09SOWMwQmFnVFVEWHZh?=
 =?utf-8?B?TXpka2FPbnBNcHU2N0FOeW54MGZ6ZVhKU1FvbnpuT1VZcG5ZQ0ZUeVRSMW9r?=
 =?utf-8?B?eXFjTWFObU4xR2x0bC9pWmZocDhiZmZieHJsVGVnYjBsQU5XTVNtYVVUMU9y?=
 =?utf-8?B?OGhuMTlkdXIzK3pma0hIMzJjazZSeHBOM0xld0VpNWdHdTF6OFhTUDJFVFZR?=
 =?utf-8?B?MWxOZmxEMkZKVkVnWVFaeklqRkhiSUVDbjQ4UjZsN2puTjJXeGlBcTJmOUtz?=
 =?utf-8?B?UXMxN0NiSzMrMGFjSVNBdndoVHBseXZhR2NHRGVBSDR0V29GNFpqZlJNTWVB?=
 =?utf-8?B?bDFpRFFaTWhhQnVlVVZCSlNTZUNqbXRsTUhWRnFlWmsrV2pzR2xHdkw1MGo1?=
 =?utf-8?B?VXFYQzlMRnBwaVJ5YTAraUEwZjBBcU5CWnRpbWEvcFhtakc5Y3BRL0dINDRu?=
 =?utf-8?B?ZWFQaWw2VG0zVHlNZW9Ua2hkbEhWT0Nud0N3amk1d1hrOStreFRwcXdMcnFk?=
 =?utf-8?B?VURpMm4vdjVJQ2VqejNyMVJ4RW9BRXRwK2pkOVhFR2k4enRXclVsT081eUti?=
 =?utf-8?B?MFVtQ2xXdDE3NVJxNEprU2VrUUxJb0Z6NUFWNlpxb1VTNDlMdFpLdUVjZnN4?=
 =?utf-8?B?WGYxM21xNllkbElyWThNVnRXZFNWOXAxTmVRQnk3V015ZEVRcmE5eGtWVjNC?=
 =?utf-8?B?blpNbHZtNEpWeVlSTGRZY29iZmpnY2lZTzI0M3FhNW1pUmswYUxmRVdLMkJq?=
 =?utf-8?B?U3FPdWVYRytwZm5EWWlCR3lZWjBZSlhBamJmVVpHQWVGRWhFMW14N3FaRGtv?=
 =?utf-8?B?RnZGS2FHTkVkRnlHWkFTdVZZM3hGdW5CYzMzb204OWY5Rlg5eTBmeDMzZHVS?=
 =?utf-8?B?RFBua0UvNFVUSFJsNUY4OElGZ3NKdkhFWmdIUnp1a1k0WXUvWldHaUFpUmlT?=
 =?utf-8?B?ZU1aK1AyRERkSTVlOVVpbURjTHdwUVpYcU83S2ZzcCtETlRGZEFKRDdycU1R?=
 =?utf-8?B?YkhPeEhTandtNXVic3M1dXdTTTZDa0Jpb21VQUdrcWhramo2UWNrMFk3T1Bu?=
 =?utf-8?B?cFoxdFZHNWRxTE9wUk5EMEE3RWdzR05nWmZVNEpFQ0JISmlWVmRhRmFmVUJC?=
 =?utf-8?B?M3k3VzRxQnhKZDVBN2pPd3F4OTMwa0cxTHZ0OWNZcVRVRWFPMjdwSzBtNW1h?=
 =?utf-8?B?M0ZkaS93SVMzNi9FYlF2cXoxbHg0ejQwcFBSN29iQ2gzdGFibkFpNGYxdEtk?=
 =?utf-8?B?WmFiUUFUSlJxcmJ2NGFFMzhzUEk0Qnk0Z055bmFWWTA3cHU5cGJ0U1ZjRDRy?=
 =?utf-8?B?ZTVDQ01nUytnOFJhOUsxeDUwaWcxZmpmNkZWcDltRDVOU0o4SEZjVGxQQ0I4?=
 =?utf-8?B?SWlxUFIrNTd0dE02NFdLZzMrTDFmRXhWbDNMVExSOXd3bUNEcjFRZmo3QUhq?=
 =?utf-8?B?WWlWeG12S2JDdHVWK3l5ZVpYcTl2QUtTMjFpSGxxVmdFN0FZNnE2Wmh0aGoy?=
 =?utf-8?B?R1J5V0pJLzZCbzdKeHlZKzNCcGZwcytKcnVzekJNQ3dYRG9wZEFFUkJURGRL?=
 =?utf-8?B?UlE1cy9BcG1MaVcxRUNMWUxQdHpLTklWdlIzTlRvVnd2QWE2dlJUc3VYalcr?=
 =?utf-8?B?MTBENzZGVHlxK0xtQTNZei9iUE5EV2JvdzkwZWh1SnJQdit0K0tpRWZrRk96?=
 =?utf-8?B?RUdZUEUrODQ2ZkhwMWRiNDNoK3VaQ01HMjJCbEpid29Qb014cG15eTdNZmhG?=
 =?utf-8?B?bVgxVlZ6Zk9XRnp4UGFNSnozUXpFcTRQQ1hwNUVGWEhwZjVsQ0R6YjFBa0ph?=
 =?utf-8?B?cHhLWFRvV29FYzJ3QWRXOTczRkU0MTlyaFBXdGREejh0OGhnd2FlNTdWZGlu?=
 =?utf-8?B?NVErczFaQVdYMEFZWUlUVW5LdTN2NFNseUxwSGVGNVhSOVNONHhHNG5ZUGNZ?=
 =?utf-8?B?MFByTHAzc0tPRzRnb0RpaVdQdWZ2RWJXKzJmNWRxZUVrckJ4SkM4a21TQ0Yx?=
 =?utf-8?B?b1pPZUZKd0NJVDgrOXBjSVluZEhESk5QOERDSFpSTDMxME15MjVLNU56b2Jz?=
 =?utf-8?B?NmFKMU1ZR1k4UmFkdXJFNjd3dGJKZ015VFJTbXBRcmh0RWVNRkY2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f174dfc-aafe-4715-1f61-08df39cbdd49
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 16:59:46.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaL+lwQqVBPnMzYhNCjpNXT46e+Rw0kPuCwx3xjSAFRUvBXMhXXx5pGT58ZUfjy86HfyUBBshGI7Trb+aDAvWoKuDnEvRD6dFzkVfdmDIqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7952
X-purgate-ID: tlsNG-16d1c6/1793725192-F4E0677B-4EFE3BFB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1506
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28/07/2026 2:52 pm, Jan Beulich wrote:
> In a function of this name, "nr" (and hence req_nr_frames) is, at the
> first and second glance, the number of frames to populate. That's
> misleading, and it's also only what one of the two callers
> (gnttab_grow_table()) actually passes in; the other (gnttab_set_version())
> passes the number of grant frames already in place.
>
> Fold declarations while at it, and convert the assignment to an
> initializer.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1807,12 +1807,9 @@ fault:
>  
>  static int
>  gnttab_populate_status_frames(struct domain *d, struct grant_table *gt,
> -                              unsigned int req_nr_frames)
> +                              unsigned int grant_frames)
>  {
> -    unsigned int i;
> -    unsigned int req_status_frames;
> -
> -    req_status_frames = grant_to_status_frames(req_nr_frames);
> +    unsigned int i, req_status_frames = grant_to_status_frames(grant_frames);
>  
>      /* Make sure, prior version checks are architectural visible */
>      block_speculation();
>

I fully agree that it's misnamed.

However, I'd suggest req_grant_frames to match the req_status_frames,
and also to hint at why it's not just gt->nr_grant_frames.

It might also be worth a comment saying /* The number of status frames
is always derived from the number of grant frames */ or something similar?

~Andrew

