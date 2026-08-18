Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79033C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:47:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393852.1632667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGPR-0000Og-LJ; Tue, 18 Aug 2026 09:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393852.1632667; Tue, 18 Aug 2026 09:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwGPR-0000OZ-He; Tue, 18 Aug 2026 09:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1393852;
 Tue, 18 Aug 2026 09:47:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwGPQ-0000OT-3c
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwGPP-005ivD-GX
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:47:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a842a15-bab6-0a2a0a5309dd-0a2a45048d0c-4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:47:03 +0200
Received: from [40.107.130.91]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a842a17-b57f-0a2a45040019-286b825bb462-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:47:03 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMBPR03MB11696.eurprd03.prod.outlook.com (2603:10a6:20b:761::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 09:47:01 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 09:47:01 +0000
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
 b=b2LTZ+NYxCiyyUTQB6dBzArHlizulz2kB4GG3NvE4GqWHbkFre4YM6QHyZ0ukLLX7AyWH+tabNXGBy1CdPXWGWxL6XEdD7cLpSw0zeHr181K7s6m3si8Uj8KaxQqLL7fuDuIcun0FRnY4LUSrzRn84cgaYC/inGMq0KNgV7NorpHKl8vTypxS3p5gfqIRI69SdReOVwX0SBlFiC3+6PVweCSDL2obExP8UlmM3IWhMCpY3V9dl+IHzxI1gkVzYDW/vfayzB+5e0Ik1jXWpiFVmS2lARrq5eUigdCjSSlP9pcogFFGHniRmJ6E5aUnpb2EnQ0MtVE3GBxpwam3MtGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz1gqIWWsKdIgKvBwJLn8N3sahAW1xLtDaWTiYno8Kg=;
 b=NicTafW3zGpktRtU18o4Uekz8n8eM9h2uBdz/cC0Q9YtFI8e4Kd5T43+iwm2vM3IhF1sc9SCfroV3r9lGOBlkD8NSecma1wroxfU8aR92uUT916DkCGZYg+mQ8c8PnlOy7+Sx13bgpzbk9oUQewf8eWyrobN3+Mqq+ggdGLYP3Zzx0dNJUaa+WwMqwxISLsxP8FLnag8dTjV/mIrklYa9fO+3aVC40kD9GBVVJmKNRQT5KbfVzTds4otOiLp70IIr0n1DBZU/WMM4h9AbiorlMfUL03TY7lVgq9F7sHlneer/bSz1cS+VokPP/HfgFh1SbUDyj+7DKaSBqQ8iEAKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz1gqIWWsKdIgKvBwJLn8N3sahAW1xLtDaWTiYno8Kg=;
 b=g3gjK90/aij5CRF09zNZD7oOHnzw51Rkn79+Y9XMwqF2BcCUIg+qN64IsQqz2AC1HYu6QZd3exLYDucvNiKspqYx+UF5ztlYa9cI+aCLzLmwe0OhWU1l0IdcQTC0aIn40IJmRG2ZbQ59nVec552YViMQuKaeuq3BZNpz1mL1LlVQtRWzlX04Yx4aUcCZC6UXFzyTtKddzVBYfzdMwfVHkUiW7CzB4eshsNhaDknk1xpmc8fzI28gxQ8hrTeO/9EfOQOhTqfKpH+y7168DvUw74yHgBc1yDrfxVFfbwYJ+KtDIXLqwlYaPyVj+5CP04yk/4ondSqfb3gukgTmoXsaJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 18 Aug 2026 12:46:57 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/3] xen/arm: validate IRQs before descriptor lookup
Message-ID: <ug4fcrlmwbanszl2iiri5pwnpaae3o6gwinyiy2vvvjex6x522@spvoir2ps3ti>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1786385827.git.mykola_kvach@epam.com>
 <271952244ae71ade885b3619fe161ed4f47777fa.1786385827.git.mykola_kvach@epam.com>
 <272a8622-47c2-4cbb-a98c-8242561cbdb8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <272a8622-47c2-4cbb-a98c-8242561cbdb8@amd.com>
