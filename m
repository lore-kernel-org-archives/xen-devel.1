Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CFCC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:10:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429905.1652500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9IzL-0001OV-7X; Wed, 23 Sep 2026 09:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429905.1652500; Wed, 23 Sep 2026 09:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9IzL-0001Nr-4P; Wed, 23 Sep 2026 09:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1429905;
 Wed, 23 Sep 2026 09:10:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9IzI-00013k-SU
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:10:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9IzI-001Ugk-9M
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:10:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab39758-8faa-0a2a0a5109dd-0a2a450ca9c4-34
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:10:00 +0200
Received: from [40.107.159.120]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab39767-f479-0a2a450c0019-286b9f78559a-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:10:00 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by ZR6PR03MB911552.eurprd03.prod.outlook.com (2603:10a6:910:d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:09:58 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:09:58 +0000
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
 b=bEaQo6vmckxOZdHGwtcifI7WXBp0BJYmI5pRDQSxaigtqRFl6Mim70uNCeeIP16scKBwAM4ysS6X5NG/tVZA4tVdw6WHTKZGszkg77IHsJ7Y0UbXZ+DD7/5inpoqG+5Pg8Jy67F8/Xj0JUDOj0q8oqixVLjYKH8w2vlK2+AlG64VEcT63XwuKqlkOJ/yyB9xhKaetCm/MV2jUnACbYhTMiNbgKeg6xgiawg9wLcZhcLQTgKyUuCc6zEhygc67B5uknEvSESW1M6fdXl/2MOAb3LQcuEASFjzpWtDSX68Wa2sA+JzEMF85vPzHZyq4hm48Rt93ZtcbwRHB+EOtW67nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hDleXXQ7ZFYiRyz/TOQ5zOKUgB4ljJBW/GGekLzPjk=;
 b=p9P1b/PXJ4PQ4+3+BLigW6GMuHo5QkM3PgDEGHnHu5itNf54dxtTmwGb0QoXcdCWxyVvOZRTgjvszbwYFCvzXcETrjpDyQKUgGKpp85ypFUVYpbvv587Pb6PIGOiU8orVyPiF+nB6d4QEr7v3XQ5EtZe4QwgIbWNGhXKdtcmBZoZ34OAUxt04n8nXh+MOy+MKzcDEbHbF2R4HuLxwW1hP7WdyjFepRLVZNrcGQCt0H8QppxPfZjpOTGPQ/YxF8kDlzDgFGax6K30dOM7pwv/O4KImEQK1acSrSDXgq/WPjpia0gu4YLrk3V5wTlZG2oR1e/PtCFLsbbEzkTIdLmsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hDleXXQ7ZFYiRyz/TOQ5zOKUgB4ljJBW/GGekLzPjk=;
 b=Ra9mw345dgQLnSuCEMftWskKowr5MvnfJNkWxrk4aPZYu7m4sRRb+qIRodj94mOtZ9H+bG/OzOJmO1spFuhnAWK55TlDQy2VT+5FeS3lHqeY9TiK+k0Ammx4gH46MwQ9dvUIzZObPIokueMw5xHhkGI7KfYfDT2SCJpHFMrnDxUZf21Z1mE2YkX+5FWoB1xZzTkPWvqS6ytO2xeUPQaXqPN0INPyk+6eCxcByXgTH5b/Z5zciBDpE6VR9ejCsXFJWKAKpmWdEJVen0peLQ5939HkqKAUqdwYHuCxOsdPLRJd8pHFAlTWy9IZvNqj+0yC0mQSzTE9X47J4PPUQnCWjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Wed, 23 Sep 2026 12:09:54 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/4] xen/arm: vgic: free eSPIs using the bitmap index
Message-ID: <arOXBqBhpYTB5P5j@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <eb8e52ee6c227f0fd7d059d1ddfd0de6eec45fe4.1790056623.git.mykola_kvach@epam.com>
 <bf6c4358-32c0-4f9e-8122-8e2c298a6377@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bf6c4358-32c0-4f9e-8122-8e2c298a6377@amd.com>
