Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1F5CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:30:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443411.1660723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEp8b-0002bb-Rq; Thu, 08 Oct 2026 14:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443411.1660723; Thu, 08 Oct 2026 14:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEp8b-0002bU-Nq; Thu, 08 Oct 2026 14:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1443411;
 Thu, 08 Oct 2026 14:30:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xEp8b-0002bO-85
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:30:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEp8a-00Bo1l-Kv
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:30:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac7a8f6-e002-0a2a0a5209dd-0a2a450686fc-22
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:30:24 +0200
Received: from [40.93.196.14]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac7a8fd-195a-0a2a45060019-285dc40e93a1-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:30:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 14:30:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 14:30:17 +0000
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
 b=EXv7GpzR6BhWmpv9hSssZwUlwxIHMAiLjTaZoEg0KE5oQonHQc27K/2SNkwbUDKFO5PKTeT3DOcDFG+0aKrgODGl6pMmgkAADnoWAqu8QkR23pAvR7jNqhna2+8Z4VbWAgUFDXjgQaYNwIBptEf2MX9sPeSFGN782ogRrNU8Vj9a2K7w0gf65xcmiojWzIrOBo9drD38FKYve/lXvleekA/caQ6td6UP+2xfK6hZ+ORRIZic7eP0L9Jui9UtTifiJS7Ilp+Ak7q0usq9IzXUkZU2QCbzxyGpDx2jEyYneT1lkoDAH7o9CMEZIVkiLp6BPlOGaWo+HRTFSTrEfuhJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSxKxEh4EqXztVHf8t9b6M1lh9UUrL2vy27tKTfYjiQ=;
 b=RVEOd/STJ375ZIsyFjlelh2WbpcO7CoyMIu+EZZ93Ip1uo/0UGl60AGlDOdb+06iIdJgM1U5C1s5h9wdzekk7wH5pO6R43j37qed+vjKraxgZ+H0oNLZeMvqU3hSDnAdgWwwRl1XTsfoaePl6n9/WgXXL9GPNrg/7E0TupXVuTIqeIkPSD0Msxop5llMRX5c/SM6KhunutdXi6tsTVZdLd8meTLO+/8qiS/imAcIb41C2wVd11PY2JRcPXncr7Fc2mQzJ82WDUTZ7YRcQDJ1jdPq6Md+d/MAcmxVXjlu0EyyMDwKRKAdaKUKzzR6S8G2DcJwdU0/IL5ptiHyYC+2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSxKxEh4EqXztVHf8t9b6M1lh9UUrL2vy27tKTfYjiQ=;
 b=ztXcgqGZ1Cz/ZIApR6mRevr+90GtZizp81Xg750Lc7al6psAHZSlTPOROHdQtlI9MsXUSkImx4eZMEiV1yKcMY+5Xw1PhxHh+UCIFvDTqqYaJEm/GJrdFsNn9RHEf+wHZjp7aLjR5xiiYmnh+q7MaizM8KMdNNjVQb0I07eMS5U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <62fabcf5-9094-4a7d-89f3-414e7025154f@citrix.com>
