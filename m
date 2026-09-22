Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94113C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 05:26:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428112.1650807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8t1J-0007aj-HC; Tue, 22 Sep 2026 05:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428112.1650807; Tue, 22 Sep 2026 05:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8t1J-0007aa-E4; Tue, 22 Sep 2026 05:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1428112;
 Tue, 22 Sep 2026 05:26:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8t1I-0007aU-5d
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 05:26:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8t1H-001VvB-7L
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:26:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab21175-bab6-0a2a0a5309dd-0a2a4501ed80-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:26:19 +0200
Received: from [40.107.130.124]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2117a-5984-0a2a45010019-286b827c671b-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:26:19 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB9PR03MB8303.eurprd03.prod.outlook.com (2603:10a6:10:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 05:26:17 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 05:26:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0o4NwVJVHu0UnaSq1bF7eZ+QNe1mIVG1pRU39f241mC4HSWlRN2rsEQnD3jlEw2VYKb+AS5fYeQrbpXRGI7kVQJwjTVjdMutECI6uMYtOk6gYhr8w0CgB+nXNpASduMCPHt44/AzDjWBh61bKKLY5H77V/ViJ7Un0sL0KwocvpAvcQganP9ZPjD/BTIG+qJ+8LE5XhS8MpuPwXv5smQasPhAtBQSCpy17lpBgCBMCy7jKoKw5Curg9mfDUxpo/miFRnW8Wlwk0cSb4jh7b1xwNZiySHeRmxl14OOO8qZ2HLwGQp8fcmpZBQI0UrleXPnLbyrtfuks/KKp+0bvOJ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkzG1G/uSLHdxO2Qo/R8DUfiJJyJT4LbFRZ/pEkIQVI=;
 b=OX3qD8baVHhJTopI65oowxBGKwfCXDV9ZaiQQQWxFQkwoqVvfNlhrXlFtI62N2zh3ra2wn+JXLY5szvISCPbHCAY9or0JK7llOEsyl2Zv8dqY5ieD6Q8yFIcfJY7kHu6tKAYoQTLiDAsZcgj91FSpKBy3S/4ivcTWwrOefbAwrFNkkcHiTXN6ysGvj1wT8mezIUABVnxuDQSgAMSxvIUMuO0fsDkhBMGXzBv26KP4QZeshafG62xCWD2QEEt5mcNMh7k3yMdqNOGl7VrFU6OnPx3YREP73rRCREuKI6nohvdHtiXlzCTpxizn/Hu8yt+Q/aZgkqp2eP7k5Afe3B7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkzG1G/uSLHdxO2Qo/R8DUfiJJyJT4LbFRZ/pEkIQVI=;
 b=dUZH+Gh/3xk7JdBbQleKClWa0ICz7li3tj9mvhmY/DUOPd/LX5o8TTcxfn4hLK9bL4rZRZoTE6VLmGG96VmeDhG1iZkO36x7qXZG0rUYQUjBxzDkkKuNL1S+7vVXEbeF8xJDV945pTfExojt+3hzlwyzLRQssSS2v1MJR8kRXpe1H8U/0jHYnQ358GAXeImzv8YSD5e53CKjWIMIOQrcMhYn4qlM0CKpfrGSJhoGFgN8glhPGq5lVjHKvPa7JPW3CcLS/OsPQRlRXgK/C83otgIN7zCKyNh2E0zFVKsXW/+JZXwOcuPrSXgeRZpAnIg83T9ATlGWlwEyWfGww4pOwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 22 Sep 2026 08:26:12 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 3/4] xen/arm: vgic: free eSPIs using the bitmap index
Message-ID: <arIQLs9Yk620U1EF@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <d359777c9fe4c4e1a53b93dea14e36adc4f39e00.1787050437.git.mykola_kvach@epam.com>
 <874igjxcjs.fsf@epam.com>
 <2e0f1fcf-dfcd-4a26-8124-4b7da0ca4f83@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e0f1fcf-dfcd-4a26-8124-4b7da0ca4f83@amd.com>
