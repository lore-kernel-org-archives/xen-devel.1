Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F55C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 09:31:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427224.1649851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8aMT-0001tj-0n; Mon, 21 Sep 2026 09:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427224.1649851; Mon, 21 Sep 2026 09:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8aMS-0001tc-UM; Mon, 21 Sep 2026 09:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1427224;
 Mon, 21 Sep 2026 09:30:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x8aMR-0001tW-G6
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:30:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8aMQ-000dyp-NT
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:30:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab0f93d-8faa-0a2a0a5109dd-0a2a4509a4d2-44
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:30:54 +0200
Received: from [52.101.193.56]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab0f94c-be1a-0a2a45090019-3465c138dda7-4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:30:54 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB989641.namprd03.prod.outlook.com (2603:10b6:8:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 09:30:51 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 09:30:50 +0000
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
 b=e1tenzf8E8FQtiue0XOA76iDamTmJ/flH1hsyyYL240roZYH0AwS3DuTk23tC8Fk8JzqGPFla2UJmNzWKNCrm5Tc6HWGCItehx/VLQFWCyENgbeuXzKtFlAM8RnmLwZGnKlrZYKOmh24O6D5OYA1ROUUdGiLK3RTPNsfmbbldw6XoH4vn1prNoH9GTt733210QIkUzd96gUgGAWPDY0L11CF9Tjs9xsYWqq18tns6h3kOEOQoupi+uaYjD62QRZbwFJrgDa0GduBbjJe/vJkO/tXgIl1w/48ZkPBTe7mHd23R3QbL63a8kbpRVrYzBd0WVGqetaKMenIMtjiYrNn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlu0HBkNmf5O71CsMFcUk28PJfUO1lhHD0wPbP0jm+I=;
 b=yXG2bEbMvxS5Hxf3IfHDTDGlY3XZzC/jX1SHrpmhwJYH9MU5UMgp6p7AOsK3YK8PXWfN6ayoFY11LLX1JEaLKEdm3+8Gf/goiA8BDWvemd/g3c/qBhS7so7nQGvTxz0tOyJSFL6p/sEqj3Uo1Tsq985x3Ka8p/ZIIPqXPgbjdSHojvnHdNwyvwun6I/5+feyimNy2N2XJDry8/G6bAc3ZX+KStMwjLPH/ye5eZnl7p4ST4r0amLKqj4Cf2C7SlHK5posE5SxuxlPZUuBX61NBLOCbmmElZHBERD3z/2SXSCGuVZVaM6IS0/7oNoYhrqdwbWwbEpFNtOXcRBIB2KaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlu0HBkNmf5O71CsMFcUk28PJfUO1lhHD0wPbP0jm+I=;
 b=PT0xhqRjZcBVPGjxXaVhNorq1Re4BNngrrGV1tGTAQvk68YHcBHRJgqDawAYbuzoSdjBj0yq3ssM8xngrms9CGIq6DwlGCf08/i7jLrxqGCmel7IXafgo3jcuQsfO8qb9MSuUzK2vG0NEaHyFTCiGTkc2O9zsbjZyLd79WGaL1A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <489f6ce6-2be7-4c94-bcf0-21fc6993f98c@citrix.com>
Date: Mon, 21 Sep 2026 10:30:46 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/vpmu: Fix incorrect printk format specifiers
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260921091651.34761-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260921091651.34761-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0086.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::39) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB989641:EE_
X-MS-Office365-Filtering-Correlation-Id: a21d3ab8-2dae-478b-e034-08df17c306a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QevdCnU/SKErE2oNTMwoF4giwlmFSmCAHOvXQbXrUAIxQZasS0m2MYdRzoHzCt/3RkjPIB561fEwjDyOT9jQF8m1xqa/uO44AjdDXgHpN2Uyomu7dD/phF3WVraGzcyTDI9+jIIn4mlq60DFHNmjZtsfOIw1J0fkx18PmZK2PuC8EFJbxn79vsPrAdUF4QSTVjNrGipT+Vl8+RNOu2ttVrLJTnz+IZg+bH9+nSuoChJH7454Db0K5pbhMO5YPD/x9c/3XAX/78XLooN1dWl1GgVz0kXWGoB7FpivKvwxxS/WeehFgQptq4rDBAR1C7jUCNIzADrg5L1odKFlIJ8ClxvSklQqd0IDNjgujG3LRrWSNktGcONpS2T5ciIXeAQesduqNBad6t4glUMJFC78w8IXwFUVRgrizq4b+LdkF105GPzlUwCNDUMHVJoP77G4zSy5FV59Yh6JN3DaTXCAMjyS3G983wQg020N9FOCR73RikguuUzBZSKY9J1pyOrQaCouzJIDCG0ulMDW95lTvNPWuSDCcI8n9KcWwWuHh43/J0VjwPZnSnlpbrNTg3S5VbRlBzR9TUtU8FlMeImZW8bBwLWlzod19BQASt62kOE9c09uSXBKCWkI6+o34buVkjCMm80Quc/ytC6sPTl/BpzYM1vWVFHvAM99dSDCfBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1lTcnAwMnNxdzdEVG4wMmxlaVZKb1h4RXNXaVFVZ2hYRHJUTlpxa0xtRUhm?=
 =?utf-8?B?MmYycEpNaTBmc3o5akxtdmdhMytKZnJ5eUpnM3BSSVJFRjNaQTFERTk1MnIv?=
 =?utf-8?B?emdnRnFBa2Y1NzZQYWpzWHdJazRwQ3FVaWU0cU9FcVFKV2VheDNNaThLcnZW?=
 =?utf-8?B?UGw3U0VidzYwMmFBWFM3SzJGMytPNnlRUVVSQW0rZ25HU2JGUm8zUEQwekgy?=
 =?utf-8?B?ajNJWEI1NTdwWWRzWGdGQUVqT0QvQmFpQy9KN3h5ZDg3NFJoRCtGbWZJd1dj?=
 =?utf-8?B?a01wOG5mL2JkRWVFcVVNeFNpYU1KS1VqWnRZY0ZFZkdGeUh3M0V4cEpHdHNz?=
 =?utf-8?B?SmE1V0xaM3h5Zjl0MEE0SGVoY3BCVjUxT3BnTmFPTkozMEhvd2psb2hWTlZv?=
 =?utf-8?B?U04vdDNkMmt4aG5VeWcyaG1aS0NZYXVKVVRPS3JUbUFQN3cwUE5wZUFscHJM?=
 =?utf-8?B?VkpxMmJaSHhHMW1OamNJeGdYUTVWYkZkNWRBdmJ5TFZkZFkxeW14NlZ0WTV6?=
 =?utf-8?B?aXNXK1hhV0hGWWsyQzNFZEhoMHV3VTR6VDlIMUg0UjhHYmJVN3oyY1E2VlVO?=
 =?utf-8?B?bTdHMFdxcTVUb3NZdXYwWmRrMklJSmNBa1N2WVVselhtLzRDVUZuSkZKV0Yz?=
 =?utf-8?B?cGtiSG90Y1ZqSEJ0QlNUSDIrSGJxMmtJUFRxR3QrY2VKVlhlR2xlcWxjamd2?=
 =?utf-8?B?aThHTVJ0NFlFb0NaMU8yOFhWR3lXQVZ1b2pmSzZCM1Z1QXZJeWNuamNyQzFl?=
 =?utf-8?B?QmRLN1o3eG9ORVNTRDlKT0dLMDBhUitMZ3JpOTRNMERoRTJzVm1TempaYTNH?=
 =?utf-8?B?T3FFTThSbzQveWp4L0RwS29TTENmaGpQUENJSlNLaTFxZktVMWRyaW1JeVYr?=
 =?utf-8?B?aVdLMUJZRVB6TjYyTm1WNkMwMlhzMXQ3akRZQis3YnBjaXNBbm1GbVRBUkI1?=
 =?utf-8?B?dy9jLzlNMmRvQmwvdzRFWG9BZVpudEtrZ2FkVVRZSHJDZlIxNGlEYnBVYXdJ?=
 =?utf-8?B?bWRXRklFUzdJdmpOcURKZG5NWjdDWEhCeFhINXZta0ExMVA3UVlkSzM0cWNO?=
 =?utf-8?B?cG11ckZXbUMybndVMDR2cytBRzZUWERPdExXNzJ0MGszdFJlVUFMbStDYjdF?=
 =?utf-8?B?bTRnZlh4Z25lc2kzWnpEOHhNMmxzWi9PVVBueDhISElPOVFVL2NUbEhybHo5?=
 =?utf-8?B?U0piRDY4YTZHN21wQWdDY0dLRDdjYTNzSC9nYUY3Ynp2NXlxVnBxbG9ubkFX?=
 =?utf-8?B?RURIVEdXQlErNis1cVVYYWF2WWdBaUlkbmIrRVE2dzdlZnNVaEl4SHdDblZD?=
 =?utf-8?B?TmRqVFlqQW83UmJUdGFKUVhJbmVIc0w4elkyeGNmVDdvcmovV1VrVkNxUjZs?=
 =?utf-8?B?TDNzay9rT3RQa1dhL1owSXdKMHk5YktZQXVpcEpTemFhWXlXdmhFdUM0di96?=
 =?utf-8?B?VU1mczVmUHpCZThKOE5VbWZ0UWJlYmxTdEZIVFQzbGMzWE9UVmc2WFc1RHBs?=
 =?utf-8?B?TGpWaDdmallCWDFoOTFRWVBqczJSYlJBOElvRzU1ajhzK0g3blNnNFlEbjRl?=
 =?utf-8?B?N0ZwVE1VbnMxOFQzL3pXbEl0cHBlYVZXMUNwNEUrQnJTcVhmd20xQXdWNnlq?=
 =?utf-8?B?NjdFQ2NrMlUxWUxFdmdwTHVtMzJBcytyNmd5TGhuQTdwSk1mNHFVNDV2WHdI?=
 =?utf-8?B?WUNBVXc4RFo1TkVOUlIvTWJ6SHlaMjB5cE1HaVUxMWNhT0hBdUR6L3Q0NnNX?=
 =?utf-8?B?YkVnaDAvUFNzMmR6dk01cVNtcWNqK2ZMaXR6c2RkYWltYjZTM1ZmS0g1ODkz?=
 =?utf-8?B?ZlRQSGxNQ3lHY3c3cUFZOE9TNVd4dlo5NHV5VWM4eU5FdU9YYUJJNDJvaXEr?=
 =?utf-8?B?ZzE0NXo5YUplSEJKVTZWSWE0QkhSNGFsUWNQaTNDWnRiakNxN1M3Y3ZpZzFT?=
 =?utf-8?B?cVpYeEF0Q29mODc2NGhPeHNpZUJSTXZrSmxGRTkyazlmVWVEa2NtVmhnc0Iw?=
 =?utf-8?B?RWJxV1lzcWtwZmhFTExJOFJlODdlb0orZTlLWWxXdnA2azJTK0FyM1pyeHdv?=
 =?utf-8?B?T2FqK2gwWGlyRG44T2lZc0Urb3VrREZTaDZGODZsRTV1c1dUaW5YTmRjTDcv?=
 =?utf-8?B?OHh6T1dSV0hUZlJ2U29HU0toME9aMDhWU1RTaUY3R1FRWHNOTWhtTWw1cnlx?=
 =?utf-8?B?aTFWNUtLbU9OQ2tMTEhoN2ZRSU1MVXhuWThDNkxJRFpVVDRRdHJIVXYrOFoz?=
 =?utf-8?B?dWZ3MWxrd2U1UlFCTWlwUEROSGlXVkdWbEZXTmJFcXRjN1Zsc3Y5SXR0UnBF?=
 =?utf-8?B?NDlEUXFLU3FXemJ4ZklmNzJacWdSR01YamI2L3NGbFdLTVFOTElwbWQ0c2Zy?=
 =?utf-8?Q?UYbSEULi895X/2RA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a21d3ab8-2dae-478b-e034-08df17c306a5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:30:50.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrMH/n0rodDzSUnBCHaSjoDE/jx+nNpwYTvczy46vL+TO86Rbg/QvqDOgZvKUFCtxvsq3vphd+tTjpPgBbgT/k9cFKVjRdSk0Rd/EooauDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989641
X-purgate-ID: tlsNG-bad1c0/1789983054-3B6D2034-A356410B/0/0
X-purgate-type: clean
X-purgate-size: 560

On 21/09/2026 10:16 am, Alejandro Vallejo wrote:
> The patch in Fixes adjusted two vendor variables from uint8_t and plain
> int to to unsigned int. But they were both used later in printks with
> the %d specifier rather than %u. Adjust accordingly.
>
> Fixes: 39a9a49449d7 ("x86: Remove x86 prefixed names from x86/cpu/ files")
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

If this is going to be a problem, then shouldn't we turn
-Wformat-signedness on?

For the patch, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

