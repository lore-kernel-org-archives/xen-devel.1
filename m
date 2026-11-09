Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A85606A331
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=rB3HGbuY
Received: from list by lists.xenproject.org with outflank-mailman.1480361.1684325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQU8w-0008Sr-UP; Mon, 09 Nov 2026 18:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480361.1684325; Mon, 09 Nov 2026 18:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQU8w-0008Sk-RY; Mon, 09 Nov 2026 18:30:58 +0000
Received: by outflank-mailman (input) for mailman id 1480361;
 Mon, 09 Nov 2026 18:30:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQU8v-0008SX-7t
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 18:30:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQU8u-003fH2-7q
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 19:30:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af21150-bab6-0a2a0a5309dd-0a2a4505e336-14
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 19:30:56 +0100
Received: from [52.101.61.37]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af2115e-4cb1-0a2a45050019-34653d2550b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 19:30:55 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by EAYPR03MB989301.namprd03.prod.outlook.com (2603:10b6:303:2cc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 18:30:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 18:30:52 +0000
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
 b=T71Eq5X9sRhuRlQSE+4s47Vg5ia53YWsR6iOONGb+YjwkLgrrTqKwrYi3d9REjYKxsL4aMoRWwzaPlxoIHAs6NeZINaDcuiENMNYyN+TdDiCfe3nzmdHqDuQMj63mg9o2xFefsd0vZ9dPIdzjjHHFrvqT5387/qypha1M/c8rOTePMYT3ZpDyMtl3PsY/R08U2IaoAdHZo+zhlbb8h+7GO0CBn5cX4ifnhoyfCm+OtMQhtkI52dSlv6Tymv7RU8b7V27qFI0Oisq31Rx3mYHfAO3CKKusds1ZACSFxzuLwGwrip8ck9q7LQv2GhD6JSG+mDryq/uI1XoocJfigi+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97GKxAv5gSvIci8N9tZm3p4PXK1kcV2i68YVNNgpcSo=;
 b=wq1xEVDd5osdnz82mjdlcvhP6ulwy4nkyAp8OnlQtJPNzAy+42nhn9/KI445YqPXB/bOKdTi4i7lxZsCz4cCSaeHUgjoG49/FLH73cvYDqEpK3E/DXm2zlpTjqH9APvfvHV0O2O/eYWTSo6PMayCms7XyGNmLp6ucA48UhqfLeGatgzQ3NTTCP2vOy0POwzF7mp4seyjngm17TGeJ6kgIGQtnEdlfU2Dzji6d8+ernc4h8eov2q9FkOPgQxPspd4CF9QGAKeHPGNecDk0ign0ZEDWM5FwLymc59B6FlK9X3lyKZtBvud8V0q/60Eu6b7G9hkbEc2UmQPz2X2LhkxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97GKxAv5gSvIci8N9tZm3p4PXK1kcV2i68YVNNgpcSo=;
 b=rB3HGbuY/Zh26/5b5/KLljI3XzZOjGOwRgP554mWOuZrRrGvXPqhfuQ4XWj5Ah/w+xnexDaf7a8fWQd1B3ihYaH1DclmweK2QUPNWBRZMU9HFKrfWVWAD77/w6Avh9t0Et5XzS+dehl3IKbYyT2zFwvd0dO0ptyW8HNnVNJgML4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bcf961ee-f947-4115-bf92-716b4b2bf9e3@citrix.com>
Date: Mon, 9 Nov 2026 18:30:48 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v5 1/4] x86: record SSP at non-guest entry points
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
 <2b348885-fb2d-420f-8f71-81e3a9c836af@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2b348885-fb2d-420f-8f71-81e3a9c836af@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|EAYPR03MB989301:EE_