X-ClientProxiedBy: WA1PEPF00005B7A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::616) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB9PR03MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f27b79-892f-4396-ec6a-08df186a0690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	w1J5pJ7IhM+rqfWyOIc1N1i8tAQqG1VLKutJOWViHkALY+M7/UYq6v9jgrYFdST/kt0LMif03O4o2M3a+etlBRVG/Pv/R92posA9CZnA/aLJpciNDtYEVbqVpoPcCKfBBHGa+GXjqJYIQ4COY6C2fTw9aXdxc87oRScmc9CFUbw78x90JBn4wpbVajH/dPNrLzoxl87aE0QNAu6KJGsS38lkPLFbDIy2cmGOq1ICudUc47ymehkxjxo8/3Ny0gJx+Y5c0qfgVManMm8YfXXngslEbsbzKkyqX8xqDp2btZeVnivRQK56JbJQPPHrCDVc8hiSSe2z3/2FTRLUTL90UJa5dS46DyNcXUupz77/tjpY6exC64mH9sl94v3/0Lnx4j9wbUTUB2aNYppp998hwZKwGfvEjRBT+C2+yeOxswqYB4Du81YvuRGAZYeGQkao0usctalyxcEx/dF+UOt89Q0lk4bgaUfWfmWN6RUPT4/9AmebsfEvFNBPOGTpG//tNMLsrvMZ47CK8GDZKxBdYh9YpIkmGWSU4Zh53NkcHhOxl2083si4FacHHbDtqy/yjayFv65EBx4psReTFh1XpT2Rf6gH+HddJSNY2ShawvAyO4oCYtU+mxYfLx4gWT0F1gWvjIzw1NmZJLP5YmLr9xtNWKlH0QENxQtcvZc9FPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2E1YU11ZlhuSHdtWE1jMnN5OC8xdEJkSlM2UFJvWGtKUFZ5aGp0WnUzWWVy?=
 =?utf-8?B?cW1lTzVqVC9oZWxweUtCNDdZU2JwME5zMkhuOTVJUXVVSk1aK0FmQVgyTzY0?=
 =?utf-8?B?MFFqSndmUGFDZ1RvVWYyd1cwTTQ0ZXp2RWlKTkE3YVBqWUY5RFFjWEN4Yldx?=
 =?utf-8?B?blZYUEx3QzAvLzUwZDBzZkNEMzhtV1Nvc0M4UUdZUEFuNmQrVVcrQU52Z0Jo?=
 =?utf-8?B?YkY1OGw4cUZuRytKamJySW1HYzF3RGZJZUZsT3F5b2VtaXJ5bW1EcU5LR20y?=
 =?utf-8?B?azlCc21QRlF3N2lrS1RSL04xZGt1NStRYXAzbjk5amZMYzh1RTcwbytVUzJj?=
 =?utf-8?B?M0ZjOUVJN0R4UlFMUThlVkFCL3EreVljWXF0RUFLaUlaUXdjZkR1bUJtNWll?=
 =?utf-8?B?SWE4dGE2Nll5eHpjSk5aZUJWU0hNQlp5eFhzeWVENzg4Und5MG5YSWtMVENY?=
 =?utf-8?B?MUxDS0FKSmVVSmR5V0Z5bWNpbkRBQTdjekZNUHdGTURtY1ZEWm1YZXNVNlow?=
 =?utf-8?B?b2J3dkZHZCswdXBZZ1lYaFBVZVJCNG0xQStGQTV5VG5TNFBPcTJnVjZPOXhC?=
 =?utf-8?B?aUwvUmlXYmtsak1xUGF5K2pEenN6OWx5bGg1UGpDbzgxdnB1QUZyWjVNMTBy?=
 =?utf-8?B?SEdNMk4wbTFQSUZSaTJ5S2xXUlhnOGg1RGk3MHp4UHVHbnFiL1d3U0NrbzRU?=
 =?utf-8?B?UEtvMlpRK0hCemY3N2ZZdUcxK0JOdGNyTU8rRXMxeE9aZ0lUYjBFOXVDeUgy?=
 =?utf-8?B?MHhyYkhibkloeVRtZWpuc0VYcDJHUnZXZ3JLYkNkdjhqNzJ1eG1zWXB2UnA3?=
 =?utf-8?B?Y2lMNWZJeGRJaGpQM25wR21DaitJY1lZWGtIYXdmUFZsVTlEa3RFSjY5eTly?=
 =?utf-8?B?dEJ0U2hJUFhPb2VCU3VYM1IwR29LU1d0c2Z1RVRoZWV6dW1FUUM4cVdWcGM5?=
 =?utf-8?B?VzRrbUVyTFlpMExSY25EdXRNR2huUDltcnVzT3dZWGhqeWFGK1hoSjBQV2pj?=
 =?utf-8?B?NStRVVo4ZVFSSmlyNkdHYVpyVWdOZlgxL3R4T3hhano2RVEyemhMR0hneVlj?=
 =?utf-8?B?blFlRlR1TEVXV2R0Rk5oZ1RjRytBeUFyTldHRzhBclM4Qk02WHpQZEs2UGh0?=
 =?utf-8?B?ejh5YittZzNYb21IOWdWNTJUR2FsN2Q5bjlQalRYTFEzVU42QTEwT1JYWURG?=
 =?utf-8?B?WXBTM3NQTGgvWUNYUUh5UXVhNThIdWZZaXRZSGF0anpHUEhKeDcyNSswTm5B?=
 =?utf-8?B?L2FlN1FJUWRYa3lRNkpqcmRkeDRoUnQ2N29WY2c3ckxCbG5paThrU2JkcHBO?=
 =?utf-8?B?TGlEU2IwYUI4K1B3ZmJTTjU3bmxiWllTMWxGS0MwSDJOcXowTkFCYm9PMTJz?=
 =?utf-8?B?ZHdtRW0yRUM5R1FXM0grbnBoeXBqbkYxbzJFaGU4TTVmUTUzRUdUOGxYT2U2?=
 =?utf-8?B?UmFReHFocnpJWDMyUjg4UUN6dWhVZWlpMktVNDNhaW91WXZabkRBdDB0TnJR?=
 =?utf-8?B?MlJYUWxyZlRyQW5HRkVaMFY4VlhuMWhFWFdKZEdvMU9EdHY0dDZUdnYxOGFq?=
 =?utf-8?B?RCt5dHJ0K0JORlNyZW4zMUZjeVJLeHdDR3pJQ2UrRlJKS2JIUmJyRGhKcEhH?=
 =?utf-8?B?NENDVHovTjRUNFhyMVRFNnMxSFNoZ28zbytLUzJ4WHZHTUNpM3hPektUcDVK?=
 =?utf-8?B?eUhjZGdDTlFWU2pmcUlTdDB6aXkyQ095cmVkSVBFSzJDZGJ4YU94ZHZTV1R3?=
 =?utf-8?B?eTVkQ0hkN2w4RFdZdnBVSVBXdXZncWFpWFBtY0puZFcwRVV6ZjMrQWE3emJx?=
 =?utf-8?B?NkR2ZTVwNGF4SXhTTStOdGFoMmt5UkNleWZKelBqd21RUzVBNXRTQUpjUnRW?=
 =?utf-8?B?VUdPNHhQSklMaUZ6T1I5dXZYMWgyaGZCb2JUNUFLdnAwWm1lNnNjMHJGK2xO?=
 =?utf-8?B?TnptR1BNRW1jcFkvWVF4SnppU3FKOEFlZjEvcFI3bTJHV0lrWjUwWVFHWS9R?=
 =?utf-8?B?MUhOYVREazBleU9tTElMalhxMVJ6eGNZVDNqVUFPUVI4K1dKRFovYjduRGZN?=
 =?utf-8?B?NjZiSVhWNjhUa21CTFEyT1JEMXN1UWlaVmQ0RUdIdU5ucDJRUWtiTklNZUJM?=
 =?utf-8?B?NEFnOHhrSUJINHpkZkI5QmZ4TWhidFpHUm0zeGtrakVJZ0lSMXNRUWpqTXJk?=
 =?utf-8?B?SkcyZzR5d0dkazFHbmIwT3psN1c1UHZ2V3FlRDJzRlpMUzZQa2ZWREtOWEpa?=
 =?utf-8?B?bGJJb1NQZmxLRGYyQXE2YWpqeVJxSmpLeW5xdlhHTUNTUjUrWmE5elFNNWNX?=
 =?utf-8?B?TzNzUWFaNklzZFQxZGRtK3l2MTh4VHFCbFh2NUNtRWdqcEtXNEFUQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f27b79-892f-4396-ec6a-08df186a0690
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 05:26:16.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWg8UPPMF9GUBk6gEyecGrpudp6xajOTi41Tt3W6rilJoZF64LXaeZ6KZYKxMtGi0xkOvLGEBQcjgVFSoZWmFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8303
X-purgate-ID: tlsNG-d62444/1790054779-BE465757-87861756/0/0
X-purgate-type: clean
X-purgate-size: 2019