X-ClientProxiedBy: WA1PEPF00005B9A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::638) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AMBPR03MB11696:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ccbbef7-ea33-4df5-bbd0-08defd0da719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|6133799003|5023799004|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MQ7Roe3Mzt2iA63cG8dUpQ7I6Y5NzXJTuSumnNVUcYYP1cfxRfb3q8wH13SqZvIZ5OmbzO9cV7GOBt4D3rbGY3LO0VJP2EjfPYkwZhqQ2NVjlitcxvg4sPk09tS9g3tX9YkVpoqi6ZSkSGa4y7a4HwzyWHwJ8Sz4TXZ87SNchdb40TTRZD83fXObwePl/Q76XvFQAIH8j81+mT/YS2z5AsHtJ/H+N6QIsUtaGbDz71rCQd0NuxCfgA6H+TA2Q2n/S0woVL8XVJuuh5c6rQEyaSrwWvdWgxx4Br5/7yWlcDUZ1qNXfQJe4GGLeWniAx8fBDlZpuoN3QWVWIjhxyMNfflZnUzo31lUSoTnoZViTxXttT8c5zfZQzjrYzk9F4qQPI59nOrCCzSdy098VOI5fSoOFq2HwxwKAT7fj08Ucc2axwUSFecXPY9OEmGElx9cF3pdjmHeU7wdcnfgOzV3tbD7VAV1KaKULDp48lfnSi+YYkZdG/UoHZn7ztP+pCbFUh+oqpt6eoTOE22WxHLkov7ozgQWxhFyQm2nX2T083X24A81eiXC3EdUBfH/cNxMmR7HHb0VbyDRZ7yViKh4xztW9FitTWs48jdpTeftlzzk5ayU5ScgUynqCK2dWJ5xjDasu45VEJCorlilt6ciBfjucaHcD/qdTQueDljDbPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(6133799003)(5023799004)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDRvVkM4T0NMYTVnVjJIU0V2U3hmTDFLbnNvandGKzBidEFBZ05yakF1b3gv?=
 =?utf-8?B?KzIwamI4L0k2TmZVRjJDa3N5b3oyWHpjb1YyWGJXeDVWYndmd1ZDQ2xhQmJT?=
 =?utf-8?B?MWZkc0Q1UHh3QkgzZUkycEhBR3NYNGZLNEJ3ODlWMGQxb1dTcXd3N3Yvd2dB?=
 =?utf-8?B?WXBBU005RDRabG9OTFlaZ2wzUTlYSUM3YWh6L2M0b044czBObjRsSTRwelJu?=
 =?utf-8?B?eXZHMnNDaGdwTTBtUTU3TEozdHB2Uyt6aHhtaE5reDFyQWtxQWt3ZkVibUJN?=
 =?utf-8?B?YVlabzV5Vjk0bCt4V0g4c2JqMHVvUThBUVUwcHZEQS8rOGFsWDNWaFlmQzFE?=
 =?utf-8?B?M1F0Nkt3aVFsMnhtdkI3dkVTeC92ZmY4VWI1Uy9UbnV5NlV0bmthdFd3U2Va?=
 =?utf-8?B?Mm1zdVZlNnNWRlpvOVlsMW4vVFAwYTM1TnhiYm9yVWFBQmRGdjdKS3hTU1RU?=
 =?utf-8?B?b05URms0KzFvN3hpOFgxdXJsTm1TUlJwUDY4ZXhUSDF3aWs3TjFiVENBclVm?=
 =?utf-8?B?bjE0eTNSQ2s2emVCMVNNVjNWWndsTlpTVVE0bk0xUHhrZ2pVME5aKzZRNkVy?=
 =?utf-8?B?Z2Vkd3ZzV3FEN004KzJuYjN2MXk3RVZ6NVJGY3poZFNpUTIvNTY2WDNiN0I2?=
 =?utf-8?B?SnBicG1LOVRzVDlWcmNZSGF0a1pVRjhOand6KzRUbUpZU2Y3eEF0Y2FlZERM?=
 =?utf-8?B?aTIrRlZrY0xXUEw2S1hvMS9ESHR5Z2tZeXUxbjkrSjJOL0lhQnVhOVgySnhm?=
 =?utf-8?B?UUlxdllRZGZIRmIrbHdldERZdjkzVzFsTm9sajRhMXIzOXVwRVJBTWllTGtF?=
 =?utf-8?B?L0lueXZTZFJ2N1NLT1N3Z04rNXJqVDlSd2svY3BNV0Z2STVVSlljVkl4Z3Aw?=
 =?utf-8?B?RkhVak5SZlBuQitBSmVZQ1dLNVNHL3F6aDdoQTU4MnZGc3RzZGJqVVlGSGFQ?=
 =?utf-8?B?ZHF2ZUJyc2ViOUR3c1NxQXFpam9DL0p5MlpJL2Z6MUxGN3ZyZVl1KzVNM3hM?=
 =?utf-8?B?ZWJKbWx6VEVoUmpGYks1ejJCRzZwdEd6eEtDNWdsVHZKVW11M0phRHF0M0lu?=
 =?utf-8?B?d29tazMybG9ldVNYditOb2ZINlZ3NUxGZEkyQVdENXU2NFZCYTNDY0xublh2?=
 =?utf-8?B?d2RMSEJHSmd4UEcrNHNJMDFORVJrTFNyZW41MklERG5TLzArbFlWQ2liWWY0?=
 =?utf-8?B?K042WmdDZjZrdGhTMFBCUnlvSXhBZjl5ZVVOTHh4YXAvdHVPZTc0bU9scUlS?=
 =?utf-8?B?YWJIT2V0SUQvbFpzOVlyWHNXNWlWL2F4aURMd2RhUXdhNTBhdmVvUlFjMzYr?=
 =?utf-8?B?VG9PR2R6R094K3ppNDdqWG9NVHM2QTVSeStqRjlodDFEMi9Wb0UzRHlCbFpT?=
 =?utf-8?B?LzdrUEUxOXhhaC9reFNSSng2RlIzWmZBek1zZjJWNjAzMTNTZDJxYzJQbWFZ?=
 =?utf-8?B?ckVBQmF4T2dEYlJJL2prY01hYUtQRWlZOEtXWnB1alU0aFBVV2pEM2dDWG5j?=
 =?utf-8?B?MGtOM3l3MGozak4xVDd4T3MzMnpYUjMwVE5ZMHdEQ0ZSZWhJdzR6djFMWXQr?=
 =?utf-8?B?VjBrTWh2OXlLUnhPenUrcldvMEpIaE9IaktuSGtRNmZDZXI0eTd5QnBsMmo0?=
 =?utf-8?B?dFlCamZtRlRIeUVyOHpJd081YkVkWlI5VnZUQUhCN21sNGVqSThIaUNPV0Nz?=
 =?utf-8?B?VndxOWhJbnZTUFJmVXJ2TUZjWFlLL1RiNlRzaGFpZTdnTll3R2gxUlNxR0N4?=
 =?utf-8?B?MmtwSkNlcGJSREdqTXlFVlA4Z3hYdjIvNjcvS2lXL3AxWGpySDkwcGN3aHFS?=
 =?utf-8?B?SDJFRndaV3R1SmVQdjJrUG9Zd096TmFhZGxOekdkaHZGUWlOTUdHNjYyN2Q5?=
 =?utf-8?B?cXRQL3pSOUVWMVdVYXB4TjdkNko1c3FRTHdOd3EwUXRTcUxUcHFSbzFrTTht?=
 =?utf-8?B?ODV6OExUNzkxbTArWFNKQnFHSk8rbjU1YWlGLytxZDM5TEk2VW1NSmhieDhs?=
 =?utf-8?B?a08yT3JZdkR2NTU1eFBYKzJGSEc0VGl0MHdrMTIyMzB1VkNuUU1RVHhKV1B5?=
 =?utf-8?B?V2hLMnVvN1U5dGgxdHFVcDd0UmovQ0hIWkNkQWY4NDkyRG1DK2NQWStZR3FN?=
 =?utf-8?B?K011MC9IQkxnSi9pRnlSYVJZcEkxaGNBSUxDM2E4eXNNdVozQ2I5ZS9FWE5J?=
 =?utf-8?B?UFJWWENiUUpKTVlIVksvaFFzSDFsclpiLzlrSXNjM3pnSXdQSFJ6UHRTWUla?=
 =?utf-8?B?dlpPUUhvcHQ4bzNrR1RUQTZzcjNhdmJCNWpxeFJFTVlRVmpwRVJMMU0xTzFj?=
 =?utf-8?B?alJLaU5QemduWExXZ2dnbkxpdnIxWTJ6VVlVMlc5blNhMHJTbDhIQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccbbef7-ea33-4df5-bbd0-08defd0da719
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:47:01.5715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLM5UWn5A5/4tW/34Is7WC7vQCz2oQmZ/C33vew3Cpoe6d39d9DopNqbtLSb2BMCbXXVYKrr9MMjnjmtccG4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11696
X-purgate-ID: tlsNG-ebf023/1787046423-C3AC0B50-9B7E7D29/0/0
X-purgate-type: clean
X-purgate-size: 4785