X-MS-Office365-Filtering-Correlation-Id: 1870722c-940a-482e-f5f4-08df3e8f95d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|3023799007|4143699003|11063799006|261102123227099003|56012099006|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261028144727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	m7MYoga9mcuL0LY259bVzIZOcjnGbR9xQ0PKm+lW631/Si8nSsAplCUjrpTQtscLr/nCVU+htZm58aIhdjk1u1wHViH6tcsQdCDFIwskyYgxvL1VIU+T+bTBwxAVynLMpSgkNH8gubCgid5fcdGpsPtu3LVaF+CyjUcQyoXwx/ol5p3DPyNQmwTXLnGlT0pVcCT9jTWP+MyiWPDyz/t4KjasuRF0UbhWi4WHM6+HitFP7z4Q2Bd3ju8jlQoxJV8CgNTj86w/setFpSV+PxpomQWWaQe0rzI+pVGn+8WRWJKDWncw2jlNq/DwYHZp3tpn65fXwFnw2A8nIk1WiZ7LYiV+c2wlRRlma2HdEbcn8Wp59vEnpnIz9JYsBG9vCeHWsZDdJ7V/ksonl+8x1CiTj7GDBEBsNSJKvhftAkf7qvxXpGiZhE+gE9f35tqoH8WeKs9IJVQUNo/owKFQ7ve/PTJOPa0DtrwFWOhLd/Gu6JcVJTp42610IgBVebaW05Df05RXl6WQLxnBImIQcsYSrLQB8QQ8K1msIk+JeJGa28Fta3OsncMzaq40Cpit0aeYj5dKjJswfkztHA16htcUDarwHyx+a0UMRtRHrIsSbNnahWdsc9W9xRYsTh7Y2g4JSWMyVnlxyH4PMwgjIc72ou3rUtv8azUYtAz+Da41jgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(11063799006)(261102123227099003)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ektuazRxVUhVazhud08wQzk1a0dtNms1bkgwTWt4Ky9TSy96YjJBVnJybXRL?=
 =?utf-8?B?TjR3bWhCakhramQ5NGFlZFgxQW9CbUV0TnZEMDFaS2FvaWhNNUgrdi95VnRX?=
 =?utf-8?B?OGlkdW1NdGhTRzY2NWVJQUswMlRzcVNtUDIrVXcwY3I0L24yS2l1UkI0MEsx?=
 =?utf-8?B?U3p4UjVmdm9sdmxqeTZLdlhQQWUrTXFsRGdQV1VxVXYxL0hiMk9acnM0cCtL?=
 =?utf-8?B?RVlHckVzKzllYTIxbno1QUpCd0NFYXBUaU5UaVFJakQ4TUdsd2duMUtVQVRz?=
 =?utf-8?B?Zkt0RTNvdjFPTm9JaGVMTXZma3R2YVNwcGxwM1JqN0F2YXBGTG55cC8yZ0Vh?=
 =?utf-8?B?b3RvYUM2YzNBS2hhOWZxTE1oT1BFZy9KcU5sZ3k1VzVaQmI2Rlh2eG5PZ0dm?=
 =?utf-8?B?OTBZbDg4dFYwWFNoUXV4bjRUbTkvczZZUWh0SS9kS0gzOXArNFM2YUJ0dHNJ?=
 =?utf-8?B?U1RaOGRidWEwZVJJdUJvc2Znc2FidkdPei9URDBkZnpoZTkvNFBENThCbC9P?=
 =?utf-8?B?TGk1Ti9XNVFDUUxYYjFValhmVjRFWVFrQ2h6SytPQ294bFlaOVBUOUdadHdn?=
 =?utf-8?B?eHJZWWFzbUhXY3VmdVNza1dPenJLa0lHOFVJZTVwQlNCdTMyWkdrcTN2Zk5F?=
 =?utf-8?B?c0lVOWRPbDQraFZFeDM0Ymx4MWhFcS9uVkhZWldndkJaWkpQUFFOWmtpNHRH?=
 =?utf-8?B?K0xlWms0encwWlc1R1RzaFFpY0VPSk1oZC9EOGxnSmx2KzVOa1Z6K1UxNlRz?=
 =?utf-8?B?TDhGb0FQaXlrWjJFdVlnSytkZlR6WGI4QmFyYzlhSXQ0V2hhL0F6Y3JKQi9G?=
 =?utf-8?B?Y2lWVFNvQlpQRXJtM2J4OW1TSGRYbm91dDdCT1AzblRDQ0xiNkJoZU5jeVdV?=
 =?utf-8?B?VGVsTjZWVDIxaHlsa1hFN2djY3Q2d3UvNnFWV1IzQXV4dmxVbFNaeElOZVlC?=
 =?utf-8?B?emxFY1Q2OFdpVnlSSSt4eFdaSkhTcWhDaHpGaVM4aWV4WGhoRkdLZXBtTFRm?=
 =?utf-8?B?TnFCa0Y2ZllOcFAxTHU2NEdpQUxjUUpDK0Q4OWpYWlhYV1JPd0p5THV3Y3Rm?=
 =?utf-8?B?YmlRb0JFMUFmRjlyT1BFYmhyVFE4VVhPdWhHeWY5NVN3M0hSU1JUUHRQbkVn?=
 =?utf-8?B?NktkWEh3SHpUYWdwb2tDWnRTVCtjVFVsZndreG9jVGViamp4bWJvT2NJeGdo?=
 =?utf-8?B?Mng4bDI2UlI1ZWJhSndsZEppK0R2bDV1RGdWS2daL21Ba21waUgvT29mK29k?=
 =?utf-8?B?VUdoRjZOdU5rdmlNSU5qV3RUam9YVXRyS2pBd0d2UU4vRjVvSGJNcllycTRh?=
 =?utf-8?B?aXNLL2FNN3pzU0Y3cTZKWmhtTmtLRmJjQVBPdDNLS2NhOWR2MjBnRllJTjNC?=
 =?utf-8?B?VkZoeVpqUnFabkc4QU8vcE9VSWk5L3BCVUhPdHN6SUtGakR2UE8xbmZKWU5n?=
 =?utf-8?B?aUJobEdTL2UyY0ZQN1VPRy9YZ2x3SDcyVmRUVUlIVjNsTkhpSno2NDUxUTEv?=
 =?utf-8?B?OFcyK0tudzl5c3Q5WDYyWlBBMDNkQW1Hb082QmRTUlgrdC8yVnNMak16ZHZu?=
 =?utf-8?B?VWtuQkdSSXRGd0g5a2Y3cGoyN0dsQlBCZzVlSzBseVJFd3p4dkg4YjdxWUhH?=
 =?utf-8?B?M2ZTemJObWdheFpwc21peEtiUEdRQVFmRzNkQk1nZzlaMmJvK2pKdnlzSzlJ?=
 =?utf-8?B?cG9RUXE3cE8zNWhzWFh4OUlUcVQ4eHpob2ZEbnozNEkwOGJqSWhNNWtHM2tQ?=
 =?utf-8?B?ZU5nNUJSNU9qc1hWNS9GOGFGc25pRGl1ZlhBWlJxUVZpdjcxajVBaTlGeXcx?=
 =?utf-8?B?YkVrcC96UXBiWkswTGJCaXd0S051ZkpwVDZIY3RVVXhNR1V4VWpGU3AyalYr?=
 =?utf-8?B?TVZmSDVMaXVSS0ZCRmkyaGFxUXJGQ2dOMUZramhFSHB3ZnJrYkFTYzNRZlpk?=
 =?utf-8?B?aWhibXRSMjJHNWtwUjBJcnU2VGE1UFBKYS9RTHAraHN0Vzk2Ri9yczQ4Z0ZQ?=
 =?utf-8?B?T3R3WGh6UldvUDRLc2RQTkF6cWJSUERGNlNOYml2OU5waEozT2ZEbmViVHZ0?=
 =?utf-8?B?L2lYTlNoOGh2UlBzZStXNWhxNDM4SHJGdW1KV2Y2NTRWak1VVzJNeDRlSnpN?=
 =?utf-8?B?UjBrb05HZW9xVEJuNklSa3psYUZDY054clpaczA5QnFaTXhkQWtINmlMK2Ja?=
 =?utf-8?B?YSs0US9JSzdDOXYzdDVGMzBlSUxtT2VYaWpvWlJ0OHl2enZKb0NHSnMrSXJN?=
 =?utf-8?B?YzR1VFJWdlQ4YkVabmNCQmUvTnZuK1NBQWtCTFVoYzgrdVgxNGVYWGVpRis3?=
 =?utf-8?B?TVF1QnllRzhQTGVkV3J2SjFUS2tEdDYwN1loRVpQSlptOFVGNW9idz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1870722c-940a-482e-f5f4-08df3e8f95d8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:30:52.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3eJi7+l1A4gt2TLCsUh+iS5IVf4uSHM/xVvpka3sSpP/Sv6RbJtEoWC+r8o2Jr1EpbNt2UjpjWssnEaepvEUqIJiL9MoJjC/EUnWthhRlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989301
