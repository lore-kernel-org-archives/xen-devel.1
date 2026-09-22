Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB537C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 05:20:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428106.1650799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8svE-0006jM-UZ; Tue, 22 Sep 2026 05:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428106.1650799; Tue, 22 Sep 2026 05:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8svE-0006iu-Pw; Tue, 22 Sep 2026 05:20:04 +0000
Received: by outflank-mailman (input) for mailman id 1428106;
 Tue, 22 Sep 2026 05:20:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8svD-0006BF-2X
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 05:20:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8svB-006Px7-LX
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:20:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab20fe9-e002-0a2a0a5209dd-0a2a4504b3b6-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:20:01 +0200
Received: from [40.107.159.115]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab21001-b57f-0a2a45040019-286b9f738fb0-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:20:01 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB9PR03MB8303.eurprd03.prod.outlook.com (2603:10a6:10:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 05:19:59 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 05:19:59 +0000
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
 b=yNeFeRPj5ZpsZ8bp4hqEWSlNg13z5NKjJt1eUBuKptJaaTS6ngwo+UwAdJUAXnpNnJ9Et7I6vYsEsSDk99UBuh6G8Xkww8VsQKDy6RMFP2Z6/fYOb3HhHKdrkiJSpYo67f6jZyTT01Oj3IxRzN7RSObjPpPhO9vtlaAtSBZ56sGTcJ2pPKTqOtmw+o/OhYKkMaA/M+xxCJuqjeRcD2Ull3wPYqsxig2Y4nMc2D9vHmP+0riXbhevnVUBy0XiSk0HDTGwvKIsD5Uq0r1l7vb/PlVwn6cnFGoGiyAa58RZaZjKjKcFRsI9FstFJzCiTaBAX0PwwF/xFjHIQPNoS64Z7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGDhDbXuVaAP6C+unbfLmIltTL5fRqzXWcgSLJjMI1Y=;
 b=SXl+v6jkPs4vadNlWpjOa6qnQzOCtBNpMphSSVeT/g3XXlsEPfrDaszZoG7AHc3A88I01yHKBYGlsHbc/lUhwoJ7OrmtH4Zr50j5A9uhuEj3KgijTKxrRVvZtUJOwMfY8TajAofR/qMRgqeAiBCNSb0Xy0jd6bJycJCv2uAYi4gAX79tmQnHWhxqNi0DcK0YFFf88w8Hc/yXEpl6/17Qu11vbwFL3nS77Le0yI7oYuinOpoX0u+fIUWbx9KJjiO3VdZGJNggVbTO8ufxlTsRv06fh3/0SfNf+QPdzny+T9N9UJgccYvbFNvc61YYfwZo1/GZtfdggjuzlO3cnexikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGDhDbXuVaAP6C+unbfLmIltTL5fRqzXWcgSLJjMI1Y=;
 b=odei0alLPWUqL6+4H45OyCzaemagbwbw5KtONrbpFWt5FbxxupP/BP/2xKxYNmWzSaRVcagmEjmLzLnOltS9p/6BNgUr2YQfWll97W4h+08JRqHrpqONtXLhkjKcyVX9lJnDG/30NTgG3RGgdWPDPVq6egtkzazEoRIKI44JpZMy2wzYlJ9xwKUaZWb1AcKCrX+e9ZlP3CdF8XRgEWAskEpxqyIMZvCTakWdSP5jMZrVGUSDgfiIlHaUF2UdWxvyZuJF0VU8Qt6MZmu7a9oWDt07Krpi21nSk/3yjq5EJEhRGFZk3MNUAA+/o4Xw1faGqyj5k0rqRfgrxNjN4LLz3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 22 Sep 2026 08:19:55 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 2/4] xen/arm: validate IRQs before descriptor lookup
