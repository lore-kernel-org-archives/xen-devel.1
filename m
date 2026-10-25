Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBDC606A31A
	for <xen-devel@archiver.kernel.org>; Sun, 25 Oct 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=T5lCxlXY
Received: from list by lists.xenproject.org with outflank-mailman.1460554.1671585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKz7R-00080f-5y; Sun, 25 Oct 2026 14:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460554.1671585; Sun, 25 Oct 2026 14:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKz7R-00080Y-3K; Sun, 25 Oct 2026 14:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1460554;
 Sun, 25 Oct 2026 14:22:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xKz7Q-00080S-7j
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2026 14:22:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKz7P-00BCHi-46
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2026 15:22:39 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6ade109c-e002-0a2a0a5209dd-0a2a450bcb94-14
 for <xen-devel@lists.xenproject.org>; Sun, 25 Oct 2026 15:22:38 +0100
Received: from [52.101.53.15]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6ade10ad-b7e8-0a2a450b0019-3465350f114a-3
 for <xen-devel@lists.xenproject.org>; Sun, 25 Oct 2026 15:22:38 +0100
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by SJ0PR03MB5535.namprd03.prod.outlook.com (2603:10b6:a03:288::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Sun, 25 Oct
 2026 14:22:35 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0546.021; Sun, 25 Oct 2026
 14:22:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqpf0u8TAf+OG36PVIFMCmj7jFCRHVUDlPWO2j7/2ZvD2bZmtD7TtuG9Wng1oquwsoJvoiZubGbMlyyiyzc4oReAUAXtNkwgqk+4/2NaHKwZDenlpZ7qWe8QWqCB3uI41ULofjSlA6MDpeSWGrfKKrXFzfBIaWHDg8ZPvOSmzqJ+NXE4UWw/ZYVz89v+T9YTU5vllrfPCJpKvJShY+I5Z4NEjKkOamEziGuHjJwHve5tsZrI7OCEi6+ADJ713AyMG0ra1KrJc2sgidwPLQsPeWRULN7Lwy8RBSl+0Ut0npurGBbQ4kjbkhhw/avoZ54JRel2atz8kUtb32eYd3ysWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJhgT4pCosswqxRtTGk+FOFKILZPh5Dm5CBivDPSDfo=;
 b=m2bWYUsGDtbSI2eWedi5xCUbJVSTaWcnOgGTQziN6u9gUmFL3HuacLL7Ma+gDSVgNHLdWZXyrXSHQhnPddZfrgRzix6OjwseSO7WCT/AI3/Qe/Vj6Qc5JiHUOwi5tvw62ThyrQW80UdkxWTLMLIoxJ2JZGszOXCQquuc0vyIUM4w04p4+5BbyvUAHK6YE7SJGohCLyJIi4ER7A3QidSzvY3Z2ozGamUQtONBgYqL+6vkOfN91uZrZw5dcBgGYjwk113gQL9He43f2UF/+Mv1hhoXCvjlHiQl0rmWdaenJ/WH4OcwPZBATfqXTmPhW5D2mx8ExH2d3vnXQoC5WtI9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJhgT4pCosswqxRtTGk+FOFKILZPh5Dm5CBivDPSDfo=;
 b=T5lCxlXYyMKdq/SRLXzdUJBYUyvuiPu9CqcvpI9WaSCjVYuR5i8/kBGRoMEkswP6hrxl+qGC780AsiUgdcScvF8tAYlGn3kZKCH6lPba3NzM55XxjtDBTCNotqG2LzPF5aEcN1k0ujvRiRMKhFlfUhRc6QxtsRcmjpfS1tLqx5c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/6] x86/vlapic: Fix hardware virtualized APIC state
 after reset
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Denis Mukhin <dmukhin@xen.org>
In-Reply-To: <1792504425.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
 <1792504425.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@vates.tech>
Date: Sun, 25 Oct 2026 15:22:24 +0100
Message-Id: <179293814412.1810895.12737475203049581172.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792938149; l=5816;
 i=bernhard.kaindl@citrix.com; s=20261024; h=from:subject:message-id;
 bh=c0VYfaDAnCiIQ8J3/Mc4cnTCOhrWQQTko1/1oSQq+4Q=;
 b=+hyaS3ovnljiJkAYoyRQkHGKQ2QkhyKadCXPZBtz1nFciY+C3QmUKDqNRypgVR8r0pN5ukIYf
 rGPkadLcBN4DrOypIg4nk3BHIP8fLdX7PfufV0kBu68+KRs8+h8FC2o