X-purgate-ID: tlsNG-c201ff/1794249056-714AC2A1-6A405A52/10/78276251493
X-purgate-type: spam
X-purgate-size: 1908
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 1:08 pm, Jan Beulich wrote:
> We will want to use that value for call trace generation, and likely
> also to eliminate the somewhat fragile shadow stack searching done in
> fixup_exception_return(). For those purposes, guest-only entry points do
> not need to record that value.
>
> To keep the saving code simple, record our own SSP that corresponds to
> an exception frame, pointing to the top of the shadow stack counterpart
> of what the CPU has saved on the regular stack. Consuming code can then
> work its way from there.
>
> In SAVE_ALL / RESTORE_ALL simply drop the use of UREGS_r15. We want the
> full size in all cases, so what exactly the top-of-stack field is going
> to be (whose UREGS_* is 0 anyway) doesn't matter this much there. This
> way we don't need to distinguish between XEN_SHSTK=y and XEN_SHSTK=n.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The code is now fine, but the commit message is quite stale.

You need to drop "non-guest" in at least two places, and change
SAVE_ALL/RESTORE_ALL.  In fact that whole final paragraph can go.

With the commit message suitably adjusted, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

> ---
> v5: Drop ssp parameter of PUSH_AND_CLEAR_GPRS again.
> v4: Re-base.
> v3: Put new field at the front of struct cpu_user_regs.
> v2: Add comment ahead of SAVE_ALL. Add comma between its parameters.
>     Re-base.
>
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -259,12 +259,19 @@ static always_inline void stac(void)
>          xor   %r14d, %r14d
>          push  %r15
>          xor   %r15d, %r15d
> +#ifdef CONFIG_XEN_SHSTK
> +        rdsspq %rcx
> +        push  %rcx
> +#endif

It might be worth having /* Zero (from above) if CET-SS is not enabled
*/ on the push here to make it clear what value is stored.

~Andrew