Date: Thu, 8 Oct 2026 15:30:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] virtual_region: address Misra C:2012 rule 18.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2281ddbddfaec79635ba8d2cf8aec669ac858e89.1791458533.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2281ddbddfaec79635ba8d2cf8aec669ac858e89.1791458533.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a1e7a8-c174-4a2a-7c9a-08df2548ac56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|260925021911599003|56012099006|11063799006|260925021311599003|260925022911599003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xczIQ/uVmEe0Toc71gyY3dv+mcaeK5BUqhY76h4U8dfR65oob5J6IEgPP5fwnrstdOCIiTAqodlZy/gyMovzyPAbsYLS1PCGnKPxMFapbSLe4KVDfuKCBUCxMDHibFiqZ1QOHtZv/Xs0YxKsHhzTOMmEXKA0MOI4NuXRdyqA8TkF1cNVWUvs8Rlk4UZnuhK4E41hz36jZF4d8bIf3Rq89abbnm/1nYdQI50j34pzPJnSnMiYXIhv6tPQ+8e8QetPds5FSACYBgChuRK30H/tnkUm9+WoGGJjGerxGK4AjBk84ASl9tD581JzsSuqJGngIiJwhqdlMZVtm7ZpV6qrBotqxA3X0gPRHFZydrzQ2ry8LINoJh41fAmGq8k6x2i3tFZbiInM2htdXeWVMR8ga3khB9FW0o95BYl/TwItXyq3frpOI1WohF0uO/XTT9y5AtxDi/MybuupOlQMQ8KGR0Ado+SPzcTlRJZ0o/IhCU/HD3c/cT06Er/xpDjRS3ih49o/hPWACGQq8qduevKdyHipCjDUEwadyar+MYYbouscBoKLHdYg1kAbhBDSBQlt7LcCcDJCH+spf6l/FDoSisRcqILlV5NzUK8I2cqjj0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(260925021911599003)(56012099006)(11063799006)(260925021311599003)(260925022911599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkk4dkNjY25lTGc2MmFKVUJRZ3lCWm9rWTJqVytnWTM0Z20zb1VVV3ZUUGR6?=
 =?utf-8?B?SHJIYjNiaXVFWEVqY2t3dW5sSGN1M2p2ZkoweVc2THhBNWZPMjNVckk5VDJt?=
 =?utf-8?B?RzRZanBxZHNUS01YczFRQVBpN3YyOVNTZG00VWhyNm5TRjZWZTI4TVdIMm1p?=
 =?utf-8?B?cWtyZGZnYkVBb3V2Z3c1Y05FaEJQWDhQQVBEU2piT3c0UzFSNGlWSFd5RTd2?=
 =?utf-8?B?Sy9qaDNjMUlQblF6VkRyeVBzUFAvNEJKWTFOK3RaN1FNaFIrSEFPaEJrQ2NL?=
 =?utf-8?B?R0VRbGpOTFg4bTFRc2lOdHRpSk8yVWNJQlpTTHZnMlVaVXBzNE1JSUIzRFN6?=
 =?utf-8?B?clFSTUdKb2t6ZWxrT2xNTnJDbm82MlptcWcvaXU4dFV6SHFQSXV5NUNhWDVU?=
 =?utf-8?B?WmFoZGZqVGg5VHZHT2RBTlVuZ0RqWDZUOE9UbVJRRHkyZS9zZkZmTklObzdo?=
 =?utf-8?B?RXNQQ1h3aTZscWFQS3h2Nm4rTm1uWkhZa2UwOFZPdWVlbEE5R1hDTG9WdDZU?=
 =?utf-8?B?OUhyYnBxd1VuSHpJY2VjQVE1U0hVWU1sQ0hmK3NpYlM5TGRaRVdNR0hHNXhD?=
 =?utf-8?B?NUZRd0VjeTYyUmFRaTlwU0ZvemNsV291RVdnb1p6TGVLb0VnakZwYS96OTUw?=
 =?utf-8?B?UnNwWFVXcXljNzJQNHBVRmJ6NGhFenpBSGxpSlc2NGMrQkxaNi9hTzB4cmlz?=
 =?utf-8?B?N0dkTXpKNTU4d2I4UWdLb25TRWh0WTNsanA2S2ROZHJPRnBnWVJSWmVndE1D?=
 =?utf-8?B?L0h0ZFZBSm5qSkhvaDhzajAvMldPcUxuWWRDL01MeG9XUGYyV2REWEdHbWta?=
 =?utf-8?B?REh6UlVsYlJQZ1p6Y3Flbmd0dmtoUSttL3ZZNUorMFNHS2RJTmhzSGRsb2R2?=
 =?utf-8?B?OWI4dlNNaktQV0pwREt0QWJaZ0k1UG1yRFY0MTdkN2dONXprOENwZEFSWlRD?=
 =?utf-8?B?QzhoNDBEMEppV05VRnZSam9BbE9VcEpNMFJORTJaUmhKR2h3QkNjT1h3bjJv?=
 =?utf-8?B?V255L0lvTjVieDV5V2RBUWtjY3N5TjBxMDBsTUVtY1lWbUJ3UXg0QStTamcv?=
 =?utf-8?B?L3VBWVFjOGxSVXZ1NFhTaXVrQkFzbzM4bGZuTmNoaGZBOVZ1N3JNdXZKL2NL?=
 =?utf-8?B?S0cxMExQSVRNaWoyTnNQbWp3Z2g5VzZ3aURpb0lNK2prc2ZFOHU2dnpBWGsy?=
 =?utf-8?B?cUdILzIydFlDTmJCRFdVZEVSMFJGVDFJYjVkd0dYTGhoU0dsL0REUFhGS1Vk?=
 =?utf-8?B?bi92SWhTUm02QjhMTGdCUlBuck9mcElOTUplRktUQXNjUWkxSUc2blI2RjBF?=
 =?utf-8?B?bC9ka1RkZHNFU3BmNWlpaVFMTGFmZ1VVRHFHOXlyVk4xMFRsSGdhOTdlN1Qz?=
 =?utf-8?B?cXo5Uks3TlBhQnVrMTk1aFZuQWxqYU55bDlOdzlGc0hTZG5ybmUxdXlWZ2xC?=
 =?utf-8?B?SFRBQTdlOUFCa2pmS0R0VGl2Q1ZHazVhaWdWVWpRaytvR3Z2bnVrZVhDTWpj?=
 =?utf-8?B?Y1JsK0NTTkdKenM2QURWcnNZaEhLREJYMlYvWndIcGtDK1BMRXBUMXJWN01T?=
 =?utf-8?B?MFFJTEl1eWRsdGF4ZTc4Uis2WFZTT3hwVlE2V0xGTGZaazIzcFRRTThsa1No?=
 =?utf-8?B?ZmxlTlFFN1NnNFdTTEdPL2lBNllvblBuelVMNEw0V2c3anhURmRROWRqSTZO?=
 =?utf-8?B?TFBMS29qSThVZmRBQnc3UzZJeTAxeUxTMWVnR0YwV0dKVnVsUmN0TjZaQi9H?=
 =?utf-8?B?TmdKNFBaWnJNNVZaT0lHamtMR0dqTzRYeFJRSUtnRG9KTnZJZHFzTnRmRFNm?=
 =?utf-8?B?QlQ3dmlxc2FSNmwrdDFlak9MSHIxdG12M0VTbUdrSFQrT1BtUDNwZWgvYW5C?=
 =?utf-8?B?L0VUNU1jZ1lmTzh6NkZNNkJDbXIzM3A5WFl6MEF3VTZiNmlabW9aNjhIZnhr?=
 =?utf-8?B?NDVMek5LYWpjOTFFQ0ZHVDQ2K29rdGNWUXQwRlRnUHhWRjBnamlVTlozTVMy?=
 =?utf-8?B?ckZ5TCtCZ1dsZlk1QkcwQ3NOdHg5SmhtOWdBT3d3dnhtMTFCZVFwcDRpNHFF?=
 =?utf-8?B?dDVJY25rOWFlOSs5cVhrSmlsWjBDeGNnZE9rQy9JWGxIWFRlWkZMaUNKTDBY?=
 =?utf-8?B?dEFuMytYVjIxMjZaM0xSZmhONEw4OUJrelVNZnVsR24ybCtEOHRvV1RBbjZj?=
 =?utf-8?B?UGFtaGVtMlg1SnpYV3ZoTE9YTHQwbWNqSEl6cW8vTHFZTlNtNlZPcE9lUDBo?=
 =?utf-8?B?Mm54elZNU1JPRkJxK2dYSWZmRFZPWDVZQ1VUaUdsdzBtb0dtSlhPUHVLL1Fx?=
 =?utf-8?B?WjNLZjd6VS9XeXVYem9BYnJ0Tnh5eENvS29mdjRwbXVuS1ZmRG5xdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a1e7a8-c174-4a2a-7c9a-08df2548ac56
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 14:30:17.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdeOIEcktKzGw1brjGAtSzq5hAvaaam+GCw/nsA7yxVugwblW92d7+nsFGluVlHbzCRm0kSIxCME37mcp27Hc0Ig47NwtnZMxtBJMREj9o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777
X-purgate-ID: tlsNG-16d1c6/1791469823-F520877B-87ACFED2/0/0
X-purgate-type: clean
X-purgate-size: 1690

On 08/10/2026 12:52 pm, Dmytro Prokopchuk1 wrote:
> find_text_region() tests whether an arbitrary address lies inside
> [text_start, text_end). The address and those bounds are not known to
> point into one object, so relational operators on the pointers are
> undefined behaviour and violate Misra C:2012 rule 18.3.
>
> The bounds are cast to unsigned long because addr already has that
> type. The type is wide enough to hold a pointer, so the comparison
> result stays the same.
>
> No functional changes.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> A deviation does not fit because find_text_region() compares an arbitrary address
> with bounds (as was proposed here:
> https://patchew.org/Xen/901917945f704643e95842a773be9e8676f76d10.1755690681.git.dmytro._5Fprokopchuk1@epam.com/).
>
> Casting resolve this MISRA violation.
> ---
>  xen/common/virtual_region.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index 1dc2e9f592..a30e6b9c30 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -83,8 +83,8 @@ const struct virtual_region *find_text_region(unsigned long addr)
>      rcu_read_lock(&rcu_virtual_region_lock);
>      list_for_each_entry_rcu ( iter, &virtual_region_list, list )
>      {
> -        if ( (void *)addr >= iter->text_start &&
> -             (void *)addr <  iter->text_end )
> +        if ( addr >= (unsigned long)iter->text_start &&
> +             addr < (unsigned long)iter->text_end )


Please don't break the tabulation.   It's important for legibility.

~Andrew