X-Developer-Key: i=bernhard.kaindl@citrix.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=
X-ClientProxiedBy: VI6PEPF000001F7.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::905) To LV3PR03MB7707.namprd03.prod.outlook.com
 (2603:10b6:408:28b::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7707:EE_|SJ0PR03MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a42b6dc-63a3-4121-f880-08df32a369e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DkD8gSbvc2c7/39xIz6Gudlc4wZBB09IgSAt8UPGMJ+HK/x7DxPXUBBkDpxN1YxLrk7KxrNhMnIK3pIww6rzSzi59RsMzWV4BQRz6Zmq6GoUKi4fCVzyPpcivMPSRwX5etsuvji4H4/7uUlAN0Tzvjx0G81xC9i9KH9R9j0pRnkaABkYRKmiIwjDvZ2kR+vsg4Dn2Ez338vaCJKt0sMk6KEL7/nUDx5uh4NiKOso+coJam2zuu83cAiop1SH4TONWnieqrA/jY/dm7kTMnNP7G5Rkej2/GxrGapvPVqkZ0recbidOCeoTEkcgz18bnpxfbV+TvbsjH2cW2jd+pTlqWmHUCSDNihJ1mnLA95bKIdUxhcWXgXrccxWLf7OKpyDEq6tN2GDIJEx3V/n20e6W59ciRc6dnv7DnvFOnEm8vipLXOVYKMWTJbUgf2qoue8PqgJznHYuxrhZoXSUmwqOuwVWeW3YzoOlD80tazYHFLEElkvlGXhKUXgxm2LagFE7nfSFKbwpVPWLPzrSmd7okB8A4dkVGQSsdxTEVTIm9Om9f2eLOVVCuuWrSnIGTAjIbjdthh5es7yPb3Ew3NMEIR02TqCC/YsXgADPrR8eb/JixeEkVTGgfMb/f5bhAVmdb/f7xyTLmCfU08Pr3ACeItTouGGwiH42d4ZEVTrQ9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmNaMmk4SWZPY0xIT2xKL0kydUMyakFobHdjMmZNd1NieXlrMWY4T3RtbkRi?=
 =?utf-8?B?NFpKWmFTbFl4WjJkTEN0NDFEVk9uY1FRVFZub3hsTThkb1FsaWNzUmlXb0xF?=
 =?utf-8?B?TkRZWUc4LzZZeWJJUDMxbVdyWGdEZ1RqR2VvbkV0SXlTSnAyaWU0NFlQZVdP?=
 =?utf-8?B?dXVuZ2lWZkp6NmtyVG9VbVQ0c015TmlFSE01NHBYR1ZwRUJoR0sxYkFTY1Rr?=
 =?utf-8?B?dEJ5TGhpamJaRkpMTHQwMDl3cnA0RWZURGlVZ3VNa3o2ZmFUTlYzY1pxcmV1?=
 =?utf-8?B?MkM3MlRJdTd5OFVqcHNDR3FENmkrdUR5K1FhanpWcFZpdEU1QWp2ZUJFRzBL?=
 =?utf-8?B?ZG54WGV1c1ZUc1grbzJZM2xuN3ZUTGdoTVJady8waURhNjBhVExHaUZaendm?=
 =?utf-8?B?dEkycG9GSzhJQ3J6R2NXUGllbHhEZTdlVzNWeUxvZW9RLzFyNXN6MFlQWVFh?=
 =?utf-8?B?RTFrbk95ajhoS2JXVkJSU0p4RHozaW01K3RtQjFHWWhwb3ZidkhtQ2xEajln?=
 =?utf-8?B?U0REeUFhZHR6endBc3Z0OHl3MUMwWEoyWE5KVDJkUVBhaDUyQm9lK2piWFdm?=
 =?utf-8?B?aXlUVmdzdGpGWUExaDQ3UGR6aTZoQ0J2K09INTd4NjdYRGU5UE5oS2k2SGR3?=
 =?utf-8?B?VVZuSW5KS3RVTUsrRHFHNS9kdGJ4T2p4QVoxR2YwYWVGR3RZWklUdUpteEZR?=
 =?utf-8?B?cVJ3N2xOSXFkbVBKZE5oSENBZ2ZSOUJzUk1oSjcvUzdrakk3NUQ2bkZyV0FB?=
 =?utf-8?B?WFVPRjVYMzk3VmtmUlJ0TzR2TEJNbXhDdDJOZVBPZlo3MGtNT2IzdjBwS3ZV?=
 =?utf-8?B?RkxQM2k0MWNWTVpaeTJYTnRxVkc2VzJ6aG1zNHFjeUxwZWYrUDJqbzBYRWFV?=
 =?utf-8?B?VW9wdnFFOXMzaUJGWGI2b2hzMStYbDVQSTErUmdoSUVXdjZHUE5WZ1FhSFNO?=
 =?utf-8?B?Wkt4VVFZNTR0clNHeXh6QmZsZjhicGxheVhnWmZyN2FMQXRobHB1TXF3Y1Rx?=
 =?utf-8?B?bWNuRnFNb3NRaXBXMkFvOEtpRDB1V1d4eTFpTThLQzhWakdDdDdzUVptZkEw?=
 =?utf-8?B?SVhFamNyU21pOTlHUjdDVmFaelFvVWd6M3praG54cTB2bStHei9GVE5mRXN5?=
 =?utf-8?B?UmE4V3BscThIV0dlMU5IdndhakhsZWxGTnMvOEY3OTgvYlBZVk0zUjA4WVFh?=
 =?utf-8?B?N0tVdjloWHova2ZodTF2ZkE3MkNLaGErQnM1RDJZMEswem9kOHRnT0pydklu?=
 =?utf-8?B?dnA5NWlKOHFGZnpLUXRzSGI3NVdrWjAwblEwcWJWTWJvdkZaL2szMzFKOUJz?=
 =?utf-8?B?NzhDd1p5ZHJ2R1VIM3NzajlPYS95OEh6WlJlc2lnT2xwVFRkTzUvd0hxWjZk?=
 =?utf-8?B?QWx4blhZYU1TblI0VmtwcE4yaE15NkhucC9UNVoyYnlhU3pETlAzbExQMk12?=
 =?utf-8?B?OE1RUUpsbEhMZ3ZYb3VlQjR5cVc1c1BROCtJYjI4a1ZjZXFkRElnb0YrQUJF?=
 =?utf-8?B?TTBOYTBKQ1ZTZGROalZTNC9JNU1Xc2htU0V3MGdEOHJvNWtvUnNwdVlRRHFT?=
 =?utf-8?B?aGx1SkpMU0s0VldabEVzZ1VQQ05HQVllTmg3QjliMmxHeDU1cVR3VnM3cVlU?=
 =?utf-8?B?Z0J2RVBCZVdROGU5TGgxYStFZDQxaUFZNXdyaDY1Wk1lanZzVnNMOTBvbGRh?=
 =?utf-8?B?RC9uRlZtUlJnYUpwTjVSdnZKZ2djblJJQnp4a2hNZTNaM0liclJOd21hSHFj?=
 =?utf-8?B?TmprYlNuQXN3c2E5czRLN21ZQXBPTHprMmJaUVZnaktpZnNiOWpJNWVKcExm?=
 =?utf-8?B?NVZrVHREWDI3UTdQVmRyeW01SGlkcnAxVDl3WkUrdkRwcy84amYrSUhUSHMx?=
 =?utf-8?B?WDFjUWlMeG43WGxVQ1R3TFI4T1dLZTBmL0JxbHNWZ1M0N3MrMDFoaFdhOFV2?=
 =?utf-8?B?RjNWU0drK092WGtlVzR3ckdiRDlnT1FjRlVmeXlES01VdWZnaFQ1NGhvMXB4?=
 =?utf-8?B?UWRmYk5GMms1SGp6WHRoQ21Gam5wWE9oblE1KzF0TDU5eTllOTE2WkJIK0kz?=
 =?utf-8?B?VXNhVzhYZ2ZwWXVXMkw5Ry9ZK3ZDNncvbVROU3I1MGdXZkRZclI2VEFnQWQy?=
 =?utf-8?B?M01iVXhZbnd6OEppdGQrb29mRDU4RVRFa1AzQXZRVGp1cnlRU2RGaktNZmxh?=
 =?utf-8?B?d240bXJqYkZ6MVNmSmdrS2ROUkM1R1I2ai9mbnp0OHBZcUxuNGhlWFFmOEk1?=
 =?utf-8?B?bm4wTnpwaXRaUlVqRk9QeEp1NXc4WStsc0tVUXhtRkRVREc2TmtJd3NtVzFr?=
 =?utf-8?B?N0hIZHI3eGNGSjVNa3oyOFBpN1JvTTJIVlJtUWV6eGNqZzdDcmFvWUNKSTlw?=
 =?utf-8?Q?qRWU670xC07G5FyM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a42b6dc-63a3-4121-f880-08df32a369e3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2026 14:22:35.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jynlsqdZyqb3xQJLDjf6Ttz9p0jMGbk4KM+5geeNtvEt9jlglgqX5lmt2BpYTQMsxw59YoEgC9+abpZ2z2t0LBC1H2Hc+gNxZEAwvoLVeUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5535
X-purgate-ID: tlsNG-42698a/1792938158-184CB9EA-F0933306/10/78276251493
X-purgate-type: spam
X-purgate-size: 5816
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, roger@xenproject.org,
 Denis Mukhin <dmukhin@xen.org>
Subject: Re: [PATCH 2/6] x86/vlapic: Fix hardware virtualized APIC state after reset
In-Reply-To: <1792504425.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
 <1792504425.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@vates.tech>

Hi Teddy,

Thanks for the reset improvements. Could the new reset-time sync
call use a dedicated discard operation instead? That would also cover
suppressed postings without changing ordinary pending-interrupt queries.

xen/arch/x86/hvm/vlapic.c:
@@ -1429,6 +1432,13 @@ static void vlapic_do_init(struct vlapic *vlapic)
> +    /*
> +     * Drain the posted interrupt descriptor (and clear its ON bit) before
> +     * zeroing the IRR, so that vectors posted before the reset don't get
> +     * merged into the fresh IRR by a later sync.
> +     */
> +    hvm_sync_pir_to_irr(vlapic_vcpu(vlapic));

PIR (Posted Interrupt Request) records pending vectors. ON means
Outstanding Notification, while SN (Suppress Notification) suppresses
non-urgent notifications, not the recording of interrupts. The
switch-out hook sets SN for a non-blocked target. An IOMMU posting can
then leave PIR nonempty with ON=0 before reset starts.

The existing vmx_sync_pir_to_irr() in xen/arch/x86/hvm/vmx/vmx.c returns
before touching PIR in that state:

>     if ( !pi_test_on(desc) )
>         return;

Consequently the new call can leave an old vector in PIR while reset
clears IRR (Interrupt Request Register). It can later be transferred
into the fresh IRR. This is a pre-existing reset gap, not a new
regression introduced by this patch.

Checking PIR as well as ON in vmx_sync_pir_to_irr() would add reads
to ordinary pending queries, including hvm_vcpu_has_pending_irq().
Reset instead wants to discard the bits regardless of ON.

What do you think? Would replacing the new call with this optional
backend hook fit this patch better?

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1433,11 +1433,11 @@ static void vlapic_do_init(struct vlapic *vlapic)
         return;
 
     /*
-     * Drain the posted interrupt descriptor (and clear its ON bit) before
-     * zeroing the IRR, so that vectors posted before the reset don't get
-     * merged into the fresh IRR by a later sync.
+     * Discard posted interrupts before resetting the APIC registers,
+     * including suppressed postings which have not set ON.
      */
-    hvm_sync_pir_to_irr(vlapic_vcpu(vlapic));
+    if ( hvm_funcs.reset_pir )
+        alternative_vcall(hvm_funcs.reset_pir, vlapic_vcpu(vlapic));
 
     vlapic_set_reg(vlapic, APIC_LVR, VLAPIC_VERSION);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2437,6 +2437,17 @@ static void cf_check vmx_sync_pir_to_irr(struct vcpu *v)
     }
 }
 