Hi Michal,

Thank you for the review.

On Tue, Aug 11, 2026 at 10:51:47AM +0200, Orzel, Michal wrote:
> 
> 
> On 10-Aug-26 20:38, Mykola Kvach wrote:
> > GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
> > through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
> > and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
> > INTIDs 1024 through 4095 have no backing descriptors.
> > 
> > Validation based only on nr_irqs accepts an INTID in this gap.
> > __irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
> > update unrelated Xen memory.
> > 
> > Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
> > looking up a descriptor. irq_set_spi_type() can run before the implemented
> > GIC line counts are available, so validate descriptor-backed ranges there
> > before looking up a descriptor.
> > 
> > Call is_espi() unconditionally in __irq_to_desc() and provide an
> > espi_to_desc() stub when eSPI support is disabled. This preserves the
> > is_espi() debug check for eSPI-range INTIDs when support is disabled.
> > 
> > Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - Validate descriptor-backed ranges in irq_set_spi_type().
> > - Validate implemented GIC lines in setup_irq().
> > - Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
> > ---
> >  xen/arch/arm/irq.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> > index 73e58a5108..0f5d3496bf 100644
> > --- a/xen/arch/arm/irq.c
> > +++ b/xen/arch/arm/irq.c
> > @@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
> >                                          (ESPI_MAX_INTID + 1) :
> >                                          NR_IRQS;
> >  
> > +static bool irq_has_desc(unsigned int irq)
> > +{
> > +    return irq < NR_IRQS ||
> > +           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
> This IS_ENABLED reads redundant because is_espi() contains #ifdef
> CONFIG_GICV3_ESPI inside. AFAICT you added it here to prevent the !ESPI build
> from reaching ASSERT inside is_espi() when the irq is in ESPI range. I don't
> like the ASSERT inside is_espi(). I think it does not make much sense in a
> helper that should really just tell us whether the IRQ is in ESPI range or not.
> It should be up to the caller to decide what to do based on whether ESPI is
> compiled in or not. I think this cleanup would be best to be done first. If you
> don't want to do that, at least document this in the commit msg because others
> may be tempted to drop this IS_ENABLED.

Ack. I’ll add a preparatory cleanup patch making is_espi() a pure
range predicate and keep the configuration handling at the call sites.

> 
> > +}
> > +
> >  static unsigned int local_irqs_type[NR_LOCAL_IRQS];
> >  static DEFINE_SPINLOCK(local_irqs_type_lock);
> >  
> > @@ -77,6 +83,12 @@ static int __init init_espi_data(void)
> >  }
> >  #else
> >  
> > +static struct irq_desc *espi_to_desc(unsigned int irq)
> > +{
> > +    ASSERT_UNREACHABLE();
> > +    return NULL;
> > +}
> > +
> >  static int __init init_espi_data(void)
> >  {
> >      return 0;
> > @@ -90,10 +102,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
> >      if ( irq < NR_LOCAL_IRQS )
> >          return &this_cpu(local_irq_desc)[irq];
> >  
> > -#ifdef CONFIG_GICV3_ESPI
> >      if ( is_espi(irq) )
> >          return espi_to_desc(irq);
> > -#endif
> >  
> >      return &irq_desc[irq-NR_LOCAL_IRQS];
> Nothing here covers 1024..4095. I think we should add at least:
> ASSERT(irq < NR_IRQS) like we discussed some time ago.

Ack, I’ll restore the assertion before indexing irq_desc[].

> 
> >  }
> > @@ -416,6 +426,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
> >      struct irq_desc *desc;
> >      bool disabled;
> >  
> > +    if ( !gic_is_valid_line(irq) )
> > +        return -EINVAL;
> > +
> >      desc = irq_to_desc(irq);
> >  
> >      spin_lock_irqsave(&desc->lock, flags);
> > @@ -647,13 +660,19 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
> >  int irq_set_spi_type(unsigned int spi, unsigned int type)
> >  {
> >      unsigned long flags;
> > -    struct irq_desc *desc = irq_to_desc(spi);
> > +    struct irq_desc *desc;
> >      int ret = -EBUSY;
> >  
> > -    /* This function should not be used for other than SPIs */
> This is an important line that you should keep.

Ack.

Best regards,
Mykola