On Mon, Sep 14, 2026 at 05:55:29PM +0200, Orzel, Michal wrote:
> 
> 
> On 25-Aug-26 02:35, Volodymyr Babchuk wrote:
> > Hi,
> > 
> > 
> > I have only one small question to this patch. Please see below.
> > 
> > Mykola Kvach <mykola_kvach@epam.com> writes:
> > 
> >> The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
> >> allocation bits immediately after the regular vIRQ bits.
> >> vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
> >> but vgic_free_virq() used the raw INTID.
> >>
> >> Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
> >> This writes beyond allocated_irqs and leaves the intended eSPI bit set.
> >> Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
> >> and during vPL011 teardown.
> >>
> >> Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
> >> and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.
> >>
> >> Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
> >> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> ---
> >> Changes in v3:
> >> - Adapt virq_to_idx() to the configuration-neutral is_espi() helper.
> >>
> >> Changes in v2:
> >> - Call is_espi() without a configuration guard.
> >> ---
> >>  xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
> >>  1 file changed, 16 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> >> index e14123a30a..e541348a5c 100644
> >> --- a/xen/arch/arm/vgic.c
> >> +++ b/xen/arch/arm/vgic.c
> >> @@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
> >>      return idx;
> >>  }
> >>  
> >> +static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
> Please add a comment at the top of the function about the layout these two
> helpers encode to prevent such problems in the future.

Ack.

Best regards,
Mykola