+/* Discard posted interrupts without depending on notification state. */
+static void cf_check vmx_reset_pir(struct vcpu *v)
+{
+    struct pi_desc *desc = &v->arch.hvm.vmx.pi_desc;
+
+    (void)pi_test_and_clear_on(desc);
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(desc->pir); ++i )
+        (void)xchg(&desc->pir[i], 0);
+}
+
 static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
 {
     return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
@@ -3176,6 +3187,7 @@ const struct hvm_function_table * __init start_vmx(void)
 
         vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
         vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
+        vmx_function_table.reset_pir           = vmx_reset_pir;
         vmx_function_table.test_pir            = vmx_test_pir;
     }
 
@@ -3212,6 +3224,7 @@ void __init vmx_fill_funcs(void)
 
     vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
     vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
+    vmx_function_table.reset_pir           = vmx_reset_pir;
     vmx_function_table.test_pir            = vmx_test_pir;
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -218,6 +218,8 @@ struct hvm_function_table {
     void (*process_isr)(int isr, struct vcpu *v);
     void (*deliver_posted_intr)(struct vcpu *v, u8 vector);
     void (*sync_pir_to_irr)(struct vcpu *v);
+    /* Discard pending posted interrupts and notification state on reset. */
+    void (*reset_pir)(struct vcpu *v);
     bool (*test_pir)(const struct vcpu *v, uint8_t vector);
     void (*handle_eoi)(uint8_t vector, int isr);
     int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq);

The ON clear is before clearing PIR, preserving the required
clear-ON-before-draining-PIR ordering (see vmx_sync_pir_to_irr()).

The helper needs only the inline descriptor, so initial LAPIC setup
can call it before VMCS creation. The hook is optional and installed
for VMX posted-interrupt support, including the vmx_fill_funcs() entry.

For the series as posted, and also with the suggested change above
incorporated:

Assisted-by: Copilot:gpt-6-astra-high, Copilot:gpt-6.1-sol-high-xhigh-max # review
Reviewed-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

cu, Bernhard

-- 
Bernhard Kaindl <bernhard.kaindl@citrix.com>