Message-ID: <arIOGiyEOjET5zuS@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <355ff5a0aab671894a527ccb7b5999db6b168de3.1787050437.git.mykola_kvach@epam.com>
 <87fr03xcr1.fsf@epam.com>
 <4eba243f-01cb-49a6-9f6f-edab49d5901b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4eba243f-01cb-49a6-9f6f-edab49d5901b@amd.com>
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB9PR03MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d92058b-04c5-4d16-2514-08df186925c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cjGcKvUHnUTcdRNfVf0s/W5/DPCPBSBketGFMRB6bo00Mko/OcLkRigfOWp93aItMmvhUvnbSYQ/D2beXg6xrm7pGpk5wHby5vxY7jKzVIN38gF08fw5OUZFcKtIxWMJewh23Yy841N1eaPwuidWtbAz7g1fO0c6vktnn70JXusoLPP/pt2/JrYIBlR2JjBVuABRKQ8W3ubYKLujRe7m8VKKzmPb1LKq6B8RpNdfdi27sHmTIFNDr7tjatUcV93KUc1Ic9CMok+h/MJicXUEEimaCZ2Bcieyk//T1LrP9Qln4I0RCl1tW+fmuEwCADF7Wwm4ITjT5DMSU2PTd9WsaKELTP9T/kQ+fhxSDpOb5yrhLAPqZSq2bKzcOCya7jRgYW7nkoA8S6u/tKI3v4nFcl+BpAjzki1KXkEVNZgqpVjQ2UIwB+PGlyx0D0gQJJPHxU7zGHsJwYza0Skc8kTH9IyWMU/K+jmrZzGmS7qJSTJTTWctp0ImMyTrvbjmO+pMXfRElMI6oSqtD0Jfda8P6xEiWuuxJCtq0adUkPoYui8UdzdQNiFgFlVpkpQgntGp/8gQ+1qfOgPDAlSpentWmug4pRhPdWz+1YS4jsIiPSrUvUV0pO4hC4LA48e/aJOGQ6rjStwnj75641f1FeF2Ywzijh7g2SKumeXn1JThteQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OU5VZTVWdGFNZHB2QjUrU1lvT01McEN3bngwUnFDQ2p3Z3lCN21iejdCYTFk?=
 =?utf-8?B?ZEh5bno0eUN3WEljTi9tS3VGdW93ZGhsT0lJMzFlVzBucUNFUTZEaHRHNCtp?=
 =?utf-8?B?U2pGK3V6cXdCN1M3S2ptMm9jeWFudkhHNTZJaEJ6ZkI2aURZRE5yTTVvU1R4?=
 =?utf-8?B?YmErM3A5T3B4MjRBY3dIWXNPaEZVb3dHVGUzZEZqSkRremJORTg5OTY1NWpi?=
 =?utf-8?B?UkhacDJwQVY1elNvbldpakVPL0NwY2VMSm9nWnR5TThXSUNFOGJGTUhjSEZq?=
 =?utf-8?B?RlIwVitYL2ZobUZ3dXRnNG9aVGkzY3liZ1kydzdKRnNoVUdER3FMWlA5VWc2?=
 =?utf-8?B?bk1nYzg2cUt6bEQzL214NFhmbzlpN2V3T3J5S01zUHd5M3dlWjI2b29SdjJO?=
 =?utf-8?B?YTdSV1Zrd0pSRUVDcFNsU2FnN3hyUWc5NEF3SDhNRXN2YXk4dlNzR3JPVEtK?=
 =?utf-8?B?SVIwZ3JpUzdrMXRRSW1UY1grcGo0S05ZYi9TaDc5Wm5VL284TlZIekN5MkdQ?=
 =?utf-8?B?bGhmbXVYVEx3T0V3SnFiSGtSSHMvQXhyKzBDWkM3WWR1VmhNUmhralpVZVY0?=
 =?utf-8?B?WENJWXJVL0JxcW5JVkxOajNjVXZ2MEVMc0NMSjl5Q2RWSUZIWWx3UHpMdFYr?=
 =?utf-8?B?SXg3QW9RWmJJdlFCUS9BeVV3WHk2UUJIT2VIaEllbFA2VVNRU1dleEdlV3ly?=
 =?utf-8?B?MndFM1QrVFhLbm5LMS9yZEJZM040aWt1QkxJZnBmMDNxQ3ozSnNLUmdGUXI4?=
 =?utf-8?B?YU9Fc0dyNWQwZ2VTV3F6VXJ5dzdkY1FveU9oVHRvc3pCUEhsOUE3bE9ZYWJy?=
 =?utf-8?B?ZE5kdlkxWjZEVnpLSkxKMGVMRTVIRXk1cFpvSnZ0V0dOWEpRWmlKSDlLWWxP?=
 =?utf-8?B?dGw2TW41ZlZFSURLSjZzTFJZYlFJelY4Qkc4eDRqL0lXT0NoUkROWkNwU3Zl?=
 =?utf-8?B?R1E2TGs1VUJsKzk4NFYyS1pTd3FHUDJmS25Ka2xDZ2NoNU53dGpha0lsODZD?=
 =?utf-8?B?cGs1R2dyckhROU5UZXFRUU5VVTJBWGFqaGZ3dVk1c0N3TlFiWGtXaFRmaHNl?=
 =?utf-8?B?V1FDYU1zaFB0WjNNa2U1T3JXcFd2cTdHTnBrQlVDVHFyaW1vV1pYS29pY2Rj?=
 =?utf-8?B?TUM1b3NHRldESFJMUjE4MU1OVHF1MHRoKzA2NjJMK2YxWHlob2ZwZlEwR01U?=
 =?utf-8?B?WDFWSytkZXBSeW9yQUcrMWZBczdCMXVPMHpLSGYrSU9YeUJ6ZkZSQkdEcDl5?=
 =?utf-8?B?dWV3ODB3aWQ5N2hIbkd3UENOM2svaWpiYTlRUVExVHRhMnl6VS9uUTU0eFpB?=
 =?utf-8?B?TVhtYmpTVlMzSUIzMkZvanp2dEp3M05NMWVPU3JqNGcrMitUNC9JOFpPY3gv?=
 =?utf-8?B?cko3Y2k0OXBYVFhBVXJBQU4xdjlMUGhaOE80WTJDMzZZZHAxMWR1Q0xCRWVi?=
 =?utf-8?B?bDB0cnB3N00xTkNTNFFhYmhLOHRzTS9hck5WMlhDVkJzdnRibzgxOU1rcmIy?=
 =?utf-8?B?c2U3bnRucjhzclliaEFNL1NMWHY1c1NOL1RMNzhleXdOU3p4TVBWeWlFb3VQ?=
 =?utf-8?B?NnJNdUU5Z096eEtzZ1BVQUZuSGlmL0o5cGNIL0ErbWxqeW5lOTQwTTIweWpG?=
 =?utf-8?B?MGFRMktHYnRvTGIvbmFSb0NMb1VwR1JiUkpodDNtZ1V1OXd0TTB0WlZlMnFX?=
 =?utf-8?B?eVFNdWNNMms1YmxPMWY5SUZqYUVJdWtKbldHd3EvbmVkRDQvcXBTODBjb2lp?=
 =?utf-8?B?SDZ2VFdNQnV4M3lyK3QwSTNRbGJDYkVMbEU0bUdIZVJqQnY4TituenI3M050?=
 =?utf-8?B?eFRlbkh6ZU9WMFlBT2t0SW9zUzhUSHhsZlU0eE1YV0huZXZUNEQ5d3ByVUY2?=
 =?utf-8?B?SU1PL1ZQdVM4QUluWHZ3ZXFCRElpMGd3UW83ZGdvWjNuVVZIN1BVVTFtOVRS?=
 =?utf-8?B?SHlFR2RrM3lTSUcyaTJXRVJ4WXZWVHlObHJDMkhJOHM0YzJqNHg3M24wOXVr?=
 =?utf-8?B?UGdnemtQT0p4Z1ZjT0tWaXEzTGs5bDMrY1dOeE9tQ0Y4aHpZOTJXS0FBTGNy?=
 =?utf-8?B?a1FobXF5TmpwVHl6ZUxxZFF5ZW9uME9TM3FwcWZqbFFWeTNPbTVYUzdZZHgr?=
 =?utf-8?B?UjcwVGlJZVpqQ3NSMHpCcHovYjB6MUg1cjliR0UrVVAzSm1QNzdsajVCOVk0?=
 =?utf-8?B?akxPSjFSSnBXbktvYVJubUVVc0tjbDZwNHRyK3BEc0R4V0ZRUGxGdlZBQW9X?=
 =?utf-8?B?c2hTbGZJeTBHMGkwQ0s3bmFuVXJ6ZlJZWHFRekRYWkF4NWZwTHlFZzJHUkxP?=
 =?utf-8?B?TXdIL0docWYvQkgrV1dRaXozdTQ5QmhFVTVVTEpOQzJYczcyVENNZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d92058b-04c5-4d16-2514-08df186925c3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 05:19:59.5155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yQAXJaUoWG7kDR2zuDPE/sSccWKVlBg8Q44/cOMZrSdbH9gwuWB3ochmKbBWq0jxodqbfQTD3rhR8/hxykQ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8303