X-ClientProxiedBy: WA2PEPF000008AF.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::657) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|ZR6PR03MB911552:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b0adca-4748-425c-c331-08df1952708a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	CqNwlwX5it8USBSm8WDktdr4DcAxaOiT+Gc9eo9yyvdIxc39jq+XQdJW62OuiOWyN8FcScLHTbefD6yMVVLGWFz2S5WTFE70kkRi++RgyH0y9I7hE02h1vMSa1u70Hr1ZiRxcl0yDGbzmsxc07UN0xYVVlVjSnZYviURMm2TF9In5cF6CqjcaMX+VctfSVbb4DUr2jaxlXoSuLT7kTKBiOIgbGob/xuvQhyNvFDfGpYJLzAwqqzJ2VPjBAeIlShTJcwstSki0K1CMcM02RCQP844Pc2yj30mnmmA4ZUVNtX+p1azWk+0nYkwDoILlMIaURJuZNpoPEXE3cAFPQGSIgjKOgULmnsxRtWp19PeZ5ZeE580BCIGPdMJDfzqiSgFTu77yLXqpO9IAVIt5YwBIFvqMGYTUUjLKZYKyxbNhfEx+8kbhtvtR6OWdQHCFmeNMFOTSrxdkgPCAiGYeMHhMO3b2HwJBMCosVTC2fqfBhuUcS5DpSk3LnRy/FiWHPkTTeq+JbwoI5iwJ2C9o6z28d/RgXI26uPmv/KBZKiw2H7okzmvIZO/HiSyh+1uI3hUehV8F9tN1wy0eVhT7A5OZ+Ht74bi5slVItoAPrstAv4UBFMa9vnYRl5picPxKW4BKfLMXu6eiFZ8r+IoJdqmTrKO195RfLhHDWJfICr9A9U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkNZWEdsTWkwMTZ0ZlIxY0RSUGk4bVoxWmpBYmpaVUlDNURhcTZrNWd1RC9O?=
 =?utf-8?B?Vlp3R0M1U3NsNTNSYzUxOG1aZlpwZWxieUp2VGdIODhuTnQyL2VJeTRkWkVK?=
 =?utf-8?B?S1BPa0g3eWZ1YUd4bnZwa0c1OHg0R2VsWDBrd0x6WUdRVVRtN1FoQUdsSG1W?=
 =?utf-8?B?d1Nhd3JCSStYNDgrYndyNDhnYjNaSXNyOXRVQ0QwT2d6d215THYzd2NHZ3c1?=
 =?utf-8?B?dlJkTjNvN29EYnRyVDNEYzZ3bXUwMG85V1Y0VDBnMW9kVVdvNDRTamRGNW1G?=
 =?utf-8?B?RTNSb2xtWkhiN1gxdStqZDVJb1poV3lnR2dTb1crc2xGUzUxS1R0bmJ5SGc2?=
 =?utf-8?B?RFBFSTJqZHp4YW0zdm9uY0NJQUhWc0IzMGtJVzN2UjFxTFVDSkk4T25sZXZO?=
 =?utf-8?B?UFoxUi9QOXlMdWdnaHFHeEZiTjNmemhLb25NeitEN3NkZ1I4cTl1ei9tbmlw?=
 =?utf-8?B?OVFEaHJlNGliRnZSbEwxbHpRVWJnWWNzRitkWlh3TjJLSldRUDFTejZuTmo0?=
 =?utf-8?B?OWhlY1RaSlRrRWlkMjBkNW9pSG91TS94V1VDOEwxaVJkVTJkNk96Wk5IemRC?=
 =?utf-8?B?K0JJaDc3S3N5V0VZOHNkL3IrSXZveWs0MjVwbHhMQ0h5dVJTNXdJM2VrSXBY?=
 =?utf-8?B?cFJ6RVdYMVZialFOQmxMZUtTNzR1QzZoZGtuTFJnbXNIQ3lvTEtTMnZRL0JP?=
 =?utf-8?B?MnFoUlNqaVZCcitHbytFV2FuRE1BQ3ZUOE5oaEJDTWlUWHJSYVFXSDRtdERy?=
 =?utf-8?B?OUxhWnJpaURteGF0SVpKbUtXd0psRHhzWEgvQklwZ21oYUY0UFBTRXJmRGEz?=
 =?utf-8?B?Qk01U3BBVXFqTkdOM2JmT09kQW9vY1JVUEh1UDdKSERUbG9qNnlpUUg0d3JF?=
 =?utf-8?B?Uk8zTHZBeDRBK1BjWUw3bENSYzVSQXJNdkI2Z2djWHYxM3pKSzhyT3NxYWNQ?=
 =?utf-8?B?TnN0UVQ5clNsZWdBN1JCVTAzdXNRMXErOTlTSmdLWU55a3MyTG95RHRUOEh3?=
 =?utf-8?B?QmlQNmYrNFN1Rkp4T2FWNEFtRVo2d3ZUSVI2MG9qYTRNRHRTT09LbWZSbDBk?=
 =?utf-8?B?a3FtOCtUdjJBQzVhRDhtTHp3dTJiVmxKVEVsVEJQeVZDcFlvWXliVldTOGNt?=
 =?utf-8?B?QVdMUkJicHhGb2trL215Tk94dUNxb1V2TnAySHloWG9HdERaZGZZTzZHcko2?=
 =?utf-8?B?bFlrZ2VweHNBT0ZwWVNaZGpUVVl6T2FCelI3OHdETStrU0xISm9xY3VIVWlK?=
 =?utf-8?B?VVk5UW5SeHl6V2s0dlE1b2Vld0tGN0dqQmtpUDBDRWl2K2RWTEVHalNIUUgw?=
 =?utf-8?B?K3dmbVVmNnpWWU1NNEhiRS9lb21XUzZTdlFyNE5NanUxRHR6N09ObWZZTmdq?=
 =?utf-8?B?bnB6YUMrWmhMRHl1S3hEWjZtaVVWYm92T09Da3BCL1ZnN1kvS1pYc055b0h5?=
 =?utf-8?B?Tmp0ZnhPMDFPakI4VUhiajM5NXRhOUJiSGR0ZFVzanRHVW5udXlmaEdQMGNP?=
 =?utf-8?B?b0NLVDVDSktVOUR3Q3V4OVY1SGlMUWNVeWNSekN6L2U3QXpXWjJ0UmdZNGpv?=
 =?utf-8?B?VkpvaHp2Sm01UURCUGw4LzM4Z0QwOE9DaHJ0RTBmaTdPSWgvYWxrY1VGeHZX?=
 =?utf-8?B?ZGloTkZHajJSZTJ2RWNrUXpUSVBTamwrYXlEN0lVWk9JVDNiUnNLTm9kZ1hs?=
 =?utf-8?B?TWxlK2hJcUFHUkpNUTl0VnVYcmplUTFJS21zOGVuV1ZXVzNzb21zM2sramlu?=
 =?utf-8?B?NGZHWDFOWFluaGxwTmZCRERBWW5KWVQ1WWRWQXRKVkJjaTlacUhUSG1qTnRN?=
 =?utf-8?B?RjdJUWplZWs1Nk9JWVJjRzRURUd0alltZXBBTk5HcGh5NTMvRlZsclRNaTYr?=
 =?utf-8?B?RXAzLy8zVXQyTFNDeUZieEdidkRGaEpTM3NDbjRPdXhnQU9vVEVQamRhT3lJ?=
 =?utf-8?B?aDc3eU54b2cvNW54SzczSkhTOGtaVGJFZUViK3g5TFVGZllpOEtFVWUzMncv?=
 =?utf-8?B?cEQvV09IckRRWHlwMFdSdnJkSldzSUNCeFZ1eG1PU3hwMmlDeHEwVnprOHFZ?=
 =?utf-8?B?RDQwNmxoWE9xdXRvbTN6ZTNkc2c5eFdzSWdaQ01KR3QyOGt4UjNNUTFwZmow?=
 =?utf-8?B?dWw5QXBuNlo1Rm1TS0d2c3d1aDJ3Mlo3R2o3VXdFWXBnWXBTdU1TYzFweFU5?=
 =?utf-8?B?NDBZVFFEY0tNMHVmN25BaS9sdWxhdldjNjNpV1h5RkpONmFsMlpYMUt6MGsr?=
 =?utf-8?B?MXdJdTl4YjI4T1RlWUpWVjZHQ0I1dHFDVklZaERJTjA4bStQemg3enlkR0Nu?=
 =?utf-8?B?RitOR1lrdmIwT2JMRnNEQzJ3Q254N21zL3k5cXhKaWNjejE1WVJsQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b0adca-4748-425c-c331-08df1952708a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:09:57.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUe0RJzUZecLjNS4mEgIBx8cfOIad6SP1G4aRI8Xy0uDwLkZE4YAeYJ/ar0QyOube8h+x0b6pxe0iTZ+5nuedg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR03MB911552
X-purgate-ID: tlsNG-d25034/1790154600-02EDAA5B-E509B05D/0/0
X-purgate-type: clean
X-purgate-size: 1352

On Tue, Sep 22, 2026 at 04:21:13PM +0200, Orzel, Michal wrote:
> 
> 
> On 22-Sep-26 08:39, Mykola Kvach wrote:
> > The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
> > allocation bits immediately after the regular vIRQ bits.
> > vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
> > but vgic_free_virq() used the raw INTID.
> > 
> > Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
> > This writes beyond allocated_irqs and leaves the intended eSPI bit set.
> > Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
> > and during vPL011 teardown.
> > 
> > Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
> > and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.
> Please also add this validation (just vgic_is_valid_line() guard) to a new VGIC
> vgic.c. It's eSPI agnostic and we should keep them in sync if possible.

Sure, I can add the validation there as well.

Just to clarify, NEW_VGIC currently selects GICV2 and GICV3_ESPI
depends on GICV3 && !NEW_VGIC, so the eSPI bitmap issue itself cannot
affect the new VGIC. But I agree that the validity check is generic and
it makes sense to keep vgic_free_virq() consistent between the two
implementations.

Best regards,
Mykola