X-purgate-ID: tlsNG-ebf023/1790054401-51ED6B50-E25DF726/0/0
X-purgate-type: clean
X-purgate-size: 3939

On Mon, Sep 14, 2026 at 05:20:44PM +0200, Orzel, Michal wrote:
> 
> 
> On 25-Aug-26 02:30, Volodymyr Babchuk wrote:
> > Hi,
> > 
> > Mykola Kvach <mykola_kvach@epam.com> writes:
> > 
> >> GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
> >> through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
> >> and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
> >> INTIDs 1024 through 4095 have no backing descriptors.
> >>
> >> Validation based only on nr_irqs accepts an INTID in this gap.
> >> __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
> >> update unrelated Xen memory.
> >>
> >> Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
> >> looking up a descriptor. irq_set_spi_type() can run before the implemented
> >> GIC line counts are available, so validate descriptor-backed ranges there
> >> before looking up a descriptor.
> >>
> >> Assert the regular descriptor bound in __irq_to_desc() so direct callers
> >> cannot silently index the sparse gap in debug builds.
> >>
> >> Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
> >> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >> ---
> >> Changes in v3:
> >> - Add the requested bound assertion and retain the SPI-only comment.
> >>
> >> Changes in v2:
> >> - Validate descriptor-backed ranges in irq_set_spi_type().
> >> - Validate implemented GIC lines in setup_irq().
> >> - Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
> >> ---
> >>  xen/arch/arm/irq.c | 26 ++++++++++++++++++++++----
> >>  1 file changed, 22 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> >> index 73e58a5108..bf14180f97 100644
> >> --- a/xen/arch/arm/irq.c
> >> +++ b/xen/arch/arm/irq.c
> >> @@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
> >>                                          (ESPI_MAX_INTID + 1) :
> >>                                          NR_IRQS;
> >>  
> >> +static bool irq_has_desc(unsigned int irq)
> > 
> > You are using this function only in one place, where you are actually
> > testing for SPI. So, maybe introduce irq_is_spi() helper instead? And
> > use it below?
> It can stay as is but:
>  - move it next to __irq_to_desc(),
>  - use it also as ASSERT(irq_has_desc(irq)) in __irq_to_desc() instead of the
> assertion you just added.
> This way the two stay in sync.

I will move irq_has_desc() next to __irq_to_desc() and add
ASSERT(irq_has_desc(irq)) at the start of __irq_to_desc().

> 
> > 
> >> +{
> >> +    return irq < NR_IRQS ||
> >> +           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
> >> +}
> >> +
> >>  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
> >>  static DEFINE_SPINLOCK(local_irqs_type_lock);
> >>  
> >> @@ -76,7 +82,6 @@ static int __init init_espi_data(void)
> >>      return 0;
> >>  }
> >>  #else
> >> -
> > 
> > Please, no unnecessary changes
> > 
> >>  static int __init init_espi_data(void)
> >>  {
> >>      return 0;
> >> @@ -95,6 +100,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
> >>          return espi_to_desc(irq);
> >>  #endif
> >>  
> >> +    ASSERT(irq < NR_IRQS);
> check_timer_irq_cfg() in time.c calls irq_to_desc() on timer_irq[], and on the
> GTDT path those are not validated.

Patch 4 already handles this. It checks irq_set_type() before saving
each timer IRQ and stops boot if GTDT setup fails.

> 
> >> +
> >>      return &irq_desc[irq-NR_LOCAL_IRQS];
> >>  }
> >>  
> >> @@ -416,6 +423,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
> >>      struct irq_desc *desc;
> >>      bool disabled;
> >>  
> >> +    if ( !gic_is_valid_line(irq) )
> Please add a printk message to inform the user.

Ack.

Best regards,
Mykola

